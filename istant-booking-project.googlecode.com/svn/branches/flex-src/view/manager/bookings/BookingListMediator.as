package view.manager.bookings
{
	import com.adobe.serializers.json.JSONDecoder;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
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
		public function BookingListMediator(mediatorName:String, viewComponent:Object){
			super(mediatorName, viewComponent);
			bookingListCmp.btnPrintBookingList.addEventListener(MouseEvent.CLICK, printBookingList);
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
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_BOOKING_LIST_SUCCESS				
			];
		}
		
		public function get bookingListCmp():BookingList{
			return viewComponent as BookingList;			
		}
	}
}