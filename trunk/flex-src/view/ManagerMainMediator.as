package view
{
	import controller.loginmanager.DoLoginCommand;
	import controller.managermain.CustomerGetListCommand;
	import controller.managermain.LocationGetListCommand;
	
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
	
	import view.manager.main.CustomerListMediator;
	import view.manager.settings.LocationListMediator;
	
	public class ManagerMainMediator extends Mediator implements IMediator{
		public static const NAME:String = "ManagerMainMediator";
		public static const USER_TYPE:String = "managers";
		
		public function ManagerMainMediator(viewComponent:Object){
			super(NAME, viewComponent);
			managerMain.addEventListener(FlexEvent.CREATION_COMPLETE, init);
			managerMain.addEventListener(managerMain.SETTINGS_MANAGER_CREATED, registerSettingsManager);
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
		
		private function goToSetting(evt:Event):void{
			CursorManager.setBusyCursor();
			managerMain.currentState = "stateSettings";
			CursorManager.removeBusyCursor();
			facade.registerCommand(ApplicationFacade.GET_LOCATION_LIST,LocationGetListCommand);
			facade.sendNotification(ApplicationFacade.GET_LOCATION_LIST);
		}
		
		private function goToHome(evt:Event):void{
			CursorManager.setBusyCursor();
			managerMain.currentState = "stateMainApplication";
			CursorManager.removeBusyCursor();
		}
		
		private function goToShowVisit(evt:Event):void{
			CursorManager.setBusyCursor();
			managerMain.currentState = "stateShowBooking";
			CursorManager.removeBusyCursor();
		}
		
		private function doLogout(evt:Event):void{
			CursorManager.setBusyCursor();
			facade.sendNotification(ApplicationFacade.MANAGER_DO_LOGOUT);
		}
		
		private function changeStateManager():void{
			managerMain.cmpControlBar.btnSettings.addEventListener(MouseEvent.CLICK, goToSetting);
			managerMain.cmpControlBar.btnLogout.addEventListener(MouseEvent.CLICK, doLogout);
			managerMain.cmpControlBar.btnHome.addEventListener(MouseEvent.CLICK, goToHome);
			managerMain.cmpControlBar.btnShowVisit.addEventListener(MouseEvent.CLICK, goToShowVisit);
			facade.registerMediator(new CustomerListMediator(managerMain.cmpCustomerList));					
			facade.registerCommand(ApplicationFacade.GET_CUSTOMER_LIST,CustomerGetListCommand);
			facade.sendNotification(ApplicationFacade.GET_CUSTOMER_LIST);
		}	
		
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){
				case ApplicationFacade.MANAGER_LOGGED_IN:
					managerMain.currentState = "stateMainApplication";
					var managerLoggedIn:Manager = notification.getBody() as Manager;
					managerMain.cmpControlBar.txUserLoggedIn.text = "Dott."+managerLoggedIn.lastname+" "+managerLoggedIn.firstname;
					changeStateManager();					
					break;
				case ApplicationFacade.MANAGER_EXECUTE_LOGIN:
					facade.registerCommand(ApplicationFacade.MANAGER_DO_LOGIN, DoLoginCommand);
					managerMain.currentState = "stateLogin";
					managerMain.cmpLoginFormManager.btnLogin.addEventListener(MouseEvent.CLICK, doLogin);
					break;
				case ApplicationFacade.MANAGER_LOGIN_SUCCESS:
					CursorManager.removeBusyCursor();
					managerMain.currentState = "stateMainApplication";
					var manager:Manager = notification.getBody() as Manager;
					managerMain.cmpControlBar.txUserLoggedIn.text = "Dott."+manager.lastname+" "+manager.firstname;
					changeStateManager();					
					break;
				case ApplicationFacade.MANAGER_LOGIN_ERROR:
					CursorManager.removeBusyCursor();
					Alert.show("Autenticazione Fallita: inserire i dati corretti");
					break;
				case ApplicationFacade.MANAGER_LOGOUT_SUCCESS:
					CursorManager.removeBusyCursor();
					managerMain.currentState = "stateLogin";
					break;
				case ApplicationFacade.MANAGER_LOGIN_FAULT:					
					Alert.show("Fault: Errore di comunicazione con il server");
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
				ApplicationFacade.MANAGER_LOGIN_FAULT				
			];
		}		
		
		public function get managerMain():ManagerMain{
			return viewComponent as ManagerMain;			
		}
	}
}