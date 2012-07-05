package view.manager.main
{
	import model.vo.SelectedHour;
	
	import mx.controls.Alert;
	import mx.events.ItemClickEvent;
	
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
				
			}
		}
		
		override public function listNotificationInterests():Array{
			return [								
			];      
		}
		
		public function get visitHourCmp():VisitHours{
			return viewComponent as VisitHours;
		}
	}
}