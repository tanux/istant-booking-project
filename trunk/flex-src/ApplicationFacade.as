package
{
	/**
	 * Sede di tutte le notifiche Singleton
	 * */
	import controller.AffiliateStartupCommand;
	import controller.ManagerStartupCommand;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;	
	
	public class ApplicationFacade extends Facade implements IFacade{
		public static const STARTUP:String = "Startup";
		public static const STARTUP_AFFILIATE_APP:String = "StartupAffiliateApp";
		public static const STARTUP_MANAGER_APP:String = "StartupManagerApp";
		
		
		/*Authentication Notify*/
		/*Affiliate*/
		public static const AFFILIATE_DO_LOGIN:String = "AffiliateDoLogin";
		public static const AFFILIATE_LOGIN_SUCCESS:String = "AffiliateLoginSuccess";
		public static const AFFILIATE_LOGIN_ERROR:String = "AffiliateLoginError";
		public static const AFFILIATE_LOGIN_FAULT:String = "AffiliateLoginFault";
		
		public static const AFFILIATE_DO_LOGOUT:String = "AffiliateDoLogout";
		public static const AFFILIATE_LOGOUT_SUCCESS:String = "AffiliateLogoutSuccess";
		public static const AFFILIATE_LOGOUT_ERROR:String = "AffiliateLogoutError";
		public static const AFFILIATE_LOGOUT_FAULT:String = "AffiliateLogoutFault";
		
		public static const AFFILIATE_TRY_ACCESS:String = "AffiliateTryAccess";
		public static const AFFILIATE_EXECUTE_LOGIN:String= "AffiliateExecuteLogin";
		public static const AFFILIATE_LOGGED_IN:String = "AffiliateLoggedIn";
		public static const AFFILIATE_BACK_TO_LOGIN:String = "AffiliateTornaLogin";
		
		/*Manager*/
		public static const MANAGER_DO_LOGIN:String = "ManagerDoLogin";
		public static const MANAGER_LOGIN_SUCCESS:String = "ManagerLoginSuccess";
		public static const MANAGER_LOGIN_ERROR:String = "ManagerLoginError";
		public static const MANAGER_LOGIN_FAULT:String = "ManagerLoginFault";
		
		public static const MANAGER_DO_LOGOUT:String = "ManagerDoLogout";
		public static const MANAGER_LOGOUT_SUCCESS:String = "ManagerLogoutSuccess";
		public static const MANAGER_LOGOUT_ERROR:String = "ManagerLogoutError";
		public static const MANAGER_LOGOUT_FAULT:String = "ManagerLogoutFault";
		
		public static const MANAGER_TRY_ACCESS:String = "ManagerTryAccess";
		public static const MANAGER_EXECUTE_LOGIN:String= "ManagerExecuteLogin";
		public static const MANAGER_LOGGED_IN:String = "ManagerLoggedIn";
		public static const MANAGER_BACK_TO_LOGIN:String = "ManagerTornaLogin";
		
		/*Affiliate Registration Notify*/
		public static const CONFIRM_REGISTER:String = "ConfirmRegistration";
		public static const REGISTER_AFFILIATE_SUCCES:String = "RegisterAffiliateSucces";
		public static const REGISTER_AFFILIATE_ERROR:String = "RegisterAffiliateError";
		public static const REGISTER_AFFILIATE_FAULT:String = "RegisterAffiliateFault";
		
		/*Customer Notify*/
		public static const GET_CUSTOMER_LIST:String = "GetCustomerList";
		public static const GET_CUSTOMER_LIST_SUCCESS:String = "GetCustomerListSuccess";
		public static const GET_CUSTOMER_LIST_ERROR:String = "GetCustomerListError";
		public static const GET_CUSTOMER_LIST_FAULT:String = "GetCustomerListFault";
		public static const CUSTOMER_SELECTED:String = "CustomerSelected";
		public static const CUSTOMER_SAVE_CHANGES:String = "CustomerSaveChanges";
		public static const CUSTOMER_SAVE_CHANGES_SUCCESS:String = "CustomerSaveChangesSuccess";
		public static const CUSTOMER_SAVE_CHANGES_ERROR:String = "CustomerSaveChangesError";
		public static const CUSTOMER_SAVE_CHANGES_FAULT:String = "CustomerSaveChangesFault";
		public static const CUSTOMER_ADD:String = "CustomerAdd";
		public static const CUSTOMER_ADD_SUCCESS:String = "CustomerAddSuccess";
		public static const CUSTOMER_ADD_ERROR:String = "CustomerAddError";
		public static const CUSTOMER_ADD_FAULT:String = "CustomerAddFault";
		public static const CUSTOMER_DELETE:String = "CustomerDelete";
		public static const CUSTOMER_DELETE_SUCCESS:String = "CustomerDeleteSuccess";
		public static const CUSTOMER_DELETE_ERROR:String = "CustomerDeleteError";
		public static const CUSTOMER_DELETE_FAULT:String = "CustomerDeleteFault";
		
		/*Location Notify*/
		public static const LOCATION_SELECTED: String = "LocationSelected";
		public static const LOCATION_SELECTED_MAIN: String = "LocationSelectedMain";
		public static const GET_LOCATION_LIST:String = "GetLocationList";
		public static const GET_LOCATION_LIST_SUCCESS:String = "GetLocationListSuccess";
		public static const GET_LOCATION_LIST_ERROR:String = "GetLocationListError";
		public static const GET_LOCATION_LIST_FAULT:String = "GetLocationListFault";
		public static const LOCATION_SAVE_CHANGES:String = "LocationSaveChanges";
		public static const LOCATION_SAVE_CHANGES_SUCCESS:String = "LocationSaveChangesSuccess";
		public static const LOCATION_SAVE_CHANGES_ERROR:String = "LocationSaveChangesError";
		public static const LOCATION_SAVE_CHANGES_FAULT:String = "LocationSaveChangesFault";
		public static const LOCATION_ADD:String = "LocationAdd";
		public static const LOCATION_ADD_SUCCESS:String = "LocationAddSuccess";
		public static const LOCATION_ADD_ERROR:String = "LocationAddError";
		public static const LOCATION_ADD_FAULT:String = "LocationAddFault";
		public static const LOCATION_DELETE:String = "LocationDelete";
		public static const LOCATION_DELETE_SUCCESS:String = "LocationDeleteSuccess";
		public static const LOCATION_DELETE_ERROR:String = "LocationDeleteError";
		public static const LOCATION_DELETE_FAULT:String = "LocationDeleteFault";
		public static const GET_NO_AVAILABLE_DAY:String = "GetNoAvailableDay";
		public static const GET_NO_AVAILABLE_DAY_SUCCESS:String = "GetNoAvailableDaySuccess";
		public static const GET_NO_AVAILABLE_DAY_ERROR:String = "GetNoAvailableDayError";
		public static const GET_NO_AVAILABLE_DAY_FAULT:String = "GetNoAvailableDayFault";
		
		/*Booking Notify*/		
		public static const BOOKING_ADD:String = "BookingAdd";
		public static const BOOKING_ADD_SUCCESS:String = "BookingAddSuccess";		
		public static const BOOKING_ADD_ERROR:String = "BookingAddError";
		public static const BOOKING_ADD_FAULT:String = "BookingAddFault";
		public static const GET_BOOKING_LIST:String = "GetBookingList";
		public static const GET_BOOKING_LIST_SUCCESS:String = "GetBookingListSuccess";
		public static const GET_BOOKING_LIST_ERROR:String = "GetBookingListError";
		public static const GET_BOOKING_LIST_FAULT:String = "GetBookingListFault";
		
		public static const BOOKING_DELETE:String = "BookingDelete";
		public static const BOOKING_DELETE_SUCCESS:String = "BookingDeleteSuccess";		
		public static const BOOKING_DELETE_ERROR:String = "BookingDeleteError";
		public static const BOOKING_DELETE_FAULT:String = "BookingDeleteFault";
		public static const BOOKING_SELECTED: String = "BookingSelected";
		
		public static const DATE_SELECTED:String = "DateSelected";
		public static const HOUR_SELECTED:String = "HourSelected";
		public static const GET_BUSY_HOURS:String = "GetBusyHours";
		public static const GET_BUSY_HOURS_SUCCESS:String = "GetBusyHoursSuccess";
		public static const GET_BUSY_HOURS_ERROR:String = "GetBusyHoursError";
		public static const GET_BUSY_HOURS_FAULT:String = "GetBusyHoursFault";

		public static function getInstance() : ApplicationFacade{
			if (instance == null)
				instance = new ApplicationFacade();
			return instance as ApplicationFacade;
		}		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(ApplicationFacade.STARTUP_AFFILIATE_APP, AffiliateStartupCommand);
			registerCommand(ApplicationFacade.STARTUP_MANAGER_APP, ManagerStartupCommand);			
		}		
	}
}