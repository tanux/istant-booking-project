package model.managermain
{
	import model.services.BookingServices;
	import model.vo.Booking;
	import model.vo.BookingInList;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import view.component.BookingList;
	import view.manager.bookings.BookingListMediator;
	
	public class BookingProxy extends Proxy implements IProxy{
		public static const NAME = "BookingProxy";
		private var _booking:Booking;
		
		public function BookingProxy(proxyName:String, booking:Booking){
			super(proxyName, new ArrayCollection());
			_booking = new Booking();
			_booking = booking;
		}
		
		public function removeBooking(position:int):void{
			bookings.removeItemAt(position);			
		}		

		public function get bookings() : ArrayCollection{
			var bookingList:BookingList = facade.retrieveMediator(BookingListMediator.NAME).getViewComponent() as BookingList;
			return bookingList.customerList as ArrayCollection;
		}
	}
}