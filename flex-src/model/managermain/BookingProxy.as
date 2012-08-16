package model.managermain
{
	import com.adobe.serializers.json.JSONDecoder;
	
	import model.services.BookingServices;
	import model.vo.Booking;
	import model.vo.BookingInList;
	import model.vo.SelectedHour;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import view.component.BookingList;
	import view.component.VisitHours;
	import view.manager.bookings.BookingListMediator;
	
	public class BookingProxy extends Proxy implements IProxy{
		public static const NAME = "BookingProxy";
		public static const NAME_DELETED_LIST = "BookingDeletedListProxy";
		private var _booking:Booking;
		
		public function BookingProxy(proxyName:String, booking:Booking){
			super(proxyName, new ArrayCollection());
			_booking = new Booking();
			_booking = booking;
		}
		
		public function addBooking():void{
			var jsDecode:JSONDecoder = new JSONDecoder();			
			_booking.visitHour = jsDecode.decode(_booking.visitHour as String, SelectedHour) as SelectedHour;			
			bookings.addItem(_booking);			
		}
		
		public function removeBooking(position:int):void{
			bookings.removeItemAt(position);			
		}		

		public function get bookings() : ArrayCollection{
			var bookingList:BookingList;
			if (getProxyName() == NAME){
				bookingList = facade.retrieveMediator(BookingListMediator.NAME_IN_LIST).getViewComponent() as BookingList;
			}
			else if (getProxyName() == NAME_DELETED_LIST){
				bookingList = facade.retrieveMediator(BookingListMediator.NAME_IN_DELETED_LIST).getViewComponent() as BookingList;
			}
			return bookingList.bookingList as ArrayCollection;
		}
	}
}