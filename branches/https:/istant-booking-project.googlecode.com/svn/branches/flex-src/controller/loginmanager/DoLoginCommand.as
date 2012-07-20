package controller.loginmanager
{
	import model.loginmanager.ManagerLoginProxy;
	import model.vo.GenericUser;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class DoLoginCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var genericUser:GenericUser = notification.getBody() as GenericUser;
			if (facade.hasProxy(ManagerLoginProxy.NAME)){
				var loginProxy:ManagerLoginProxy = facade.retrieveProxy(ManagerLoginProxy.NAME) as ManagerLoginProxy;				
				loginProxy.doLogin(genericUser);				
			} else {				
				var newLoginProxy:ManagerLoginProxy = new ManagerLoginProxy(ManagerLoginProxy.NAME);				
				facade.registerProxy(newLoginProxy);
				newLoginProxy.doLogin(genericUser);				
			}			
		}		
	}
}