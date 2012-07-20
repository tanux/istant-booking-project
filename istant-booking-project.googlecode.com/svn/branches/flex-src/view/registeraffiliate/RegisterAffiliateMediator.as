package view.registeraffiliate
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Affiliate;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.AffiliateMainMediator;
	import view.component.RegisterForm;
	
	public class RegisterAffiliateMediator extends Mediator implements IMediator{
		public static const NAME:String = "RegisterAffiliateMediator";
		
		public function RegisterAffiliateMediator(viewComponent:Object){
			super(NAME, viewComponent);	
			registerAffiliate.lbBackToLogin.addEventListener(MouseEvent.CLICK, enableStateLogin);
			registerAffiliate.lbConfirmRegistration.addEventListener(MouseEvent.CLICK, confirmRegister);
		}
		
		private function enableStateLogin(evt:Event):void{
			var affiliateMainMediator:AffiliateMainMediator = facade.retrieveMediator(AffiliateMainMediator.NAME) as AffiliateMainMediator;
			affiliateMainMediator.affiliateMain.currentState = "stateLogin";
		}
		
		private function confirmRegister(evt:Event):void{
			var affiliate:Affiliate = new Affiliate();
			affiliate.name = registerAffiliate.tiAffiliateName.text;
			affiliate.address = registerAffiliate.tiAddress.text;
			affiliate.city = registerAffiliate.tiCity.text;
			affiliate.telephoneNumber = registerAffiliate.tiTelephoneNumber.text;
			affiliate.email = registerAffiliate.tiAffiliateEmail.text;
			affiliate.password = registerAffiliate.tiPwd.text;
			facade.sendNotification(ApplicationFacade.CONFIRM_REGISTER, affiliate);
		}
		
		public function get registerAffiliate():RegisterForm{
			return viewComponent as RegisterForm;
		}
	}
}