package controller.loginaffiliate
{
	import model.loginaffiliate.AffiliateTryAccessProxy;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class TryAccessCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var userType:String = notification.getBody() as String;
			if (facade.hasProxy(AffiliateTryAccessProxy.NAME)){				
				var tryAccessProxy:AffiliateTryAccessProxy = facade.retrieveProxy(AffiliateTryAccessProxy.NAME) as AffiliateTryAccessProxy;
				tryAccessProxy.tryAccess(userType);
			} else {				
				var newTryAccessProxy:AffiliateTryAccessProxy = new AffiliateTryAccessProxy(AffiliateTryAccessProxy.NAME);
				newTryAccessProxy.tryAccess(userType);
				facade.registerProxy(newTryAccessProxy);								
			}			
		}
	}
}