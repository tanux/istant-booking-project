package controller.managermain
{
	import model.managermain.BookingListProxy;
	import model.managermain.BookingProxy;
	import model.vo.Booking;
	import model.vo.BookingInList;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class BookingDeleteCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification) : void {
			var bookingInList:BookingInList = notification.getBody() as BookingInList;
			var booking:Booking=bookingInList.getBooking as Booking;			
			if (facade.hasProxy(BookingListProxy.NAME)){
				var bookingListProxy:BookingListProxy = facade.retrieveProxy(BookingListProxy.NAME) as BookingListProxy;
				bookingListProxy.deleteBooking(booking);
				
				if (facade.hasProxy(BookingProxy.NAME)){
					var bookingProxy:BookingProxy = facade.retrieveProxy(BookingProxy.NAME) as BookingProxy;
					bookingProxy.removeBooking(bookingInList.getPosition);
				}else{				
					var newBookingProxy:BookingProxy = new BookingProxy(BookingProxy.NAME, booking);
					newBookingProxy.removeBooking(bookingInList.getPosition);
					facade.registerProxy(newBookingProxy);						
				}
			}
			else{
				var newBookingListProxy:BookingListProxy = new BookingListProxy(BookingListProxy.NAME);
				newBookingListProxy.deleteBooking(booking);
				facade.registerProxy(newBookingListProxy);
			}
		}
	}
}