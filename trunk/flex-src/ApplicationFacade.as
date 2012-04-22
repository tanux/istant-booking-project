package
{
	/**
	 * Sede di tutte le notifiche Singleton
	 * */
	import controller.AffiliateStartupCommand;
	import controller.StartupCommand;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade implements IFacade{
		public static const STARTUP:String = "Startup";
		public static const STARTUP_AFFILIATE_APP:String = "StartupAffiliateApp";
		
		/*Authentication Notify*/
		//public static const LOGIN:String = "Login";
		public static const DO_LOGIN:String = "DoLogin";
		public static const LOGIN_SUCCESS:String = "LoginSuccess";
		public static const LOGIN_ERROR:String = "LoginError";
		public static const LOGIN_FAULT:String = "LoginFault";
		
		public static const DO_LOGOUT:String = "DoLogout";
		public static const LOGOUT_SUCCESS:String = "LogoutSuccess";
		public static const LOGOUT_ERROR:String = "LogoutError";
		public static const LOGOUT_FAULT:String = "LogoutFault";
		
		public static const TRY_ACCESS:String = "TryAccess";
		public static const EXECUTE_LOGIN:String= "ExecuteLogin";
		public static const LOGGED_IN:String = "LoggedIn";
		public static const BACK_TO_LOGIN:String = "TornaLogin";
		
		/*Registration Notify*/
		public static const CONFIRM_REGISTER:String = "ConfirmRegistration";
		public static const REGISTER_AFFILIATE_SUCCES:String = "RegisterAffiliateSucces";
		public static const REGISTER_AFFILIATE_ERROR:String = "RegisterAffiliateError";
		public static const REGISTER_AFFILIATE_FAULT:String = "RegisterAffiliateFault";
		
		public static function getInstance() : ApplicationFacade{
			if (instance == null)
				instance = new ApplicationFacade();
			return instance as ApplicationFacade;
		}		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(ApplicationFacade.STARTUP_AFFILIATE_APP, AffiliateStartupCommand);
			//registerCommand(ApplicationFacade.STARTUP, StartupCommand);			
		}		
	}
}