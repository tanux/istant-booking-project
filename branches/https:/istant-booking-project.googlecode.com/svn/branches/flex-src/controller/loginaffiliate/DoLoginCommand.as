package controller.loginaffiliate
{
	import model.loginaffiliate.AffiliateLoginProxy;
	import model.vo.GenericUser;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.MacroCommand;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class DoLoginCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var genericUser:GenericUser = notification.getBody() as GenericUser;
			if (facade.hasProxy(AffiliateLoginProxy.NAME)){
				var loginProxy:AffiliateLoginProxy = facade.retrieveProxy(AffiliateLoginProxy.NAME) as AffiliateLoginProxy;				
				loginProxy.doLogin(genericUser);				
			} else {				
				var newLoginProxy:AffiliateLoginProxy = new AffiliateLoginProxy(AffiliateLoginProxy.NAME);				
				facade.registerProxy(newLoginProxy);
				newLoginProxy.doLogin(genericUser);				
			}			
		}		
	}
}