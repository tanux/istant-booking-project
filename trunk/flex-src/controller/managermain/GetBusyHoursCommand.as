package controller.managermain
{
	import model.managermain.BookingListProxy;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class GetBusyHoursCommand extends SimpleCommand implements ICommand {
		override public function execute(notification:INotification): void{
			var visitDay:String = notification.getBody() as String;
			if (facade.hasProxy(BookingListProxy.NAME)){
				var bookingListProxy:BookingListProxy = facade.retrieveProxy(BookingListProxy.NAME) as BookingListProxy;
				bookingListProxy.getBusyHours(visitDay);
			}
			else{
				var newBookingListProxy:BookingListProxy = new BookingListProxy(BookingListProxy.NAME);
				newBookingListProxy.getBusyHours(visitDay);
				facade.registerProxy(newBookingListProxy);
			}			
		}
	}
}