package model.registeraffiliate
{
	import model.services.ManageAffiliateDataService;
	import model.vo.Affiliate;
	
	import mx.controls.Alert;
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class RegisterAffiliateProxy extends Proxy implements IProxy{
		private var service:ManageAffiliateDataService;
		private var responder:Responder;		
		public static const NAME:String = "RegisterAffiliateProxy";
		
		public function RegisterAffiliateProxy(proxyName:String){
			super(proxyName);
			service = new ManageAffiliateDataService();
			responder = new Responder(onResult, onFault);
		}
		
		public function saveAffiliateData(affiliate:Affiliate):void{
			var at:AsyncToken = service.saveAffiliateData(affiliate as Affiliate);
			at.addResponder(responder);			
		}
		public function onResult(evt:ResultEvent):void{
			switch( (evt.token.message as RemotingMessage).operation){
				case "saveAffiliateData":
					if (evt.result > 0)
						sendNotification(ApplicationFacade.REGISTER_AFFILIATE_SUCCES);
					else
						sendNotification(ApplicationFacade.REGISTER_AFFILIATE_ERROR);
					break;
			}
		}
		public function onFault(evt:FaultEvent):void{			
			sendNotification(ApplicationFacade.REGISTER_AFFILIATE_FAULT);
		}
	}
}