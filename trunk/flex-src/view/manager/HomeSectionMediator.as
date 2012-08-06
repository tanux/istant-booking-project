package view.manager
{
	import controller.managermain.BookingAddCommand;
	import controller.managermain.CustomerGetListCommand;
	import controller.managermain.GetAvailableDayCommand;
	import controller.managermain.LocationGetListCommand;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
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
		
		public function HomeSectionMediator(viewComponent:Object){
			super(NAME, viewComponent);
			cmpHome.addEventListener(FlexEvent.CREATION_COMPLETE, initSection);
			cmpHome.cmpCustomerList.btnBooking.addEventListener(MouseEvent.CLICK, checkDataBooking);
			cmpHome.addEventListener(VisitLocations.LOCATION_SELECTED_EVENT, notifyLocationSelected);
		}
		
		private function initSection(evt:Event){
			facade.registerMediator(new CustomerSectionMediator(cmpHome.cmpCustomerList));			
			facade.registerMediator(new VisitLocationMediator(VisitLocationMediator.NAME_IN_HOME,cmpHome.cmpVisitProperties.cmpLocations));
			facade.registerMediator(new VisitDayMediator(VisitDayMediator.NAME_IN_HOME,cmpHome.cmpVisitProperties.cmpVisitDay));
			facade.registerMediator(new VisitHoursMediator(cmpHome.cmpVisitProperties.cmpVisitHours));
			
			facade.registerCommand(ApplicationFacade.GET_CUSTOMER_LIST,CustomerGetListCommand);
			facade.registerCommand(ApplicationFacade.GET_LOCATION_LIST, LocationGetListCommand);
			facade.registerCommand(ApplicationFacade.BOOKING_ADD, BookingAddCommand);
			
			facade.registerCommand(ApplicationFacade.GET_NO_AVAILABLE_DAY_HOME, GetAvailableDayCommand);
			
			sendNotification(ApplicationFacade.GET_CUSTOMER_LIST);
			sendNotification(ApplicationFacade.GET_LOCATION_LIST);
		}
		
		private function notifyLocationSelected(evt:Event):void{			
			sendNotification(ApplicationFacade.GET_NO_AVAILABLE_DAY_HOME, cmpHome.cmpVisitProperties.cmpLocations.locationSelected);
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
			facade.registerMediator( new ConfirmBookingWindowMediator (confirmBookingTitleWindow) );
			if (facade.hasMediator(ConfirmBookingWindowMediator.NAME)){
				var window:ConfirmBookingWindow =  facade.retrieveMediator( ConfirmBookingWindowMediator.NAME ).getViewComponent() as ConfirmBookingWindow;
				window.booking = booking;
			}			
		}
		
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
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){
				case ApplicationFacade.ACTIVE_HOME_SECTION:
					facade.removeMediator(VisitLocationMediator.NAME_IN_BOOKING);
					facade.removeMediator(VisitDayMediator.NAME_IN_BOOKING);
					facade.registerMediator(new VisitLocationMediator(VisitLocationMediator.NAME_IN_HOME,cmpHome.cmpVisitProperties.cmpLocations));
					facade.registerMediator(new VisitDayMediator(VisitDayMediator.NAME_IN_HOME,cmpHome.cmpVisitProperties.cmpVisitDay));					
					break;
				case ApplicationFacade.CUSTOMER_SELECTED_HOMESECTION:
					cmpHome.cmpVisitProperties.cmpLocations.boxSede.enabled = true;
					break;
				case ApplicationFacade.LOCATION_SELECTED_HOMESECTION:
					cmpHome.cmpVisitProperties.cmpVisitDay.boxDay.enabled = true;
					break;
				case ApplicationFacade.DATE_SELECTED:
					cmpHome.cmpVisitProperties.cmpVisitHours.vbHours.enabled = true;
					break;
				case ApplicationFacade.BOOKING_ADD_SUCCESS:
					cmpHome.cmpVisitProperties.cmpLocations.boxSede.enabled = false;
					cmpHome.cmpVisitProperties.cmpVisitDay.boxDay.enabled = false;
					cmpHome.cmpVisitProperties.cmpVisitHours.vbHours.enabled = false;					
					var visitLocationMediator: VisitLocationMediator = facade.retrieveMediator(VisitLocationMediator.NAME_IN_HOME) as VisitLocationMediator;
					visitLocationMediator.loc = false;					
					var visitDayMediator: VisitDayMediator = facade.retrieveMediator(VisitDayMediator.NAME_IN_HOME) as VisitDayMediator;
					visitDayMediator.day = false;					
					var visitHoursMediator: VisitHoursMediator = facade.retrieveMediator(VisitHoursMediator.NAME) as VisitHoursMediator;
					visitHoursMediator.hour = false;										
					var customerListMediator: CustomerSectionMediator = facade.retrieveMediator(CustomerSectionMediator.NAME) as CustomerSectionMediator;
					customerListMediator.customerListCmp.dgCustomerList.selectedIndex = -1;
					customerListMediator.resetTextInput();					
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.ACTIVE_HOME_SECTION,
				ApplicationFacade.CUSTOMER_SELECTED_HOMESECTION,
				ApplicationFacade.LOCATION_SELECTED_HOMESECTION,				
				ApplicationFacade.DATE_SELECTED,
				ApplicationFacade.BOOKING_ADD_SUCCESS
			];
		}
		
		public function get cmpHome():HomeSection{
			return viewComponent as HomeSection;			
		}
	}
}