package view.manager.main
{
	import com.adobe.serializers.json.JSONDecoder;
	import com.adobe.serializers.json.JSONEncoder;
	
	import model.vo.SelectedHour;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.ItemClickEvent;
	import mx.managers.CursorManager;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.VisitHours;
	
	public class VisitHoursMediator extends Mediator{
		public static const NAME:String = "VisitHourMediator";
		
		public function VisitHoursMediator(viewComponent:Object){
			super(NAME, viewComponent);
			visitHourCmp.rbgHours.addEventListener(ItemClickEvent.ITEM_CLICK, handleHour);
		}
		
		private function handleHour(event:ItemClickEvent):void {
			visitHourCmp.hourSelected = new SelectedHour();
			visitHourCmp.hourSelected.hour = event.currentTarget.selectedValue.hour;
			visitHourCmp.hourSelected.index = event.currentTarget.selectedValue.index;
			visitHourCmp.hourSelected.busy = true;
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.GET_BUSY_HOURS_SUCCESS:
					var arrayVisitHour:ArrayCollection = notification.getBody() as ArrayCollection;
					var hours:Array = [
						{hour:'15.00',index:0,busy:false},
						{hour:'16.00',index:1,busy:false},
						{hour:'17.00',index:2,busy:false},
						{hour:'18.00',index:3,busy:false},
						{hour:'19.00',index:4,busy:false},
						{hour:'20.00',index:5,busy:false}
					];
					if (arrayVisitHour.length > 0){
						var jsDecode:JSONDecoder = new JSONDecoder();						
						for (var i:int=0; i<arrayVisitHour.length; i++){
							var obj:Object = jsDecode.decode(arrayVisitHour[i].visit_hour);
							hours[obj.index].busy = obj.busy;
						}							
					}
					visitHourCmp.hours = hours;
					CursorManager.removeBusyCursor();
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_BUSY_HOURS_SUCCESS
			];      
		}
		
		public function get visitHourCmp():VisitHours{
			return viewComponent as VisitHours;
		}
	}
}