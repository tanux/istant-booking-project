package view.manager.bookings
{
	import com.adobe.serializers.json.JSONDecoder;
	import com.adobe.serializers.json.JSONEncoder;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Booking;
	import model.vo.BookingInList;
	import model.vo.Customer;
	import model.vo.SelectedHour;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.controls.DateField;
	import mx.managers.CursorManager;
	import mx.printing.FlexPrintJob;
	import mx.printing.FlexPrintJobScaleType;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.ManagerMainMediator;
	import view.component.BookingList;
	import view.component.PrintBookingList;
	import view.manager.BookingSectionMediator;
	import view.manager.main.VisitDayMediator;
	import view.manager.main.VisitLocationMediator;
	
	public class BookingListMediator extends Mediator{
		[Bindable]private var bookingInList:BookingInList;		
		public static const NAME:String = "BookingListMediator";
		public static const NAME_IN_LIST:String = "BookingListMediator";
		public static const NAME_IN_DELETED_LIST:String = "BookingDeletedListMediator";
		
		public function BookingListMediator(mediatorName:String, viewComponent:Object){
			super(mediatorName, viewComponent);
			bookingListCmp.btnPrintBookingList.addEventListener(MouseEvent.CLICK, printBookingList);
			bookingListCmp.btnDeleteUser.addEventListener(MouseEvent.CLICK, deleteBooking);
		}
		
		public function deleteBooking(evt:Event): void{
			var delBooking:Booking = new Booking();
			var jsEncode:JSONEncoder = new JSONEncoder();
			delBooking = bookingListCmp.bookingList.getItemAt(bookingInList.getPosition) as Booking;
			var visitDayMediator:VisitDayMediator = facade.retrieveMediator(VisitDayMediator.NAME_IN_BOOKING) as VisitDayMediator;					
			var date:String = DateField.dateToString(visitDayMediator.visitDayCmp.selectedDate as Date, "DD/MM/YYYY");
			delBooking.visitDay = date;			
			delBooking.visitHour = jsEncode.encode(delBooking.visitHour);
			var bInList:BookingInList = new BookingInList(delBooking, bookingInList.getPosition);
			facade.sendNotification(ApplicationFacade.BOOKING_DELETE, bInList);
		}
		
		private function printBookingList(evt:MouseEvent):void {
			var printJob:FlexPrintJob = new FlexPrintJob();
			if (printJob.start()){
				var formPrintBookingList:PrintBookingList = new PrintBookingList();
				bookingListCmp.addChild(formPrintBookingList);
				formPrintBookingList.detailPrinting.text = bookingListCmp.lblBookingList.text;
							
				//USO DIRETTO DEL DATA PROVIDER
				//formPrintBookingList.printDataGrid.dataProvider = bookingListCmp.dgRisultati.dataProvider; 
				
				//USO OGGETTO BINDABLE
				formPrintBookingList.printBookingList = bookingListCmp.bookingList;
				
				printJob.addObject(formPrintBookingList, FlexPrintJobScaleType.SHOW_ALL);
				printJob.send();	
				bookingListCmp.removeChild(formPrintBookingList);
			}
		}
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){	
				case ApplicationFacade.BOOKING_SELECTED:
					bookingInList = notification.getBody() as BookingInList;					
					bookingListCmp.btnDeleteUser.enabled= true;
					break;
			}			
		}
		
		override public function listNotificationInterests():Array{
			return [								
				ApplicationFacade.BOOKING_SELECTED
			];
		}
		
		public function get bookingListCmp():BookingList{
			return viewComponent as BookingList;			
		}
	}
}