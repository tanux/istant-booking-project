package view
{
	import controller.login.DoLoginCommand;
	import controller.login.DoLogoutCommand;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.elements.BreakElement;
	
	import model.vo.VOUser;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.login.LoginFormMediator;
	
	public class MainApplicationMediator extends Mediator implements IMediator{
		public static const NAME:String = "MainApplicationMediator";
		
		public function MainApplicationMediator(viewComponent:Object){
			super(NAME, viewComponent);
			mainApplication.addEventListener(FlexEvent.CREATION_COMPLETE, init);			 
		}
		private function init(evt:Event) : void {}
		
		public function doLogout(evt:Event):void{
			sendNotification(ApplicationFacade.DO_LOGOUT);
		}
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){				
				case ApplicationFacade.EXECUTE_LOGIN:
					facade.registerMediator(new LoginFormMediator(mainApplication.loginForm));
					facade.registerCommand(ApplicationFacade.DO_LOGIN, DoLoginCommand);
					mainApplication.currentState = "login";
					break;
				case ApplicationFacade.LOGIN_SUCCESS:					
					var user:VOUser = notification.getBody() as VOUser;
					mainApplication.user = user;	
					mainApplication.currentState = "stateMainApplication";
					mainApplication.btnLogout.addEventListener(MouseEvent.CLICK, doLogout);					
					facade.registerCommand(ApplicationFacade.DO_LOGOUT, DoLogoutCommand);
					break;
				case ApplicationFacade.LOGIN_ERROR:
					Alert.show("Autenticazione non riuscita");
					break;
				case ApplicationFacade.LOGGED_IN:					
					var userLoggedIn:VOUser = notification.getBody() as VOUser;
					mainApplication.user = userLoggedIn;
					mainApplication.currentState = "stateMainApplication";					
					break;
				case ApplicationFacade.LOGOUT_SUCCESS:
					mainApplication.currentState = "login";
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [				
				ApplicationFacade.EXECUTE_LOGIN,
				ApplicationFacade.LOGIN_SUCCESS,
				ApplicationFacade.LOGIN_ERROR,
				ApplicationFacade.LOGGED_IN,
				ApplicationFacade.LOGOUT_SUCCESS
			];	
		}		
		
		public function get mainApplication():Test{ 
			return viewComponent as Test;
		}
	}
}