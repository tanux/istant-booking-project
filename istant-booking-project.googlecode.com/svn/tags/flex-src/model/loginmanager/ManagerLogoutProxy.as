package model.loginmanager
{
	import model.services.LoginService;
	
	import mx.controls.Alert;
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class ManagerLogoutProxy extends Proxy implements IProxy	{
		
		private var service:LoginService;
		private var responder:Responder;		
		public static const NAME:String = "ManagerLogoutProxy";		
		
		public function ManagerLogoutProxy(proxyName:String){
			super(proxyName);
			service = new LoginService();
			responder =  new Responder(onResult, onFault);
		}
		
		public function doLogout():void{			
			var at:AsyncToken = service.doLogout();
			at.addResponder(responder);
		}
		
		private function onResult(evt:ResultEvent):void{
			switch ((evt.token.message as RemotingMessage).operation) {
				case "doLogout":											
					sendNotification(ApplicationFacade.MANAGER_LOGOUT_SUCCESS,evt.result);
					break;				
			}	
		}		
		private function onFault(evt:FaultEvent):void{
			Alert.show("Logout Fault");	
		}
	}
}