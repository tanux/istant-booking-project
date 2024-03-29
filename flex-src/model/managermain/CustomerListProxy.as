package model.managermain
{
	import model.services.CustomersService;
	import model.vo.Customer;
	
	import mx.controls.Alert;
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
		
		public function saveChangesCustomer(customer:Customer):void{
			var at:AsyncToken = service.saveChangesCustomer(customer);
			at.addResponder(responder);
		}
		
		public function addCustomer (customer:Customer):void{
			var at:AsyncToken = service.addCustomer(customer);
			at.addResponder(responder);
		}
		
		public function deleteCustomer(customer:Customer):void{
			var at:AsyncToken = service.deleteCustomer(customer);
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
				case "saveChangesCustomer":
					if (evt.result != null){
						sendNotification(ApplicationFacade.CUSTOMER_SAVE_CHANGES_SUCCESS, evt.result);
					}
					else{
						sendNotification(ApplicationFacade.CUSTOMER_SAVE_CHANGES_ERROR);
					}
					break;
				case "addCustomer":
					if (evt.result != null){
						sendNotification(ApplicationFacade.CUSTOMER_ADD_SUCCESS, evt.result);
						if (facade.hasProxy(CustomerProxy.NAME)){
							var customerProxy:CustomerProxy = facade.retrieveProxy(CustomerProxy.NAME) as CustomerProxy;
							customerProxy.addCustomer(evt.result as String);
						}
					}
					else{
						sendNotification(ApplicationFacade.CUSTOMER_ADD_ERROR);
					}
					break;
				case "deleteCustomer":
					if (evt.result != null){
						sendNotification(ApplicationFacade.CUSTOMER_DELETE_SUCCESS, evt.result);
					}
					else{
						sendNotification(ApplicationFacade.CUSTOMER_DELETE_ERROR);
					}
					break;
			}	
		}
		
		private function onFault(evt:FaultEvent):void{			
			sendNotification(ApplicationFacade.GET_CUSTOMER_LIST_FAULT, evt);
			//modificare per comprendere anche il caso di fault save changes customer
		}
	}
}