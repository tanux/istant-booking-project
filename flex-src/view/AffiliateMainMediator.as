package view
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Affiliate;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.registeraffiliate.RegisterAffiliateMediator;
	
	public class AffiliateMainMediator extends Mediator implements IMediator{
		public static const NAME:String = "AffiliateMainMediator";
		
		public function AffiliateMainMediator(viewComponent:Object){
			super(NAME, viewComponent);
			affiliateMain.addEventListener(FlexEvent.CREATION_COMPLETE, init);
			affiliateMain.lbRegisterAffiliate.addEventListener(MouseEvent.CLICK, enableStateRegister);
			affiliateMain.cmpLoginFormAffiliate.btnLogin.addEventListener(MouseEvent.CLICK, doLogin);
		}
		
		private function init(evt:Event) : void {}
		
		private function doLogin(evt:Event):void{
			var affiliate:Affiliate = new Affiliate();
			affiliate.email = affiliateMain.cmpLoginFormAffiliate.tiUsername;
			affiliate.password = affiliateMain.cmpLoginFormAffiliate.tiPassword;
			facade.sendNotification(ApplicationFacade.DO_LOGIN, affiliate);			
		}
		private function enableStateRegister(evt:Event):void{
			affiliateMain.currentState = "stateRegister";			
			facade.registerMediator(new RegisterAffiliateMediator(affiliateMain.cmpRegisterFormAffiliate));
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
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.REGISTER_AFFILIATE_SUCCES,
				ApplicationFacade.REGISTER_AFFILIATE_ERROR,
				ApplicationFacade.REGISTER_AFFILIATE_FAULT,				
			];
		}
		
		public function get affiliateMain():AffiliateMain{
			return viewComponent as AffiliateMain;
		}
		
	}
}