package controller.managermain
{
	import model.managermain.BookingListProxy;
	import model.vo.Booking;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class BookingAddCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var booking:Booking = notification.getBody() as Booking;
			if (facade.hasProxy(BookingListProxy.NAME)){
				var bookingListProxy:BookingListProxy = facade.retrieveProxy(BookingListProxy.NAME) as BookingListProxy;
				bookingListProxy.addBooking(booking);
			}
			else{
				var newBookingListProxy:BookingListProxy = new BookingListProxy(BookingListProxy.NAME);
				newBookingListProxy.addBooking(booking);
				facade.registerProxy(newBookingListProxy);
			}			
		}
	}
}