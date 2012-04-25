package model.loginmanager
{
	
	import model.services.ManagerLoginService;
	import model.vo.GenericUser;
	
	import mx.controls.Alert;
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class ManagerLoginProxy extends Proxy implements IProxy{
		
		private var service:ManagerLoginService;
		private var responder:Responder;
		public static const NAME:String = "ManagerLoginProxy";
		
		public function ManagerLoginProxy(proxyName:String){
			super(proxyName);
			service = new ManagerLoginService();
			responder = new Responder(onResult, onFault);
		}
		public function doLogin(genericUser:GenericUser):void{
			var username:String = genericUser.getUserAsManager.username as String; 
			var password:String = genericUser.getUserAsManager.password as String;			
			var type:String = genericUser.getType as String;
			Alert.show("Proxy "+username+" "+password);
			var at:AsyncToken =  service.doLogin(username, password, type);
			at.addResponder(responder);			
		}
		
		private function onResult(evt:ResultEvent):void{
			switch ((evt.token.message as RemotingMessage).operation) {
				case "doLogin":
					if (evt.result != null){
						sendNotification(ApplicationFacade.MANAGER_LOGIN_SUCCESS,evt.result);						
					}			
					else{						
						sendNotification(ApplicationFacade.MANAGER_LOGIN_ERROR);
					}
					break;				
			}	
		}
		
		private function onFault(evt:FaultEvent):void{
			Alert.show("Login Fault");	
		}
	}
}