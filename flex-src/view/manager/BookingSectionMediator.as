package view.manager
{
	import controller.managermain.BookingDeleteCommand;
	import controller.managermain.BookingGetListCommand;
	import controller.managermain.GetAvailableDayCommand;
	
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.BookingSection;
	import view.manager.bookings.BookingListMediator;
	import view.manager.main.VisitDayMediator;
	import view.manager.main.VisitLocationMediator;
	
	public class BookingSectionMediator extends Mediator implements IMediator{
		public static const NAME:String = "BookingMediator";		
		public static const NAME_BOOKING_LIST_MEDIATOR:String = "BookingListMediator";
		public static const NAME_BOOKING_DELETED_LIST_MEDIATOR:String = "BookingDeletedListMediator";
		
		public function BookingSectionMediator(viewComponent:Object){
			super(NAME, viewComponent);
			cmpBooking.addEventListener(FlexEvent.CREATION_COMPLETE, initSection);
		}
		
		private function initSection(evt:Event){
			sendNotification(ApplicationFacade.GET_LOCATION_LIST);
			facade.registerMediator(new VisitLocationMediator(VisitLocationMediator.NAME_IN_BOOKING,cmpBooking.cmpLocations));
			facade.registerMediator(new VisitDayMediator(VisitDayMediator.NAME_IN_BOOKING,cmpBooking.cmpCalendar));
			facade.registerMediator(new BookingListMediator(NAME_BOOKING_LIST_MEDIATOR, cmpBooking.cmpBookingList));
			facade.registerMediator(new BookingListMediator(NAME_BOOKING_DELETED_LIST_MEDIATOR, cmpBooking.cmpBookingDeletedList));
			
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
					
					/*
					if ( !facade.hasMediator(NAME_VISIT_LOCATION_MEDIATOR_BOOKING) && !facade.hasMediator(NAME_VISIT_DAY_MEDIATOR_BOOKING) ){
						sendNotification(ApplicationFacade.GET_LOCATION_LIST);
						facade.registerMediator(new VisitLocationMediator(NAME_VISIT_LOCATION_MEDIATOR_BOOKING,cmpBooking.cmpLocations));
						facade.registerMediator(new VisitDayMediator(NAME_VISIT_DAY_MEDIATOR_BOOKING,cmpBooking.cmpCalendar));
						trace("ShowBooking: mediator creati");
					}
					
					if ( !facade.hasMediator(NAME_BOOKING_LIST_MEDIATOR) && !facade.hasMediator(NAME_BOOKING_DELETED_LIST_MEDIATOR) ){
						facade.registerMediator(new BookingListMediator(NAME_BOOKING_LIST_MEDIATOR, cmpBooking.cmpBookingList));
						facade.registerMediator(new BookingListMediator(NAME_BOOKING_DELETED_LIST_MEDIATOR, cmpBooking.cmpBookingDeletedList));
					}
					
					if ( !facade.hasCommand(ApplicationFacade.GET_BOOKING_LIST) && !facade.hasCommand(ApplicationFacade.BOOKING_DELETE) ){
						facade.registerCommand(ApplicationFacade.GET_BOOKING_LIST, BookingGetListCommand);
						facade.registerCommand(ApplicationFacade.BOOKING_DELETE, BookingDeleteCommand);
					}*/	
					
					break;
			}
		}

		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.ACTIVE_BOOKING_SECTION				
			];
		}	
		
		public function get cmpBooking():BookingSection{
			return viewComponent as BookingSection;
		}
	}
}