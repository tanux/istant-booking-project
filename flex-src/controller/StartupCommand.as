package controller
{
	import controller.login.DoLoginCommand;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.MainApplicationMediator;
	import view.login.LoginFormMediator;
	
	
	public class StartupCommand extends SimpleCommand implements ICommand{
		
		override public function execute(notification:INotification):void{
			
			var mainApplication:Test = notification.getBody() as Test; //prendo il component mxml
			
			facade.registerMediator(new MainApplicationMediator(mainApplication));
			facade.registerMediator(new LoginFormMediator(mainApplication.loginForm));			
			
			facade.registerCommand(ApplicationFacade.DO_LOGIN, DoLoginCommand);
						
		}
	}
}