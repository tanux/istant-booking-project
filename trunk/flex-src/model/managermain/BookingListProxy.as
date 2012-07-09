package model.managermain
{
	import model.services.BookingServices;
	import model.vo.Booking;
	
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
		public function BookingListProxy(proxyName:String)		{
			super(proxyName);
			service = new BookingServices();
			responder = new Responder(onResult, onFault);
		}
		
		public function addBooking(booking:Booking):void{
			var at:AsyncToken = service.addBooking(booking);
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
			}
		}
		public function onFault(evt:FaultEvent):void{
			sendNotification(ApplicationFacade.BOOKING_ADD_FAULT, evt.fault);
		}		
		
	}
}