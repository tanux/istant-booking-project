package model.managermain
{
	import com.adobe.serializers.json.JSONDecoder;
	
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
		public static const NAME_DELETED_LIST = "BookingDeletedListProxy";
		private var _booking:Booking;
		
		public function BookingProxy(proxyName:String, booking:Booking){
			super(proxyName, new ArrayCollection());
			_booking = new Booking();
			_booking = booking;
		}
		
		public function addBooking():void{			
			var jsDecode:JSONDecoder = new JSONDecoder();
			var customer:Object = jsDecode.decode(_booking.idCustomer as String) as Object;
			bookings.addItem(customer);			
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