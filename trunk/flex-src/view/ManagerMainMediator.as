package view
{
	import com.adobe.serializers.json.JSONDecoder;
	import com.adobe.serializers.json.JSONEncoder;
	import com.hillelcoren.assets.skins.FacebookSkin;
	
	import controller.loginmanager.DoLoginCommand;
	import controller.managermain.BookingAddCommand;
	import controller.managermain.BookingDeleteCommand;
	import controller.managermain.BookingGetListCommand;	
	import controller.managermain.CustomerGetListCommand;
	import controller.managermain.GetBusyHoursCommand;
	import controller.managermain.LocationGetListCommand;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Booking;
	import model.vo.Customer;
	import model.vo.GenericUser;
	import model.vo.Location;
	import model.vo.Manager;
	
	import mx.collections.ArrayCollection;
	import mx.containers.TitleWindow;
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.events.FlexEvent;
	import mx.managers.CursorManager;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.BookingList;
	import view.component.ConfirmBookingWindow;
	import view.component.VisitDay;
	import view.component.VisitHours;
	import view.manager.bookings.BookingListMediator;
	import view.manager.main.ConfirmBookingWindowMediator;
	import view.manager.main.CustomerListMediator;
	import view.manager.main.VisitDayMediator;
	import view.manager.main.VisitHoursMediator;
	import view.manager.main.VisitLocationMediator;
	import view.manager.settings.LocationListMediator;
	
	public class ManagerMainMediator extends Mediator implements IMediator{
		public static const NAME:String = "ManagerMainMediator";
		public static const USER_TYPE:String = "managers";
		
		public static const NAME_VISIT_LOCATION_MEDIATOR_MAIN:String = "VisitLocationMediatorMain";
		public static const NAME_VISIT_DAY_MEDIATOR_MAIN:String = "VisitDayMediatorMain";
		
		public static const NAME_VISIT_LOCATION_MEDIATOR_SHOWBOOKING:String = "VisitLocationMediatorShowBooking";
		public static const NAME_VISIT_DAY_MEDIATOR_SHOWBOOKING:String = "VisitDayMediatorShowBooking";
		
		public static const NAME_BOOKING_LIST_MEDIATOR:String = "BookingListMediator";
		public static const NAME_BOOKING_DELETED_LIST_MEDIATOR:String = "BookingDeletedListMediator";
				
		public var manager:Manager;
		private var confirmBookingTitleWindow:TitleWindow;
		
		public function ManagerMainMediator(viewComponent:Object){
			super(NAME, viewComponent);
			managerMain.addEventListener(FlexEvent.CREATION_COMPLETE, init);
			managerMain.addEventListener(managerMain.SETTINGS_MANAGER_CREATED, registerSettingsManager);	
		}

		private function checkDataBooking (event:Event):void{
			var customerListMediator:CustomerListMediator = facade.retrieveMediator(CustomerListMediator.NAME) as CustomerListMediator;
			if (customerListMediator.custom){
				var visitLocationMediator: VisitLocationMediator = facade.retrieveMediator(NAME_VISIT_LOCATION_MEDIATOR_MAIN) as VisitLocationMediator;
				if (visitLocationMediator.loc){
					var visitDayMediator: VisitDayMediator = facade.retrieveMediator(NAME_VISIT_DAY_MEDIATOR_MAIN) as VisitDayMediator;
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
		
		private function showConfirmBooking():void{
			confirmBookingTitleWindow = PopUpManager.createPopUp(managerMain, ConfirmBookingWindow, true) as TitleWindow;			
			PopUpManager.centerPopUp(confirmBookingTitleWindow);
			var booking:Booking = new Booking();
			booking.idManager = manager.id;
			booking.idCustomer = managerMain.cmpCustomerList.customerSelected as Customer;			
			booking.idLocation = managerMain.cmpVisitProperties.cmpLocations.locationSelected as Location;
			booking.visitDay = managerMain.cmpVisitProperties.cmpVisitDay.selectedDate;			
			booking.visitHour = managerMain.cmpVisitProperties.cmpVisitHours.hourSelected;
			facade.registerMediator( new ConfirmBookingWindowMediator (confirmBookingTitleWindow) );
			if (facade.hasMediator(ConfirmBookingWindowMediator.NAME)){
				var window:ConfirmBookingWindow =  facade.retrieveMediator( ConfirmBookingWindowMediator.NAME ).getViewComponent() as ConfirmBookingWindow;
				window.booking = booking;
			}			
		}
		
		private function init(evt:Event) : void {}
		
		private function registerSettingsManager(evt:Event):void{			
			facade.registerMediator(new LocationListMediator(managerMain.cmpManagementLocation.cmpLocationList));			
		}
		
		private function doLogin(evt:Event):void{	
			CursorManager.setBusyCursor();					

			var manager:Manager = new Manager();			
			manager.username = managerMain.cmpLoginFormManager.tiUsername.textInput.text
			manager.password = managerMain.cmpLoginFormManager.tiPassword.textInput.text;			

			var genericUser:GenericUser = new GenericUser(USER_TYPE);
			genericUser.setUserAsManager = manager;
			facade.sendNotification(ApplicationFacade.MANAGER_DO_LOGIN, genericUser);
		}		
		
		private function goToHome(evt:Event):void{
			CursorManager.setBusyCursor();
			managerMain.currentState = "stateMainApplication";
			CursorManager.removeBusyCursor();			
			
			if ( !facade.hasMediator(NAME_VISIT_DAY_MEDIATOR_MAIN) &&
				!facade.hasMediator(VisitHoursMediator.NAME) ){
				facade.registerMediator(new VisitDayMediator(NAME_VISIT_DAY_MEDIATOR_MAIN,managerMain.cmpVisitProperties.cmpVisitDay));
				facade.registerMediator(new VisitHoursMediator(managerMain.cmpVisitProperties.cmpVisitHours));
				trace("HOME: Mediator creati");
			}
		}
		
		private function goToShowBooking(evt:Event):void{
			CursorManager.setBusyCursor();
			managerMain.currentState = "stateShowBooking";
			CursorManager.removeBusyCursor();
			
			managerMain.cmpLocations.boxSede.enabled = true;
			managerMain.cmpCalendar.boxDay.enabled = true;		
			
			
			if ( !facade.hasMediator(NAME_VISIT_LOCATION_MEDIATOR_SHOWBOOKING) && !facade.hasMediator(NAME_VISIT_DAY_MEDIATOR_SHOWBOOKING) ){
				sendNotification(ApplicationFacade.GET_LOCATION_LIST);
				facade.registerMediator(new VisitLocationMediator(NAME_VISIT_LOCATION_MEDIATOR_SHOWBOOKING,managerMain.cmpLocations));
				facade.registerMediator(new VisitDayMediator(NAME_VISIT_DAY_MEDIATOR_SHOWBOOKING,managerMain.cmpCalendar));
				trace("ShowBooking: mediator creati");
			}
			
			if ( !facade.hasMediator(NAME_BOOKING_LIST_MEDIATOR) && !facade.hasMediator(NAME_BOOKING_DELETED_LIST_MEDIATOR) ){
				facade.registerMediator(new BookingListMediator(NAME_BOOKING_LIST_MEDIATOR, managerMain.cmpBookingList));
				facade.registerMediator(new BookingListMediator(NAME_BOOKING_DELETED_LIST_MEDIATOR, managerMain.cmpBookingDeletedList));
			}
			
			if ( !facade.hasCommand(ApplicationFacade.GET_BOOKING_LIST) && !facade.hasCommand(ApplicationFacade.BOOKING_DELETE) ){
				facade.registerCommand(ApplicationFacade.GET_BOOKING_LIST, BookingGetListCommand);
				facade.registerCommand(ApplicationFacade.BOOKING_DELETE, BookingDeleteCommand);
			}			
		}
		
		private function goToSetting(evt:Event):void{
			CursorManager.setBusyCursor();
			managerMain.currentState = "stateSettings";
			CursorManager.removeBusyCursor();			
			sendNotification(ApplicationFacade.GET_LOCATION_LIST);			
		}
		
		private function doLogout(evt:Event):void{
			CursorManager.setBusyCursor();
			facade.sendNotification(ApplicationFacade.MANAGER_DO_LOGOUT);
		}
		
		private function initMain():void{
			managerMain.cmpControlBar.btnSettings.addEventListener(MouseEvent.CLICK, goToSetting);
			managerMain.cmpControlBar.btnLogout.addEventListener(MouseEvent.CLICK, doLogout);
			managerMain.cmpControlBar.btnHome.addEventListener(MouseEvent.CLICK, goToHome);
			managerMain.cmpControlBar.btnShowVisit.addEventListener(MouseEvent.CLICK, goToShowBooking);
			managerMain.cmpCustomerList.btnBooking.addEventListener(MouseEvent.CLICK, checkDataBooking);
			
			facade.registerMediator(new CustomerListMediator(managerMain.cmpCustomerList));			
			facade.registerMediator(new VisitLocationMediator(NAME_VISIT_LOCATION_MEDIATOR_MAIN,managerMain.cmpVisitProperties.cmpLocations));
			facade.registerMediator(new VisitDayMediator(NAME_VISIT_DAY_MEDIATOR_MAIN,managerMain.cmpVisitProperties.cmpVisitDay));
			facade.registerMediator(new VisitHoursMediator(managerMain.cmpVisitProperties.cmpVisitHours));
			
			facade.registerCommand(ApplicationFacade.GET_CUSTOMER_LIST,CustomerGetListCommand);
			facade.registerCommand(ApplicationFacade.GET_LOCATION_LIST, LocationGetListCommand);
			facade.registerCommand(ApplicationFacade.BOOKING_ADD, BookingAddCommand);			
			
			sendNotification(ApplicationFacade.GET_CUSTOMER_LIST);
			sendNotification(ApplicationFacade.GET_LOCATION_LIST);
		}
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){
				case ApplicationFacade.MANAGER_LOGGED_IN:
					managerMain.currentState = "stateMainApplication";
					manager = notification.getBody() as Manager;
					managerMain.cmpControlBar.txUserLoggedIn.text = "Dott."+manager.lastname+" "+manager.firstname;
					initMain();					
					break;
				case ApplicationFacade.MANAGER_EXECUTE_LOGIN:
					facade.registerCommand(ApplicationFacade.MANAGER_DO_LOGIN, DoLoginCommand);
					managerMain.currentState = "stateLogin";
					managerMain.cmpLoginFormManager.btnLogin.addEventListener(MouseEvent.CLICK, doLogin);
					break;
				case ApplicationFacade.MANAGER_LOGIN_SUCCESS:
					CursorManager.removeBusyCursor();
					managerMain.currentState = "stateMainApplication";
					manager = notification.getBody() as Manager;
					managerMain.cmpControlBar.txUserLoggedIn.text = "Dott."+manager.lastname+" "+manager.firstname;
					initMain();					
					break;
				case ApplicationFacade.MANAGER_LOGIN_ERROR:
					CursorManager.removeBusyCursor();
					Alert.show("Autenticazione Fallita: inserire i dati corretti");
					break;
				case ApplicationFacade.MANAGER_LOGOUT_SUCCESS:
					CursorManager.removeBusyCursor();
					managerMain.currentState = "stateLogin";
					managerMain.cmpLoginFormManager.tiPassword.textInput.text="pwd";
					managerMain.cmpLoginFormManager.tiPassword.textInput.showCancelButton=false;
					managerMain.cmpLoginFormManager.tiUsername.textInput.text="Username";
					managerMain.cmpLoginFormManager.tiUsername.textInput.showCancelButton=false;
					break;
				case ApplicationFacade.MANAGER_LOGIN_FAULT:					
					var message:String = notification.getBody() as String;
					Alert.show(message);
					break;
				case ApplicationFacade.CUSTOMER_SELECTED:
					managerMain.cmpVisitProperties.cmpLocations.boxSede.enabled = true;
					break;
				case ApplicationFacade.LOCATION_SELECTED_MAIN:
					managerMain.cmpVisitProperties.cmpVisitDay.boxDay.enabled = true;
					break;
				case ApplicationFacade.DATE_SELECTED:
					managerMain.cmpVisitProperties.cmpVisitHours.vbHours.enabled = true;
					break;
				case ApplicationFacade.BOOKING_ADD_SUCCESS:
					managerMain.cmpVisitProperties.cmpLocations.boxSede.enabled = false;
					managerMain.cmpVisitProperties.cmpVisitDay.boxDay.enabled = false;
					managerMain.cmpVisitProperties.cmpVisitHours.vbHours.enabled = false;					
					var visitLocationMediator: VisitLocationMediator = facade.retrieveMediator(NAME_VISIT_LOCATION_MEDIATOR_MAIN) as VisitLocationMediator;
					visitLocationMediator.loc = false;					
					var visitDayMediator: VisitDayMediator = facade.retrieveMediator(NAME_VISIT_DAY_MEDIATOR_MAIN) as VisitDayMediator;
					visitDayMediator.day = false;					
					var visitHoursMediator: VisitHoursMediator = facade.retrieveMediator(VisitHoursMediator.NAME) as VisitHoursMediator;
					visitHoursMediator.hour = false;										
					var customerListMediator: CustomerListMediator = facade.retrieveMediator(CustomerListMediator.NAME) as CustomerListMediator;
					customerListMediator.customerListCmp.dgCustomerList.selectedIndex = -1;
					customerListMediator.resetTextInput();					
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.MANAGER_LOGGED_IN,
				ApplicationFacade.MANAGER_EXECUTE_LOGIN,
				ApplicationFacade.MANAGER_LOGIN_SUCCESS,
				ApplicationFacade.MANAGER_LOGIN_ERROR,
				ApplicationFacade.MANAGER_LOGOUT_SUCCESS,
				ApplicationFacade.MANAGER_LOGIN_FAULT,
				ApplicationFacade.CUSTOMER_SELECTED,
				ApplicationFacade.LOCATION_SELECTED_MAIN,
				ApplicationFacade.DATE_SELECTED,
				ApplicationFacade.BOOKING_ADD_SUCCESS
			];
		}		
		
		public function get managerMain():ManagerMain{
			return viewComponent as ManagerMain;			
		}
	}
}