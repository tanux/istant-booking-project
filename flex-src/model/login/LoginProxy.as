package model.login
{
	import model.services.LoginService;
	import model.vo.GenericUser;
	
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
		
		public function doLogin(genericUser:GenericUser):void{
			var username:String = genericUser.getUserAsAffiliate.email as String;
			var password:String = genericUser.getUserAsAffiliate.password as String;
			var type:String = genericUser.getType as String;
			var at:AsyncToken = service.doLogin(username, password, type);
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