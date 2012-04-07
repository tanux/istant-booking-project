package controller.login
{
	import model.login.LogoutProxy;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class DoLogoutCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			if (facade.hasProxy(LogoutProxy.NAME)){
				var logoutProxy:LogoutProxy = facade.retrieveProxy(LogoutProxy.NAME) as LogoutProxy;				
				logoutProxy.doLogout();				
			} else {				
				var newLogoutProxy:LogoutProxy = new LogoutProxy(LogoutProxy.NAME);				
				newLogoutProxy.doLogout();
				facade.registerProxy(newLogoutProxy);
			}			
		}
	}
}