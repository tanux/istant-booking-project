package controller
{
	import controller.loginaffiliate.DoLogoutCommand;
	import controller.loginaffiliate.TryAccessCommand;
	import controller.registeraffiliate.ConfirmRegisterCommand;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.AffiliateMainMediator;
	
	public class AffiliateStartupCommand extends SimpleCommand implements ICommand{
		public static const USER_TYPE:String = "affiliates";
		override public function execute(notification:INotification):void{			
			var affiliateMain:AffiliateMain = notification.getBody() as AffiliateMain;
			facade.registerMediator(new AffiliateMainMediator(affiliateMain));
			facade.registerCommand(ApplicationFacade.CONFIRM_REGISTER, ConfirmRegisterCommand);
			facade.registerCommand(ApplicationFacade.AFFILIATE_TRY_ACCESS,TryAccessCommand);			
			facade.sendNotification(ApplicationFacade.AFFILIATE_TRY_ACCESS,USER_TYPE);
			facade.registerCommand(ApplicationFacade.AFFILIATE_DO_LOGOUT, DoLogoutCommand); 
		}
	}
}