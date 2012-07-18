package view.manager.main
{
	import com.adobe.serializers.json.JSONDecoder;
	
	import flash.events.Event;
	
	import model.vo.Location;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.controls.DateField;
	import mx.events.CalendarLayoutChangeEvent;
	import mx.events.FlexEvent;
	import mx.managers.CursorManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.ManagerMainMediator;
	import view.component.VisitDay;
	
	public class VisitDayMediator extends Mediator implements IMediator{
		private var counter_date_inserted:int = 0;
		private var locationSelected:Location;		
		[Bindable] public var day: Boolean = false;
		
		public function VisitDayMediator(mediatorName:String, viewComponent:Object){
			super(mediatorName, viewComponent);
			visitDayCmp.calendar.addEventListener(CalendarLayoutChangeEvent.CHANGE, detectSelectedDate);
		}
		
		private function detectSelectedDate(event:CalendarLayoutChangeEvent):void{
			sendNotification(ApplicationFacade.DATE_SELECTED);
			if (event.currentTarget.selectedDate == null) {
				return 
			}
			var selectedData:Date = new Date();			
			selectedData.date = event.currentTarget.selectedDate.getDate(); 
			selectedData.month = event.currentTarget.selectedDate.getMonth();
			selectedData.fullYear = event.currentTarget.selectedDate.getFullYear();
			visitDayCmp.selectedDate = selectedData;
			var stringFromDate:String = DateField.dateToString(visitDayCmp.selectedDate as Date, "DD/MM/YYYY");
			
			if (getMediatorName() == ManagerMainMediator.NAME_VISIT_DAY_MEDIATOR_MAIN){
				sendNotification(ApplicationFacade.GET_BUSY_HOURS, stringFromDate);
			}
			else if (getMediatorName() == ManagerMainMediator.NAME_VISIT_DAY_MEDIATOR_SHOWBOOKING){	
				if (locationSelected != null){
					sendNotification(ApplicationFacade.GET_BOOKING_LIST, {idLocation:locationSelected.id, date:stringFromDate});	
				}
				else return;
			}
			CursorManager.setBusyCursor();	
			day=true;
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.LOCATION_SELECTED_MAIN:
					locationSelected = notification.getBody() as Location;
					var jsDec:JSONDecoder = new JSONDecoder();					
					var days:ArrayCollection = jsDec.decode(locationSelected.receptionDays.toString()) as ArrayCollection;
					visitDayCmp.disabledDays = new Array();
					for (var i:int=0; i<days.length; i++){
						if (!days[i].selected){							
							visitDayCmp.disabledDays.push(days[i].numberAssociated);
						}
					}
					visitDayCmp.disabledDays.push(0);					
					break;
				case ApplicationFacade.GET_NO_AVAILABLE_DAY_SUCCESS:					
					var arrayDate:ArrayCollection = notification.getBody() as ArrayCollection;
					for (var i:int=0; i<counter_date_inserted; i++){
						visitDayCmp.arrayDate.pop();
					}
					for (var i:int=0; i<arrayDate.length; i++){
						var date:Date = DateField.stringToDate(arrayDate[i].date as String, "DD/MM/YYYY");
						visitDayCmp.arrayDate.push(date);
					}
					counter_date_inserted = arrayDate.length;					
					visitDayCmp.calendar.disabledRanges = visitDayCmp.arrayDate;
					visitDayCmp.calendar.dispatchEvent(new FlexEvent(FlexEvent.CREATION_COMPLETE));
					break;
				case ApplicationFacade.GET_NO_AVAILABLE_DAY_SUCCESS:
					Alert.show("Errore in GET_NO_AVAILABLE_DAY");
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.LOCATION_SELECTED_MAIN,
				ApplicationFacade.GET_NO_AVAILABLE_DAY_SUCCESS,
				ApplicationFacade.GET_NO_AVAILABLE_DAY_ERROR,
			];      
		}
		
		public function get visitDayCmp():VisitDay{
			return viewComponent as VisitDay;
		}
	}
}