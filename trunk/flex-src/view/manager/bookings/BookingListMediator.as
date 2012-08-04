package view.manager.bookings
{
	import com.adobe.serializers.json.JSONDecoder;
	import com.adobe.serializers.json.JSONEncoder;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Booking;
	import model.vo.BookingInList;
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
	import view.manager.main.VisitDayMediator;
	import view.manager.main.VisitLocationMediator;
	
	public class BookingListMediator extends Mediator{
		[Bindable]private var bookingInList:BookingInList;
		[Bindable]private var date:String;
		public static const NAME:String = "BookingListMediator";
		public static const NAME_2: String = "BookingDeletedListMediator";
		
		
		public function BookingListMediator(mediatorName:String, viewComponent:Object){
			super(mediatorName, viewComponent);
			bookingListCmp.btnPrintBookingList.addEventListener(MouseEvent.CLICK, printBookingList);
			bookingListCmp.btnDeleteUser.addEventListener(MouseEvent.CLICK, deleteBooking);
		}
		
		public function deleteBooking(evt:Event): void{
			var delBooking:Booking = new Booking();
			delBooking = bookingListCmp.bookingList.getItemAt(bookingInList.getPosition) as Booking;
			delBooking.visitDay = date;
			var jsEncode:JSONEncoder = new JSONEncoder();
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
				formPrintBookingList.printDataGrid.dataProvider = bookingListCmp.dgRisultati.dataProvider;
				printJob.addObject(formPrintBookingList, FlexPrintJobScaleType.SHOW_ALL);
				printJob.send();	
				bookingListCmp.removeChild(formPrintBookingList);
			}
		}
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){				
				case ApplicationFacade.GET_BOOKING_LIST_SUCCESS:
					var visitLocationMediator:VisitLocationMediator = facade.retrieveMediator(ManagerMainMediator.NAME_VISIT_LOCATION_MEDIATOR_SHOWBOOKING) as VisitLocationMediator;
					var city:String = visitLocationMediator.visitDayCmp.locationSelected.city as String;	
					var visitDayMediator:VisitDayMediator = facade.retrieveMediator(ManagerMainMediator.NAME_VISIT_DAY_MEDIATOR_SHOWBOOKING) as VisitDayMediator;					
					date = DateField.dateToString(visitDayMediator.visitDayCmp.selectedDate as Date, "DD/MM/YYYY");
					bookingListCmp.lblBookingList.text = bookingListCmp.testo+" di "+city+" per il giorno "+date as String;
					var _bookingList:ArrayCollection = notification.getBody() as ArrayCollection;
					if (_bookingList.length > 0){
						bookingListCmp.customerList = new ArrayCollection();
						bookingListCmp.bookingList = new ArrayCollection();
						var jsDecode:JSONDecoder = new JSONDecoder();
						for (var i:int=0; i<_bookingList.length; i++){
							var booking:Booking = new Booking();
							booking.id = _bookingList[i].id;
							var jsDecode:JSONDecoder = new JSONDecoder();
							var hour:SelectedHour = new SelectedHour();
							hour.hour = jsDecode.decode(_bookingList[i].visit_hour).hour;
							hour.busy = false;
							hour.index = jsDecode.decode(_bookingList[i].visit_hour).index;							
							booking.visitHour = hour;						
							bookingListCmp.bookingList.addItem(booking);
							var customer:Object = jsDecode.decode(_bookingList[i].id_customer);							
							bookingListCmp.customerList.addItem(customer);
						}
					}
					else{
						if (bookingListCmp.customerList != null){
							bookingListCmp.customerList.removeAll();
							bookingListCmp.bookingList.removeAll();
						}
						Alert.show("Non ci sono prenotazioni per la data selezionata");
					}
					CursorManager.removeBusyCursor();					
					break;
				case ApplicationFacade.BOOKING_SELECTED:
					bookingInList = notification.getBody() as BookingInList;
					Alert.show("Prenotazione Selezionata");
					bookingListCmp.btnDeleteUser.enabled= true;
					break;
				case ApplicationFacade.BOOKING_DELETE_SUCCESS:
					bookingListCmp.btnDeleteUser.enabled = false;
					bookingListCmp.dgRisultati.selectedIndex = -1;
					Alert.show("Delete OK");
					break;
				case ApplicationFacade.BOOKING_DELETE_ERROR:
					Alert.show("Errore delete");
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_BOOKING_LIST_SUCCESS,
				ApplicationFacade.BOOKING_SELECTED,
				ApplicationFacade.BOOKING_DELETE,
				ApplicationFacade.BOOKING_DELETE_SUCCESS,
				ApplicationFacade.BOOKING_DELETE_ERROR
			];
		}
		
		public function get bookingListCmp():BookingList{
			return viewComponent as BookingList;			
		}
	}
}