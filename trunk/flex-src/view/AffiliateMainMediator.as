package view
{
	import controller.loginaffiliate.DoLoginCommand;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import model.vo.Affiliate;
	import model.vo.GenericUser;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.registeraffiliate.RegisterAffiliateMediator;
	
	public class AffiliateMainMediator extends Mediator implements IMediator{
		public static const NAME:String = "AffiliateMainMediator";
		public static const USER_TYPE:String = "affiliates";
		
		public function AffiliateMainMediator(viewComponent:Object){
			super(NAME, viewComponent);
			affiliateMain.addEventListener(FlexEvent.CREATION_COMPLETE, init);
			affiliateMain.lbRegisterAffiliate.addEventListener(MouseEvent.CLICK, enableStateRegister);
			affiliateMain.cmpLoginFormAffiliate.btnLogin.addEventListener(MouseEvent.CLICK, doLogin);			
		}
		
		private function init(evt:Event) : void {}
		
		private function goToSetting(evt:Event):void{
			affiliateMain.currentState = "stateSettings";
		}
		
		private function doLogin(evt:Event):void{			
			var affiliate:Affiliate = new Affiliate();
			affiliate.email = affiliateMain.cmpLoginFormAffiliate.tiUsername.text;
			affiliate.password = affiliateMain.cmpLoginFormAffiliate.tiPassword.text;
			var genericUser:GenericUser = new GenericUser(USER_TYPE);
			genericUser.setUserAsAffiliate = affiliate;
			facade.sendNotification(ApplicationFacade.AFFILIATE_DO_LOGIN, genericUser);			
		}
		private function enableStateRegister(evt:Event):void{
			affiliateMain.currentState = "stateRegister";			
			facade.registerMediator(new RegisterAffiliateMediator(affiliateMain.cmpRegisterFormAffiliate));
		}	
		
		private function doLogout(evt:Event):void{
			facade.sendNotification(ApplicationFacade.AFFILIATE_DO_LOGOUT);
		}		
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){
				case ApplicationFacade.REGISTER_AFFILIATE_SUCCES:
					Alert.show("La registrazione è avvenuta con successo!");
					affiliateMain.currentState = "stateLogin";
					break;
				case ApplicationFacade.REGISTER_AFFILIATE_ERROR:
					Alert.show("Errore nell'inserimento dei dati");
					break;
				case ApplicationFacade.REGISTER_AFFILIATE_FAULT:
					Alert.show("FAULT:Errore di comunicazione con il server");
					break;
				case ApplicationFacade.AFFILIATE_LOGGED_IN:					
					affiliateMain.currentState = "stateMainApplication";
					var affiliateLoggedIn:Affiliate = notification.getBody() as Affiliate;
					affiliateMain.cmpControlBar.txUserLoggedIn.text = affiliateLoggedIn.name as String;
					affiliateMain.cmpControlBar.btnSettings.addEventListener(MouseEvent.CLICK, goToSetting);
					affiliateMain.cmpControlBar.btnLogout.addEventListener(MouseEvent.CLICK, doLogout);					
					break;					
				case ApplicationFacade.AFFILIATE_EXECUTE_LOGIN:
					facade.registerCommand(ApplicationFacade.AFFILIATE_DO_LOGIN, DoLoginCommand);
					affiliateMain.currentState = "stateLogin";					
					break;
				case ApplicationFacade.AFFILIATE_LOGIN_SUCCESS:
					affiliateMain.currentState = "stateMainApplication";
					var affiliate:Affiliate = notification.getBody() as Affiliate;
					affiliateMain.cmpControlBar.txUserLoggedIn.text = affiliate.name as String;
					affiliateMain.cmpControlBar.btnSettings.addEventListener(MouseEvent.CLICK, goToSetting);
					affiliateMain.cmpControlBar.btnLogout.addEventListener(MouseEvent.CLICK, doLogout);
					break;
				case ApplicationFacade.AFFILIATE_LOGIN_ERROR:
					Alert.show("Autenticazione Fallita: inserire i dati corretti");
					break;
				case ApplicationFacade.AFFILIATE_LOGOUT_SUCCESS:
					affiliateMain.currentState = "stateLogin";
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.REGISTER_AFFILIATE_SUCCES,
				ApplicationFacade.REGISTER_AFFILIATE_ERROR,
				ApplicationFacade.REGISTER_AFFILIATE_FAULT,	
				ApplicationFacade.AFFILIATE_LOGGED_IN,
				ApplicationFacade.AFFILIATE_EXECUTE_LOGIN,
				ApplicationFacade.AFFILIATE_LOGIN_SUCCESS,
				ApplicationFacade.AFFILIATE_LOGIN_ERROR,
				ApplicationFacade.AFFILIATE_LOGOUT_SUCCESS
			];
		}
		
		public function get affiliateMain():AffiliateMain{
			return viewComponent as AffiliateMain;
		}
		
	}
}