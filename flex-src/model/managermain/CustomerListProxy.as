package model.managermain
{
	import model.services.CustomersService;
	
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class CustomerListProxy extends Proxy implements IProxy{
		
		private var service:CustomersService;
		private var responder:Responder;
		public static const NAME:String = "CustomerListProxy";
		
		public function CustomerListProxy(proxyName:String){
			super(proxyName);
			service = new CustomersService();
			responder = new Responder(onResult,onFault);
		}
		
		public function getCustomerList():void{
			var at:AsyncToken = service.getCustomerList();
			at.addResponder(responder);			
		}
		
		private function onResult(evt:ResultEvent):void{
			switch( (evt.token.message as RemotingMessage).operation){
				case "getCustomerList":
					if (evt.result != null){
						sendNotification(ApplicationFacade.GET_CUSTOMER_LIST_SUCCESS, evt.result);
					}
					else{
						sendNotification(ApplicationFacade.GET_CUSTOMER_LIST_ERROR);
					}
						
					break;
			}	
		}
		
		private function onFault(evt:FaultEvent):void{
			sendNotification(ApplicationFacade.GET_CUSTOMER_LIST_FAULT);				
		}
	}
}