package controller.managermain
{
	import model.managermain.BookingListProxy;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class BookingGetListCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var bookingParameter:Object = notification.getBody() as Object;
			if (facade.hasProxy(BookingListProxy.NAME)){				
				var bookingListProxy:BookingListProxy = facade.retrieveProxy(BookingListProxy.NAME) as BookingListProxy;
				bookingListProxy.getBookingList(bookingParameter.idLocation,bookingParameter.date);				
			}
			else{
				var newBookingListProxy:BookingListProxy = new BookingListProxy(BookingListProxy.NAME);
				newBookingListProxy.getBookingList(bookingParameter.idLocation,bookingParameter.date);
				facade.registerProxy(newBookingListProxy);				
			}
		}
	}
}