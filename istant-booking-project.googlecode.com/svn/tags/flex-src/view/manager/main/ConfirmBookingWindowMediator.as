package view.manager.main
{
	import com.adobe.serializers.json.JSONEncoder;
	
	import flash.events.MouseEvent;
	
	import model.vo.Booking;
	
	import mx.controls.Alert;
	import mx.controls.DateField;
	import mx.events.CloseEvent;
	import mx.managers.CursorManager;
	import mx.managers.PopUpManager;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.puremvc.as3.patterns.observer.Notification;
	import org.tylerchesley.bark.core.Notification;
	import org.tylerchesley.bark.events.NotificationEvent;
	
	import view.component.ConfirmBookingWindow;
	
	public class ConfirmBookingWindowMediator extends Mediator{
		
		public static const NAME:String = "ConfirmBookingWindowMediator";
		public function ConfirmBookingWindowMediator(viewComponent:Object)	{
			super(NAME, viewComponent);
			confirmBookingWindow.addEventListener(CloseEvent.CLOSE, closeConfirmBookingWindow);
			confirmBookingWindow.btnConfirmBooking.addEventListener(MouseEvent.CLICK, sendBooking);
		}
		
		private function closeConfirmBookingWindow(evt:CloseEvent):void {
			facade.removeMediator(ConfirmBookingWindowMediator.NAME);
			PopUpManager.removePopUp(confirmBookingWindow);
		}
		
		private function sendBooking(event:MouseEvent):void{
			var jsEnc:JSONEncoder = new JSONEncoder();
			var booking:Booking = new Booking();
			booking.idManager = confirmBookingWindow.booking.idManager;
			booking.idAffiliate = 0;
			booking.idCustomer = confirmBookingWindow.booking.idCustomer;
			booking.idLocation = confirmBookingWindow.booking.idLocation.id;
			var stringFromDate:String = DateField.dateToString(confirmBookingWindow.booking.visitDay as Date, "DD/MM/YYYY");			
			booking.visitDay = stringFromDate;
			booking.visitHour = jsEnc.encode(confirmBookingWindow.booking.visitHour);
			facade.sendNotification(ApplicationFacade.BOOKING_ADD, booking);
			CursorManager.setBusyCursor();			
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.BOOKING_ADD_SUCCESS:
					CursorManager.removeBusyCursor();
					Alert.show("Prenotazione Inviata");
					facade.removeMediator(ConfirmBookingWindowMediator.NAME);
					PopUpManager.removePopUp(confirmBookingWindow);			
					break;
				case ApplicationFacade.BOOKING_ADD_ERROR:
					CursorManager.removeBusyCursor();
					Alert.show("Prenotazione NON Salvata");
					facade.removeMediator(ConfirmBookingWindowMediator.NAME);
					PopUpManager.removePopUp(confirmBookingWindow);
					break;
				case ApplicationFacade.BOOKING_ADD_FAULT:
					var fault:Fault = notification.getBody() as Fault;
					CursorManager.removeBusyCursor();
					Alert.show("FAULT:"+fault.faultString);
					facade.removeMediator(ConfirmBookingWindowMediator.NAME);
					PopUpManager.removePopUp(confirmBookingWindow);
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.BOOKING_ADD_SUCCESS,
				ApplicationFacade.BOOKING_ADD_ERROR,
				ApplicationFacade.BOOKING_ADD_FAULT,				
			];      
		}
		
		public function get confirmBookingWindow(): ConfirmBookingWindow{
			return viewComponent as ConfirmBookingWindow;
		}
	}
}