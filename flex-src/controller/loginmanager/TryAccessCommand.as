package controller.loginmanager
{
	import model.loginmanager.ManagerTryAccessProxy;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class TryAccessCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var userType:String = notification.getBody() as String;
			if (facade.hasProxy(ManagerTryAccessProxy.NAME)){				
				var tryAccessProxy:ManagerTryAccessProxy = facade.retrieveProxy(ManagerTryAccessProxy.NAME) as ManagerTryAccessProxy;
				tryAccessProxy.tryAccess(userType);
			} else {				
				var newTryAccessProxy:ManagerTryAccessProxy = new ManagerTryAccessProxy(ManagerTryAccessProxy.NAME);
				newTryAccessProxy.tryAccess(userType);
				facade.registerProxy(newTryAccessProxy);								
			}			
		}
	}
}