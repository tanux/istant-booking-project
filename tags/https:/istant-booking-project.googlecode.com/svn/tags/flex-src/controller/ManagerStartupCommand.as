package controller
{
	import controller.loginmanager.DoLogoutCommand;
	import controller.loginmanager.TryAccessCommand;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.ManagerMainMediator;
	
	public class ManagerStartupCommand extends SimpleCommand implements ICommand{
		public static const USER_TYPE:String = "managers";
		override public function execute(notification:INotification):void{			
			var managerMain:ManagerMain = notification.getBody() as ManagerMain;
			if (!facade.hasMediator(ManagerMainMediator.NAME)){
				facade.registerMediator(new ManagerMainMediator(managerMain));	
			}						
			facade.registerCommand(ApplicationFacade.MANAGER_TRY_ACCESS,TryAccessCommand);			
			facade.sendNotification(ApplicationFacade.MANAGER_TRY_ACCESS,USER_TYPE);
			facade.registerCommand(ApplicationFacade.MANAGER_DO_LOGOUT, DoLogoutCommand);
		}
	}
}