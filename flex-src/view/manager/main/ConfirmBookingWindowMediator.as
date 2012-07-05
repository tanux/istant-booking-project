package view.manager.main
{
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.ConfirmBookingWindow;
	
	public class ConfirmBookingWindowMediator extends Mediator{
		
		public static const NAME:String = "ConfirmBookingWindowMediator";
		public function ConfirmBookingWindowMediator(viewComponent:Object)	{
			super(NAME, viewComponent);
			confirmBookingWindow.addEventListener(CloseEvent.CLOSE, closeConfirmBookingWindow);
		}
		
		private function closeConfirmBookingWindow(evt:CloseEvent):void {
			facade.removeMediator(ConfirmBookingWindowMediator.NAME);
			PopUpManager.removePopUp(confirmBookingWindow);
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				
			];      
		}
		
		public function get confirmBookingWindow(): ConfirmBookingWindow{
			return viewComponent as ConfirmBookingWindow;
		}
	}
}