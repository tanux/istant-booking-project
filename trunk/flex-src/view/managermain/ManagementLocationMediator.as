package view.managermain
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import IstantBookingProject.Location;
	import model.vo.LocationInList;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.ListEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.tylerchesley.bark.core.Notification;
	import org.tylerchesley.bark.events.NotificationEvent;
	
	import view.ManagerMainMediator;
	import view.component.ManagementLocation;
	import view.component.LocationPanelManagementLocation;
	
	public class ManagementLocationMediator extends Mediator implements IMediator{
		public static const NAME:String = "ManagementLocationMediator";
		[Bindable]private var locationInList:LocationInList;
		public function ManagementLocationMediator(viewComponent:Object){
			super(NAME, viewComponent);
			
			
		}
		private function init(evt:Event) : void {}
		
		public function addLocation(evt:Event): void{

		}
		
		
		public function deleteLocation(evt:Event): void{

		}
		
		private function saveChanges(evt:Event): void {			
		
		}
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){
				case ApplicationFacade.LOCATION_SELECTED:
					locationInList = notification.getBody() as LocationInList;
					locationListCmp.tiLocationName = locationInList.getLocation.city as String;
					locationListCmp.tiStreet = locationInList.getLocation.address as String;
					locationListCmp.tiTelephone.text = locationInList.getLocation.telephoneNumber as String;
					break;
			}
			
		}
		
		private function resetTextInput():void{

		}
		
		private function notify(type:String = 'default',
								title:String = '', 
								description:String = '', 
								icon:Object = null,
								duration:Number = 3000) : void {
			
			var notification:Notification = new Notification(type, duration, title, description, icon);
			notification.addEventListener(NotificationEvent.NOTIFICATION_ITEM_CLICK, clickHandler);
			locationListCmp.dispatchEvent(new NotificationEvent(NotificationEvent.NOTIFY, notification));
		}
		
		private function clickHandler(event:NotificationEvent) : void {}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.LOCATION_SELECTED			
			];
		}
		
		public function get locationListCmp():LocationPanelManagementLocation{
			return viewComponent as LocationPanelManagementLocation;
		}
		
		
	}
}