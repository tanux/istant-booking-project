package controller.registeraffiliate
{
	import model.registeraffiliate.RegisterAffiliateProxy;
	import model.vo.Affiliate;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class ConfirmRegisterCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var affiliate:Affiliate = notification.getBody() as Affiliate;
			if (facade.hasProxy(RegisterAffiliateProxy.NAME)){
				var registerAffiliateProxy:RegisterAffiliateProxy = facade.retrieveProxy(RegisterAffiliateProxy.NAME) as RegisterAffiliateProxy;
				registerAffiliateProxy.saveAffiliateData(affiliate);
			}
			else{
				var registerAffiliateProxy:RegisterAffiliateProxy = new RegisterAffiliateProxy(RegisterAffiliateProxy.NAME);
				registerAffiliateProxy.saveAffiliateData(affiliate);
				facade.registerProxy(registerAffiliateProxy);
			}
		}
	}
}