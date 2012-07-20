package model.managermain
{
	import model.services.LocationServices;
	import model.vo.Location;
	
	import mx.controls.Alert;
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class LocationListProxy extends Proxy implements IProxy{
		
		private var service:LocationServices;
		private var responder:Responder;
		public static const NAME:String = "LocationListProxy";
		
		public function LocationListProxy(proxyName:String){
			super(proxyName);
			service = new LocationServices();
			responder = new Responder(onResult,onFault);
		}
		
		public function getNoAvailableDay():void{
			var at:AsyncToken = service.getNoAvailableDate();
			at.addResponder(responder);
		}
		
		public function getLocationList():void{
			var at:AsyncToken = service.getLocationList();
			at.addResponder(responder);			
		}
		
		public function saveChangesLocation(location:Location):void{
			var at:AsyncToken = service.saveChangesLocation(location);
			at.addResponder(responder);
		}
		
		public function addLocation (location:Location):void{
			var at:AsyncToken = service.addLocation(location);
			at.addResponder(responder);
		}
		
		public function deleteLocation(location:Location):void{
			var at:AsyncToken = service.deleteLocation(location);
			at.addResponder(responder);			
		}
		
		private function onResult(evt:ResultEvent):void{
			switch( (evt.token.message as RemotingMessage).operation){
				case "getLocationList":
					if (evt.result != null){						
						sendNotification(ApplicationFacade.GET_LOCATION_LIST_SUCCESS, evt.result);
					}
					else{
						sendNotification(ApplicationFacade.GET_LOCATION_LIST_ERROR);
					}						
					break;
				case "saveChangesLocation":
					if (evt.result != null){
						sendNotification(ApplicationFacade.LOCATION_SAVE_CHANGES_SUCCESS, evt.result);
					}
					else{
						sendNotification(ApplicationFacade.LOCATION_SAVE_CHANGES_ERROR);
					}
					break;
				case "addLocation":
					if (evt.result != null){
						sendNotification(ApplicationFacade.LOCATION_ADD_SUCCESS);						
						if (facade.hasProxy(LocationProxy.NAME)){
							var locationProxy:LocationProxy = facade.retrieveProxy(LocationProxy.NAME) as LocationProxy;
							locationProxy.addLocation(evt.result as String);
						}
					}
					else{
						sendNotification(ApplicationFacade.LOCATION_ADD_ERROR);
					}
					break;
				case "deleteLocation":					
					if (evt.result > 0){
						sendNotification(ApplicationFacade.LOCATION_DELETE_SUCCESS);
					}
					else{
						sendNotification(ApplicationFacade.LOCATION_DELETE_ERROR);
					}
					break;
				case "getNoAvailableDate":
					if (evt.result != null){
						sendNotification(ApplicationFacade.GET_NO_AVAILABLE_DAY_SUCCESS, evt.result);
					}
					else{
						sendNotification(ApplicationFacade.GET_NO_AVAILABLE_DAY_ERROR, evt.result);
					}
			}	
		}
		
		private function onFault(evt:FaultEvent):void{			
			sendNotification(ApplicationFacade.GET_LOCATION_LIST_FAULT);
			//modificare per comprendere anche il caso di fault save changes location
		}
	}
}