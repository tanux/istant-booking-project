package controller
{
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.AffiliateMainMediator;
	
	public class AffiliateStartupCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			Alert.show("Mediator OK");
			var affiliateMain:AffiliateMain = notification.getBody() as AffiliateMain;
			facade.registerMediator(new AffiliateMainMediator(affiliateMain));
			
		}
	}
}