package controller.login
{
	import model.login.LoginProxy;
	import model.vo.VOUser;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.MacroCommand;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class DoLoginCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var user:VOUser = notification.getBody() as VOUser;
			if (facade.hasProxy(LoginProxy.NAME)){
				var loginProxy:LoginProxy = facade.retrieveProxy(LoginProxy.NAME) as LoginProxy;				
				loginProxy.doLogin(user.username as String, user.password as String);				
			} else {				
				var newLoginProxy:LoginProxy = new LoginProxy(LoginProxy.NAME);				
				newLoginProxy.doLogin(user.username as String, user.password as String);
				facade.registerProxy(newLoginProxy);
			}			
		}		
	}
}