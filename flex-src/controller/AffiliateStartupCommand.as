package controller
{
	import controller.login.TryAccessCommand;
	import controller.registeraffiliate.ConfirmRegisterCommand;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.AffiliateMainMediator;
	
	public class AffiliateStartupCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{			
			var affiliateMain:AffiliateMain = notification.getBody() as AffiliateMain;
			facade.registerMediator(new AffiliateMainMediator(affiliateMain));
			facade.registerCommand(ApplicationFacade.CONFIRM_REGISTER, ConfirmRegisterCommand);
			facade.registerCommand(ApplicationFacade.TRY_ACCESS,TryAccessCommand);			
			facade.sendNotification(ApplicationFacade.TRY_ACCESS,this);
		}
	}
}