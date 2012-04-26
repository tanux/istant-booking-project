package view
{
	import controller.loginmanager.DoLoginCommand;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.GenericUser;
	import model.vo.Manager;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class ManagerMainMediator extends Mediator implements IMediator{
		public static const NAME:String = "ManagerMainMediator";
		public static const USER_TYPE:String = "managers";
		
		public function ManagerMainMediator(viewComponent:Object){
			super(NAME, viewComponent);
			managerMain.addEventListener(FlexEvent.CREATION_COMPLETE, init);
			managerMain.cmpLoginFormManager.btnLogin.addEventListener(MouseEvent.CLICK, doLogin);
		}
		
		private function init(evt:Event) : void {}
		
		private function doLogin(evt:Event):void{			
			var manager:Manager = new Manager();			
			manager.username = managerMain.cmpLoginFormManager.tiUsername.text
			manager.password = managerMain.cmpLoginFormManager.tiPassword.text;			
			var genericUser:GenericUser = new GenericUser(USER_TYPE);
			genericUser.setUserAsManager = manager;
			facade.sendNotification(ApplicationFacade.MANAGER_DO_LOGIN, genericUser);
		}
		
		private function goToSetting(evt:Event):void{
			managerMain.currentState = "stateSettings";
		}
		
		private function doLogout(evt:Event):void{
			facade.sendNotification(ApplicationFacade.MANAGER_DO_LOGOUT);
		}
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){
				case ApplicationFacade.MANAGER_LOGGED_IN:
					managerMain.currentState = "stateMainApplication";
					var managerLoggedIn:Manager = notification.getBody() as Manager;
					managerMain.cmpControlBar.txUserLoggedIn.text = "Dott."+managerLoggedIn.lastname+" "+managerLoggedIn.firstname;
					managerMain.cmpControlBar.btnSettings.addEventListener(MouseEvent.CLICK, goToSetting);
					break;
				case ApplicationFacade.MANAGER_EXECUTE_LOGIN:
					facade.registerCommand(ApplicationFacade.MANAGER_DO_LOGIN, DoLoginCommand);
					managerMain.currentState = "stateLogin";
					break;
				case ApplicationFacade.MANAGER_LOGIN_SUCCESS:
					managerMain.currentState = "stateMainApplication";
					var manager:Manager = notification.getBody() as Manager;
					managerMain.cmpControlBar.txUserLoggedIn.text = "Dott."+manager.lastname+" "+manager.firstname;
					managerMain.cmpControlBar.btnSettings.addEventListener(MouseEvent.CLICK, goToSetting);
					managerMain.cmpControlBar.btnLogout.addEventListener(MouseEvent.CLICK, doLogout);
					break;
				case ApplicationFacade.MANAGER_LOGIN_ERROR:
					Alert.show("Autenticazione Fallita: inserire i dati corretti");
					break;
				case ApplicationFacade.MANAGER_LOGOUT_SUCCESS:
					managerMain.currentState = "stateLogin";
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.MANAGER_LOGGED_IN,
				ApplicationFacade.MANAGER_EXECUTE_LOGIN,
				ApplicationFacade.MANAGER_LOGIN_SUCCESS,
				ApplicationFacade.MANAGER_LOGIN_ERROR,
				ApplicationFacade.MANAGER_LOGOUT_SUCCESS
			];
		}
				
		
		public function get managerMain():ManagerMain{
			return viewComponent as ManagerMain;
		}
	}
}