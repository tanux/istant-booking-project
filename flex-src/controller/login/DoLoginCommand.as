package controller.login
{
	import model.login.LoginProxy;
	import model.vo.GenericUser;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.MacroCommand;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class DoLoginCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var genericUser:GenericUser = notification.getBody() as GenericUser;
			if (facade.hasProxy(LoginProxy.NAME)){
				var loginProxy:LoginProxy = facade.retrieveProxy(LoginProxy.NAME) as LoginProxy;				
				loginProxy.doLogin(genericUser);				
			} else {				
				var newLoginProxy:LoginProxy = new LoginProxy(LoginProxy.NAME);				
				facade.registerProxy(newLoginProxy);
				newLoginProxy.doLogin(genericUser);				
			}			
		}		
	}
}