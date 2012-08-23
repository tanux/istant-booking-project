package controller.loginaffiliate
{
	import model.loginaffiliate.AffiliateLogoutProxy;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class DoLogoutCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{			
			if (facade.hasProxy(AffiliateLogoutProxy.NAME)){
				var logoutProxy:AffiliateLogoutProxy = facade.retrieveProxy(AffiliateLogoutProxy.NAME) as AffiliateLogoutProxy;				
				logoutProxy.doLogout();				
			} else {				
				var newLogoutProxy:AffiliateLogoutProxy = new AffiliateLogoutProxy(AffiliateLogoutProxy.NAME);				
				newLogoutProxy.doLogout();
				facade.registerProxy(newLogoutProxy);
			}			
		}
	}
}