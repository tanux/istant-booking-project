package view
{
	import flash.events.Event;
	
	import model.vo.VOUser;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class MainApplicationMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "MainApplicationMediator";
		public function MainApplicationMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);
			mainApplication.addEventListener(FlexEvent.CREATION_COMPLETE, init);
		}
		private function init(evt:Event) : void {}
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.LOGIN_SUCCESS:
					mainApplication.currentState = "stateMainApplication";
					var user:VOUser = notification.getBody() as VOUser;
					mainApplication.user = user;					
					break;
				case ApplicationFacade.LOGIN_ERROR:
					Alert.show("Autenticazione non riuscita");
					break;								
				case ApplicationFacade.BACK_TO_LOGIN:
					mainApplication.currentState = "login";
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.LOGIN_SUCCESS,
				ApplicationFacade.LOGIN_ERROR,				
				ApplicationFacade.BACK_TO_LOGIN,
			];	
		}		
		public function get mainApplication():Test{ 
			return viewComponent as Test;
		}
		
	}
}