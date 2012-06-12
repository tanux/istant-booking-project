package view.managermain
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Location;
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
	import view.component.HouseButton;
	import view.component.LocationList;
	
	public class LocationListMediator extends Mediator implements IMediator{
		public static const NAME:String = "LocationListMediator";
		[Bindable]private var locationInList:LocationInList;
		public function LocationListMediator(viewComponent:Object){
			super(NAME, viewComponent);
			locationListCmp.cmpHouseButton.btnAdd.addEventListener(MouseEvent.CLICK, addLocation);
		}
		private function init(evt:Event) : void {}
		
		public function addLocation(evt:Event): void{
			var newLocation:Location = new Location();
			newLocation.city = locationListCmp.tiLocationName.textInput.text;
			Alert.show(newLocation.city);
			Alert.show(locationListCmp.tiLocationName.textInput.text);
			newLocation.address = locationListCmp.tiStreet.textInput.text;
			newLocation.telephoneNumber = locationListCmp.tiTelephone.textInput.text;
			facade.sendNotification(ApplicationFacade.LOCATION_ADD, newLocation );
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
				case ApplicationFacade.LOCATION_ADD_SUCCESS:
					notify('default', 'Successo', 'Inserimento ok', locationListCmp.successIcon, 5000);
					resetTextInput();
					break;
				case ApplicationFacade.LOCATION_ADD_ERROR:
					Alert.show("Errore inserimento");
					break;
				case ApplicationFacade.GET_LOCATION_LIST_SUCCESS:					
					var locationListResult:ArrayCollection = notification.getBody() as ArrayCollection;					
					locationListCmp.locationList = locationListResult;					
					break;
				case ApplicationFacade.GET_LOCATION_LIST_ERROR:
					Alert.show("Location: Errore!");
					break;
				case ApplicationFacade.GET_LOCATION_LIST_FAULT:
					Alert.show("LocationList: Fault");
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
				ApplicationFacade.LOCATION_SELECTED,
				ApplicationFacade.LOCATION_ADD_SUCCESS,
				ApplicationFacade.LOCATION_ADD_ERROR,
				ApplicationFacade.GET_LOCATION_LIST_SUCCESS,
				ApplicationFacade.GET_LOCATION_LIST_ERROR,
				ApplicationFacade.GET_LOCATION_LIST_FAULT
			];
		}
		
		public function get locationListCmp():LocationList{
			return viewComponent as LocationList;
		}
		
		
	}
}