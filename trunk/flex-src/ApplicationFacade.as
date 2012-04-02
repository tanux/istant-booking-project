package
{
	/**
	 * Sede di tutte le notifiche Singleton
	 * */
	import controller.StartupCommand;
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade implements IFacade{
		public static const STARTUP:String = "Startup";
		public static const LOGIN:String = "Login";
		public static const LOGOUT:String = "Logout";
		public static const DO_LOGIN:String = "DoLogin";
		public static const DO_REGISTER:String = "DoRegister";
		public static const CONFIRM_REGISTER:String = "ConfirmRegister";
		public static const REGISTER_SUCCES:String = "RegisterSuccess";
		public static const REGISTER_ERROR:String = "RegisterError";
		public static const BACK_TO_LOGIN:String = "TornaLogin";
		public static const LOGIN_SUCCESS:String = "LoginSuccess";
		public static const LOGIN_ERROR:String = "LoginError";
		public static const LOGIN_FAULT:String = "LoginFault";		
		
		public static function getInstance() : ApplicationFacade {
			if (instance == null)
				instance = new ApplicationFacade();
			return instance as ApplicationFacade;
		}		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(ApplicationFacade.STARTUP, StartupCommand);			
		}		
	}
}