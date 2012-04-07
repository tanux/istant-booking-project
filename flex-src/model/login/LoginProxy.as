package model.login
{
	import model.services.loginservice.LoginService;
	import model.vo.VOUser;
	
	import mx.controls.Alert;
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class LoginProxy extends Proxy implements IProxy
	{
		private var service:LoginService;
		private var responder:Responder;		
		public static const NAME:String = "LoginProxy";	
		
		public function LoginProxy(proxyName:String){
			super(proxyName);
			service = new LoginService();
			responder =  new Responder(onResult, onFault);			
		}
		
		public function doLogin(username:String, password:String):void{			
			var at:AsyncToken = service.doLogin(username, password);
			at.addResponder(responder);			
		}		
		private function onResult(evt:ResultEvent):void{
			switch ((evt.token.message as RemotingMessage).operation) {
				case "doLogin":
					if (evt.result != null){						
						sendNotification(ApplicationFacade.LOGIN_SUCCESS,evt.result);						
					}			
					else{						
						sendNotification(ApplicationFacade.LOGIN_ERROR,evt.result);
					}
					break;				
			}	
		}		
		private function onFault(evt:FaultEvent):void{
			Alert.show("Login Fault");	
		}
	}
}