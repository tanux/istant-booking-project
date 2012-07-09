package view.manager.main
{
	import com.adobe.serializers.json.JSONDecoder;
	
	import flash.events.Event;
	
	import model.vo.Location;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.CalendarLayoutChangeEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.VisitDay;
	
	public class VisitDayMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "VisitDayMediator";
		public function VisitDayMediator(viewComponent:Object){
			super(NAME, viewComponent);
			visitDayCmp.calendar.addEventListener(CalendarLayoutChangeEvent.CHANGE, detectSelectedDate);
		}
		
		private function detectSelectedDate(event:CalendarLayoutChangeEvent):void{
			if (event.currentTarget.selectedDate == null) {
				return 
			}
			var selectedData:Date = new Date();			
			selectedData.date = event.currentTarget.selectedDate.getDate(); 
			selectedData.month = event.currentTarget.selectedDate.getMonth();
			selectedData.fullYear = event.currentTarget.selectedDate.getFullYear();
			visitDayCmp.selectedDate = selectedData;
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.LOCATION_SELECTED_MAIN:
					var locationSelected:Location = notification.getBody() as Location;
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
					visitDayCmp.arrayDate = new Array();
					var arrayDate:ArrayCollection = notification.getBody() as ArrayCollection;				
					Alert.show(""+arrayDate[0].date);
					/*for (var i:int=0; i<arrayDate.length; i++){
						//var date:Date = new Date();
						
					}*/					
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