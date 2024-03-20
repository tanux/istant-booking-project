package view
{
	import controller.loginmanager.DoLoginCommand;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.GenericUser;
	import model.vo.Manager;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	import mx.managers.CursorManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.tylerchesley.bark.managers.NotificationManager;
	
	import view.manager.BookingSectionMediator;
	import view.manager.HomeSectionMediator;
	import view.manager.SettingsSectionMediator;
	import view.manager.bookings.BookingListMediator;
	import view.manager.main.CustomerSectionMediator;
	import view.manager.main.VisitDayMediator;
	import view.manager.main.VisitHoursMediator;
	import view.manager.main.VisitLocationMediator;
	
	
	public class ManagerMainMediator extends Mediator implements IMediator{
		public static const NAME:String = "ManagerMainMediator";
		public static const USER_TYPE:String = "managers";
		
		public var manager:Manager;
		public var manager2:Manager;
		
		public function ManagerMainMediator(viewComponent:Object){
			super(NAME, viewComponent);		
		}	
		
		private function initMain():void{
			managerMain.cmpControlBar.btnHome.addEventListener(MouseEvent.CLICK, goToHome);
			managerMain.cmpControlBar.btnSettings.addEventListener(MouseEvent.CLICK, goToSetting);
			managerMain.cmpControlBar.btnShowVisit.addEventListener(MouseEvent.CLICK, goToShowBooking);			
			managerMain.cmpControlBar.btnLogout.addEventListener(MouseEvent.CLICK, doLogout);
			if (!facade.hasMediator(HomeSectionMediator.NAME)){
				facade.registerMediator(new HomeSectionMediator(managerMain.cmpHomeSection));
			}
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
		
		private function doLogout(evt:Event):void{
			CursorManager.setBusyCursor();
			facade.sendNotification(ApplicationFacade.MANAGER_DO_LOGOUT);
		}
		
		private function goToHome(evt:Event):void{			
			CursorManager.setBusyCursor();
			managerMain.currentState = "stateMainApplication";
			CursorManager.removeBusyCursor();
			if (!facade.hasMediator(HomeSectionMediator.NAME)){
				facade.registerMediator(new HomeSectionMediator(managerMain.cmpHomeSection));	
			}
			managerMain.cmpHomeSection.cmpVisitProperties.cmpLocations.boxSede.enabled = false;
			managerMain.cmpHomeSection.cmpVisitProperties.cmpVisitDay.boxDay.enabled = false;
			managerMain.cmpHomeSection.cmpVisitProperties.cmpVisitHours.boxHours.enabled = false;			
		}
		
		private function goToSetting(evt:Event):void{
			CursorManager.setBusyCursor();
			managerMain.currentState = "stateSettings";
			CursorManager.removeBusyCursor();			
			if (!facade.hasMediator(SettingsSectionMediator.NAME)){
				facade.registerMediator(new SettingsSectionMediator(managerMain.cmpSettingsSection));	
			}			
		}
		
		private function goToShowBooking(evt:Event):void{
			CursorManager.setBusyCursor();
			managerMain.currentState = "stateShowBooking";
			CursorManager.removeBusyCursor();	
			managerMain.cmpBookingSection.cmpLocations.boxSede.enabled = true;
			managerMain.cmpBookingSection.cmpCalendar.boxDay.enabled = false;			
			if (!facade.hasMediator(BookingSectionMediator.NAME)){
				facade.registerMediator(new BookingSectionMediator(managerMain.cmpBookingSection));	
			}			
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
				case ApplicationFacade.MANAGER_LOGIN_FAULT:					
					var message:String = notification.getBody() as String;
					Alert.show(message);
					break;
				case ApplicationFacade.MANAGER_LOGOUT_SUCCESS:
					CursorManager.removeBusyCursor();
					managerMain.currentState = "stateLogin";
					managerMain.cmpLoginFormManager.tiPassword.textInput.text="pwd";
					managerMain.cmpLoginFormManager.tiPassword.textInput.showCancelButton=false;
					managerMain.cmpLoginFormManager.tiUsername.textInput.text="Username";
					managerMain.cmpLoginFormManager.tiUsername.textInput.showCancelButton=false;
					break;					
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.MANAGER_LOGGED_IN,
				ApplicationFacade.MANAGER_EXECUTE_LOGIN,
				ApplicationFacade.MANAGER_LOGIN_SUCCESS,
				ApplicationFacade.MANAGER_LOGIN_ERROR,
				ApplicationFacade.MANAGER_LOGIN_FAULT,
				ApplicationFacade.MANAGER_LOGOUT_SUCCESS,			
			];
		}		
		
		public function get managerMain():ManagerMain{
			return viewComponent as ManagerMain;			
		}
	}
}
