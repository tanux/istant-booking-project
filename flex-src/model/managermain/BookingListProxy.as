package model.managermain
{
	import model.services.BookingServices;
	import model.vo.Booking;
	
	import mx.controls.Alert;
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class BookingListProxy extends Proxy implements IProxy{
		
		public static const NAME:String = "BookingListProxy";
		private var service:BookingServices;
		private var responder:Responder;    
		
		public function BookingListProxy(proxyName:String){
			super(proxyName);
			service = new BookingServices();
			responder = new Responder(onResult, onFault);
		}
		
		public function addBooking(booking:Booking):void{
			var at:AsyncToken = service.addBooking(booking);
			at.addResponder(responder);
		}
		
		public function deleteBooking(booking:Booking):void{
			var at:AsyncToken = service.deleteBooking(booking);
			at.addResponder(responder);
		}
		
		public function getBusyHours(visitDay:String):void{
			var at:AsyncToken = service.getBusyHour(visitDay);
			at.addResponder(responder);
		}
		public function getBookingList(idLocation:int, date:String):void{
			var at:AsyncToken = service.getBookingList(idLocation, date);
			at.addResponder(responder);
		}
		public function getDeletedBookingList(idLocation:int, date:String){
			var at:AsyncToken = service.getBookingDeletedList(idLocation, date);
			at.addResponder(responder);
		}
		
		public function onResult(evt:ResultEvent):void{
			switch( (evt.token.message as RemotingMessage).operation){
				case "addBooking":
					if (evt.result != null){
						sendNotification(ApplicationFacade.BOOKING_ADD_SUCCESS);
					}
					else{
						sendNotification(ApplicationFacade.BOOKING_ADD_ERROR);
					}                                       
					break;
				case "getBusyHour":
					if (evt.result != null){
						sendNotification(ApplicationFacade.GET_BUSY_HOURS_SUCCESS, evt.result);
					}
					break;
				case "getBookingList":
					if (evt.result != null){
						sendNotification(ApplicationFacade.GET_BOOKING_LIST_SUCCESS, evt.result);
					}
					break;
				case "getBookingDeletedList":
					if (evt.result != null){
						sendNotification(ApplicationFacade.GET_BOOKING_DELETED_LIST_SUCCESS, evt.result);
					}
					break;
				case "deleteBooking":
					if (evt.result != null){
						sendNotification(ApplicationFacade.BOOKING_DELETE_SUCCESS, evt.result);
					}
					else{
						sendNotification(ApplicationFacade.BOOKING_DELETE_ERROR);
					}
					break;
			}
		}
		public function onFault(evt:FaultEvent):void{
			sendNotification(ApplicationFacade.BOOKING_ADD_FAULT, evt.fault);
		}		
		
	}
}