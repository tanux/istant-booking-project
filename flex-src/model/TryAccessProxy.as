package model
{
	import model.services.loginservice.LoginService;
	
	import mx.controls.Alert;
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class TryAccessProxy extends Proxy implements IProxy{
		private var service:LoginService;
		private var responder:Responder;		
		public static const NAME:String = "TryAccessProxy";
		public function TryAccessProxy(proxyName:String){
			super(proxyName);
			service = new LoginService();
			responder =  new Responder(onResult, onFault);
		}
		public function tryAccess():void{
			var at:AsyncToken = service.verifiedLoggedIn();
			at.addResponder(responder);
		}
		private function onResult(evt:ResultEvent):void{
			switch ((evt.token.message as RemotingMessage).operation) {
				case "verifiedLoggedIn":
					if (evt.result != null){
						sendNotification(ApplicationFacade.LOGGED_IN,evt.result);						
					}
					else{						
						sendNotification(ApplicationFacade.EXECUTE_LOGIN);
					}
					break;	
			}
		}
		private function onFault(evt:FaultEvent):void{
			Alert.show("executeAccess FAULT");
		}
	}
}