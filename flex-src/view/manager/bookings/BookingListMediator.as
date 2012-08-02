package view.manager.bookings
{
	import com.adobe.serializers.json.JSONDecoder;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Booking;
	import model.vo.BookingInList;
	
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
		public static const NAME:String = "BookingListMediator";
		
		public function BookingListMediator(mediatorName:String, viewComponent:Object){
			super(mediatorName, viewComponent);
			bookingListCmp.btnPrintBookingList.addEventListener(MouseEvent.CLICK, printBookingList);
			bookingListCmp.btnDeleteUser.addEventListener(MouseEvent.CLICK, deleteBooking);
		}
		
		public function deleteBooking(evt:Event): void{
			var delBooking:Booking = new Booking();
			delBooking.id = bookingInList.getBooking.id;

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
					var date:String = DateField.dateToString(visitDayMediator.visitDayCmp.selectedDate as Date, "DD/MM/YYYY");
					bookingListCmp.lblBookingList.text = "Elenco delle Prenotazioni di "+city+" per il giorno "+date as String;
					var _customerList:ArrayCollection = notification.getBody() as ArrayCollection;
					if (_customerList.length > 0){
						bookingListCmp.customerList = new ArrayCollection();
						var jsDecode:JSONDecoder = new JSONDecoder();
						for (var i:int=0; i<_customerList.length; i++){
							var customer:Object = jsDecode.decode(_customerList[i].id_customer);
							bookingListCmp.customerList.addItem(customer);
						}	
					}
					else{
						if (bookingListCmp.customerList != null){
							bookingListCmp.customerList.removeAll();	
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