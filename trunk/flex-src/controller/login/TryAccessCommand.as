package controller.login
{
	import model.TryAccessProxy;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class TryAccessCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{			
			if (facade.hasProxy(TryAccessProxy.NAME)){
				Alert.show("TryCommand");
				var tryAccessProxy:TryAccessProxy = facade.retrieveProxy(TryAccessProxy.NAME) as TryAccessProxy;
				tryAccessProxy.tryAccess();
			} else {
				Alert.show("TryCommandNew");
				var newTryAccessProxy:TryAccessProxy = new TryAccessProxy(TryAccessProxy.NAME);
				newTryAccessProxy.tryAccess();
				facade.registerProxy(newTryAccessProxy);								
			}			
		}
	}
}