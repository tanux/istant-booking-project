package view.manager
{
	import com.adobe.serializers.json.JSONDecoder;
	
	import controller.managermain.BookingDeleteCommand;
	import controller.managermain.BookingGetListCommand;
	import controller.managermain.GetAvailableDayCommand;
	
	import flash.events.Event;
	
	import model.vo.Booking;
	import model.vo.SelectedHour;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.controls.DateField;
	import mx.events.FlexEvent;
	import mx.managers.CursorManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.ManagerMainMediator;
	import view.component.BookingList;
	import view.component.BookingSection;
	import view.manager.bookings.BookingListMediator;
	import view.manager.main.VisitDayMediator;
	import view.manager.main.VisitLocationMediator;
	
	public class BookingSectionMediator extends Mediator implements IMediator{
		public static const NAME:String = "BookingMediator";		
		
		
		public function BookingSectionMediator(viewComponent:Object){
			super(NAME, viewComponent);
			cmpBooking.addEventListener(FlexEvent.CREATION_COMPLETE, initSection);
		}
		
		private function initSection(evt:Event){
			sendNotification(ApplicationFacade.GET_LOCATION_LIST);
			facade.registerMediator(new VisitLocationMediator(VisitLocationMediator.NAME_IN_BOOKING,cmpBooking.cmpLocations));
			facade.registerMediator(new VisitDayMediator(VisitDayMediator.NAME_IN_BOOKING,cmpBooking.cmpCalendar));
			
			facade.registerMediator(new BookingListMediator(BookingListMediator.NAME_IN_LIST, cmpBooking.cmpBookingList));
			facade.registerMediator(new BookingListMediator(BookingListMediator.NAME_IN_DELETED_LIST, cmpBooking.cmpBookingDeletedList));
			
			facade.registerCommand(ApplicationFacade.GET_BOOKING_LIST, BookingGetListCommand);
			facade.registerCommand(ApplicationFacade.BOOKING_DELETE, BookingDeleteCommand);
			
			facade.registerCommand(ApplicationFacade.GET_NO_AVAILABLE_DAY_BOOKING, GetAvailableDayCommand);
		}
		
		private function notifyLocationSelected(evt:Event):void{			
			sendNotification(ApplicationFacade.GET_NO_AVAILABLE_DAY_BOOKING, cmpBooking.cmpLocations.locationSelected);
		}
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){
				case ApplicationFacade.ACTIVE_BOOKING_SECTION:					
					cmpBooking.cmpLocations.boxSede.enabled = true;
					cmpBooking.cmpCalendar.boxDay.enabled = true;
					facade.removeMediator(VisitLocationMediator.NAME_IN_HOME);
					facade.removeMediator(VisitDayMediator.NAME_IN_HOME);
					facade.registerMediator(new VisitLocationMediator(VisitLocationMediator.NAME_IN_BOOKING,cmpBooking.cmpLocations));
					facade.registerMediator(new VisitDayMediator(VisitDayMediator.NAME_IN_BOOKING,cmpBooking.cmpCalendar));
					break;
				case ApplicationFacade.GET_BOOKING_LIST_SUCCESS:
					var visitLocationMediator:VisitLocationMediator = facade.retrieveMediator(VisitLocationMediator.NAME_IN_BOOKING) as VisitLocationMediator;
					var city:String = visitLocationMediator.visitLocationCmp.locationSelected.city as String;	
					var visitDayMediator:VisitDayMediator = facade.retrieveMediator(VisitDayMediator.NAME_IN_BOOKING) as VisitDayMediator;					
					var date:String = DateField.dateToString(visitDayMediator.visitDayCmp.selectedDate as Date, "DD/MM/YYYY");
					
					var managerMainMediator:ManagerMainMediator = facade.retrieveMediator(ManagerMainMediator.NAME) as ManagerMainMediator;
					
					var cmpBookingList:BookingList = managerMainMediator.managerMain.cmpBookingSection.cmpBookingList;
					var cmpBookingDeletedList:BookingList = managerMainMediator.managerMain.cmpBookingSection.cmpBookingDeletedList;
					
					cmpBookingList.lblBookingList.text = cmpBookingList.testo+" di "+city+" per il giorno "+date as String;
					cmpBookingDeletedList.lblBookingList.text = cmpBookingDeletedList.testo+" di "+city+" per il giorno "+date as String;
					
					var _bookingList:ArrayCollection = notification.getBody() as ArrayCollection;
					CursorManager.removeAllCursors();
					if (_bookingList.length > 0){
						cmpBookingList.customerList = new ArrayCollection();
						cmpBookingList.bookingList = new ArrayCollection();
						cmpBookingDeletedList.customerList = new ArrayCollection();
						cmpBookingDeletedList.bookingList = new ArrayCollection();						
						for (var i:int=0; i<_bookingList.length; i++){
							var booking:Booking = new Booking();
							booking.id = _bookingList[i].id;
							var jsDecode:JSONDecoder = new JSONDecoder();
							var hour:SelectedHour = new SelectedHour();
							hour.hour = jsDecode.decode(_bookingList[i].visit_hour).hour;
							hour.busy = false;
							hour.index = jsDecode.decode(_bookingList[i].visit_hour).index;							
							booking.visitHour = hour;
							var customer:Object = jsDecode.decode(_bookingList[i].id_customer);
							if (_bookingList[i].cancelled == "false"){
								cmpBookingList.bookingList.addItem(booking);
								cmpBookingList.customerList.addItem(customer);								
							}
							else {								
								cmpBookingDeletedList.bookingList.addItem(booking);
								cmpBookingDeletedList.customerList.addItem(customer);								
							}	
						}						
						if (cmpBookingList.bookingList.length == 0)
							Alert.show("Non ci sono prenotazioni per la data selezionata");							
					}
					else{						
						if (cmpBookingList.customerList != null){
							cmpBookingList.customerList.removeAll();
							cmpBookingList.bookingList.removeAll();
						}
						if (cmpBookingDeletedList.customerList != null){
							cmpBookingDeletedList.customerList.removeAll();
							cmpBookingDeletedList.bookingList.removeAll();
						}						
						Alert.show("Questa data non è stata mai impegnata");							
					}									
					break;
				case ApplicationFacade.BOOKING_DELETE_SUCCESS:
					cmpBooking.cmpBookingList.btnDeleteUser.enabled = false;
					cmpBooking.cmpBookingList.dgRisultati.selectedIndex = -1;
					Alert.show("Delete OK");
					break;
				case ApplicationFacade.BOOKING_DELETE_ERROR:
					Alert.show("Errore delete");
					break;
			}
		}

		override public function listNotificationInterests():Array{
			return [				
				ApplicationFacade.ACTIVE_BOOKING_SECTION,
				ApplicationFacade.GET_BOOKING_LIST_SUCCESS,
				ApplicationFacade.BOOKING_DELETE_SUCCESS,
				ApplicationFacade.BOOKING_DELETE_ERROR
			];
		}	
		
		public function get cmpBooking():BookingSection{
			return viewComponent as BookingSection;
		}
	}
}