package view.login
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.VOUser;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.LoginForm;
	
	public class LoginFormMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "LoginMediator";
		
		public function LoginFormMediator(viewComponent:Object){
			super(NAME, viewComponent);			
			login.btnLogin.addEventListener(MouseEvent.CLICK, doLogin);
		}
		
		public function doLogin(evt:Event):void{			
			var user:VOUser = new VOUser();
			user.username = login.tiUsername.text as String;
			user.password = login.tiPassword.text as String;
			facade.sendNotification(ApplicationFacade.DO_LOGIN,user);
		}
		
		public function doRegister(evt:Event):void{
			facade.sendNotification(ApplicationFacade.DO_REGISTER);
		}		
		
		override public function handleNotification(notification:INotification):void{ 
			
		}	
		
		override public function listNotificationInterests():Array{
			return [];	
		}		
		
		public function get login():LoginForm{			
			return viewComponent as LoginForm;
		}		
	}
}