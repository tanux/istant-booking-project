package model.vo
{
	public class BookingInList{
		
		private var booking:Booking;
		private var position:int;
		
		public function BookingInList(booking:Booking, position:int){			
			this.booking = booking as Booking;
			this.position = position as int;			
		}
		
		public function get getBooking():Booking{
			return this.booking;
		}
		public function get getPosition():int{
			return this.position;
		}
	}
}