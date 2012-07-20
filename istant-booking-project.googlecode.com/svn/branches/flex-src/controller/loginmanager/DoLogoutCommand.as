package controller.loginmanager
{
	import model.loginmanager.ManagerLogoutProxy;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class DoLogoutCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{			
			if (facade.hasProxy(ManagerLogoutProxy.NAME)){
				var logoutProxy:ManagerLogoutProxy = facade.retrieveProxy(ManagerLogoutProxy.NAME) as ManagerLogoutProxy;				
				logoutProxy.doLogout();				
			} else {				
				var newLogoutProxy:ManagerLogoutProxy = new ManagerLogoutProxy(ManagerLogoutProxy.NAME);				
				newLogoutProxy.doLogout();
				facade.registerProxy(newLogoutProxy);
			}			
		}
	}
}