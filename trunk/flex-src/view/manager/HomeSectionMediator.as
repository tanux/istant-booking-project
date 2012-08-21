package view.manager
{
	import controller.managermain.BookingAddCommand;
	import controller.managermain.CustomerGetListCommand;
	import controller.managermain.GetAvailableDayCommand;
	import controller.managermain.LocationGetListCommand;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.TouchscreenType;
	
	import model.vo.Booking;
	import model.vo.Customer;
	import model.vo.Location;
	import model.vo.Manager;
	
	import mx.containers.TitleWindow;
	import mx.controls.Alert;	
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;	
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.ManagerMainMediator;
	import view.component.ConfirmBookingWindow;
	import view.component.HomeSection;
	import view.component.VisitLocations;
	import view.manager.main.ConfirmBookingWindowMediator;
	import view.manager.main.CustomerSectionMediator;
	import view.manager.main.VisitDayMediator;
	import view.manager.main.VisitHoursMediator;
	import view.manager.main.VisitLocationMediator;
	
	public class HomeSectionMediator extends Mediator implements IMediator{
		public static const NAME:String = "HomeMediator";		
		private var confirmBookingTitleWindow:TitleWindow;
		[Bindable]public var abilitaHelp: Boolean = true;
		public function HomeSectionMediator(viewComponent:Object){
			super(NAME, viewComponent);
			initSection();
			//cmpHome.chbHelp.addEventListener(Event.CHANGE, activeHelp); 
		}
		/*
		private function activeHelp(evt:Event):void{			
			if (cmpHome.chbHelp.selected){
				Alert.show("Suggerimenti Attivati");				
				abilitaHelp = true;
			}
			else {
				Alert.show("Suggerimenti Disattivati");
				abilitaHelp = false;
			}
		}
		*/
		
		private function initSection():void{
			if (!facade.hasMediator(CustomerSectionMediator.NAME)){
				facade.registerMediator(new CustomerSectionMediator(cmpHome.cmpCustomerList));
			}
			if (!facade.hasCommand(ApplicationFacade.GET_CUSTOMER_LIST)){
				facade.registerCommand(ApplicationFacade.GET_CUSTOMER_LIST,CustomerGetListCommand);	
			}
			facade.sendNotification(ApplicationFacade.GET_CUSTOMER_LIST);
			if (!facade.hasMediator(VisitLocationMediator.NAME_IN_HOME)){
				facade.registerMediator(new VisitLocationMediator(VisitLocationMediator.NAME_IN_HOME,cmpHome.cmpVisitProperties.cmpLocations));
			}
			if (!facade.hasCommand(ApplicationFacade.GET_LOCATION_LIST)){
				facade.registerCommand(ApplicationFacade.GET_LOCATION_LIST, LocationGetListCommand);	
			}
			facade.sendNotification(ApplicationFacade.GET_LOCATION_LIST);			
			if (!facade.hasMediator(VisitDayMediator.NAME_IN_HOME)){
				facade.registerMediator(new VisitDayMediator(VisitDayMediator.NAME_IN_HOME,cmpHome.cmpVisitProperties.cmpVisitDay));
			}
			if (!facade.hasMediator(VisitHoursMediator.NAME)){
				facade.registerMediator(new VisitHoursMediator(cmpHome.cmpVisitProperties.cmpVisitHours));
			}
			if (!facade.hasCommand(ApplicationFacade.BOOKING_ADD)){
				facade.registerCommand(ApplicationFacade.BOOKING_ADD, BookingAddCommand);	
			}
			if (!facade.hasCommand(ApplicationFacade.GET_NO_AVAILABLE_DAY_HOME)){
				facade.registerCommand(ApplicationFacade.GET_NO_AVAILABLE_DAY_HOME, GetAvailableDayCommand);	
			}
		}
		
		private function showConfirmBooking():void{			
			confirmBookingTitleWindow = PopUpManager.createPopUp(cmpHome, ConfirmBookingWindow, true) as TitleWindow;			
			PopUpManager.centerPopUp(confirmBookingTitleWindow);
			var booking:Booking = new Booking();
			var managerMainMediator:ManagerMainMediator = facade.retrieveMediator(ManagerMainMediator.NAME) as ManagerMainMediator; 
			booking.idManager = managerMainMediator.manager.id; 
			booking.idCustomer = cmpHome.cmpCustomerList.customerSelected as Customer;			
			booking.idLocation = cmpHome.cmpVisitProperties.cmpLocations.locationSelected as Location;
			booking.visitDay = cmpHome.cmpVisitProperties.cmpVisitDay.selectedDate;			
			booking.visitHour = cmpHome.cmpVisitProperties.cmpVisitHours.hourSelected;
			if (!facade.hasMediator(ConfirmBookingWindowMediator.NAME)){
				facade.registerMediator( new ConfirmBookingWindowMediator (confirmBookingTitleWindow) );	
			}			
			if (facade.hasMediator(ConfirmBookingWindowMediator.NAME)){
				var window:ConfirmBookingWindow =  facade.retrieveMediator( ConfirmBookingWindowMediator.NAME ).getViewComponent() as ConfirmBookingWindow;
				window.booking = booking;
			}			
		}
		/*
		private function checkDataBooking (event:Event):void{
			var customerListMediator:CustomerSectionMediator = facade.retrieveMediator(CustomerSectionMediator.NAME) as CustomerSectionMediator;
			if (customerListMediator.custom){
				var visitLocationMediator:VisitLocationMediator = facade.retrieveMediator(VisitLocationMediator.NAME_IN_HOME) as VisitLocationMediator;
				if (visitLocationMediator.loc){
					var visitDayMediator:VisitDayMediator = facade.retrieveMediator(VisitDayMediator.NAME_IN_HOME) as VisitDayMediator;
					if(visitDayMediator.day){
						var visitHoursMediator: VisitHoursMediator = facade.retrieveMediator(VisitHoursMediator.NAME) as VisitHoursMediator;
						if(visitHoursMediator.hour){
							showConfirmBooking();
						}
						else{
							Alert.show("ATTENZIONE! Ora non selezionata!");
						}
					}
					else{
						Alert.show("ATTENZIONE! Giorno non selezionato!");
					}
				}else{
					Alert.show("ATTENZIONE! Sede non selezionata!");
				}
			}
			else {
				Alert.show("ATTENZIONE! Devi selezionare un utente per poter prenotare");
			}			
		}
		*/
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){				
				case ApplicationFacade.CUSTOMER_SELECTED_HOMESECTION:
					cmpHome.cmpVisitProperties.cmpLocations.boxSede.enabled = true;					
					break;
				case ApplicationFacade.LOCATION_SELECTED_ACCORDION_HOME:
					cmpHome.cmpVisitProperties.cmpVisitDay.boxDay.enabled = true;						
					break;
				case ApplicationFacade.DATE_SELECTED:
					cmpHome.cmpVisitProperties.cmpVisitHours.boxHours.enabled = true;
					/**if (abilitaHelp){
						destroyBigTip();
						cmpHome.cmpVisitProperties.imgDay.visible = false;
						cmpHome.cmpVisitProperties.imgHour.visible = true;
						cmpHome.cmpVisitProperties.imgHour.addEventListener(MouseEvent.ROLL_OVER, function(){ createBigTip(MouseEvent as MouseEvent,TOOTTIP_HOUR, 700,330 )});
					}**/					
					break;
				case ApplicationFacade.HOUR_SELECTED:
					showConfirmBooking();
					break;
				case ApplicationFacade.BOOKING_ADD_SUCCESS:
					cmpHome.cmpVisitProperties.cmpLocations.boxSede.enabled = false;
					cmpHome.cmpVisitProperties.cmpVisitDay.boxDay.enabled = false;
					cmpHome.cmpVisitProperties.cmpVisitHours.boxHours.enabled = false;					
					var visitLocationMediator: VisitLocationMediator = facade.retrieveMediator(VisitLocationMediator.NAME_IN_HOME) as VisitLocationMediator;
					visitLocationMediator.loc = false;					
					var visitDayMediator: VisitDayMediator = facade.retrieveMediator(VisitDayMediator.NAME_IN_HOME) as VisitDayMediator;
					visitDayMediator.day = false;					
					var visitHoursMediator: VisitHoursMediator = facade.retrieveMediator(VisitHoursMediator.NAME) as VisitHoursMediator;
					visitHoursMediator.hour = false;										
					var customerListMediator: CustomerSectionMediator = facade.retrieveMediator(CustomerSectionMediator.NAME) as CustomerSectionMediator;
					customerListMediator.customerListCmp.dgCustomerList.selectedIndex = -1;
					customerListMediator.resetTextInput();
					cmpHome.cmpVisitProperties.cmpLocations.boxSede.enabled=false;
					cmpHome.cmpVisitProperties.cmpVisitDay.boxDay.enabled=false;
					cmpHome.cmpVisitProperties.cmpVisitHours.boxHours.enabled=false;
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [				
				ApplicationFacade.CUSTOMER_SELECTED_HOMESECTION,
				ApplicationFacade.LOCATION_SELECTED_ACCORDION_HOME,				
				ApplicationFacade.DATE_SELECTED,
				ApplicationFacade.BOOKING_ADD_SUCCESS,		
				ApplicationFacade.HOUR_SELECTED,				
			];
		}
		
		public function get cmpHome():HomeSection{
			return viewComponent as HomeSection;			
		}
	}
}