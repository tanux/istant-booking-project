package controller.login
{
	import model.login.TryAccessProxy;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class TryAccessCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var userType:String = notification.getBody() as String;
			if (facade.hasProxy(TryAccessProxy.NAME)){				
				var tryAccessProxy:TryAccessProxy = facade.retrieveProxy(TryAccessProxy.NAME) as TryAccessProxy;
				tryAccessProxy.tryAccess(userType);
			} else {				
				var newTryAccessProxy:TryAccessProxy = new TryAccessProxy(TryAccessProxy.NAME);
				newTryAccessProxy.tryAccess(userType);
				facade.registerProxy(newTryAccessProxy);								
			}			
		}
	}
}