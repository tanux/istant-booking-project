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
	import view.component.LocationList;
	//import view.component.HouseButton;
	
	public class LocationListMediator extends Mediator implements IMediator{
		public static const NAME:String = "LocationListMediator";
		[Bindable]private var locationInList:LocationInList;
		public function LocationListMediator(viewComponent:Object){
			super(NAME, viewComponent);
			locationListCmp.cmpHouseButton.btnAdd.addEventListener(MouseEvent.CLICK, addLocation);
			locationListCmp.cmpHouseButton.btnDelete.addEventListener(MouseEvent.CLICK, deleteLocation);
			locationListCmp.cmpHouseButton.btnSave.addEventListener(MouseEvent.CLICK, saveChanges);
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
			var delLocation:Location = new Location();
			delLocation.id = locationInList.getLocation.id;
			delLocation.city = locationListCmp.tiLocationName.textInput.text;
			delLocation.address = locationListCmp.tiStreet.textInput.text;
			delLocation.telephoneNumber = locationListCmp.tiTelephone.textInput.text;
			var lInList:LocationInList = new LocationInList(delLocation, locationInList.getPosition);
			facade.sendNotification(ApplicationFacade.LOCATION_DELETE, lInList);
		}
		
		private function saveChanges(evt:Event): void {			
			var locationChanged:Location = new Location();			
			locationChanged.id = locationInList.getLocation.id;
			locationChanged.city = locationListCmp.tiLocationName.textInput.text;
			locationChanged.address = locationListCmp.tiStreet.textInput.text;
			locationChanged.telephoneNumber = locationListCmp.tiTelephone.textInput.text;
			var cInList:LocationInList = new LocationInList(locationChanged, locationInList.getPosition);
			facade.sendNotification(ApplicationFacade.LOCATION_SAVE_CHANGES, cInList);
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
				case ApplicationFacade.LOCATION_SAVE_CHANGES_SUCCESS:
					notify('default', 'Successo', 'L\'operazione è andata a buon fine', locationListCmp.successIcon, 5000);
					resetTextInput();					
					locationListCmp.cmpHouseButton.btnSave.enabled = false;
					break;
				case ApplicationFacade.LOCATION_SAVE_CHANGES_ERROR:
					Alert.show("Errore nel salvataggio");
					break;
				case ApplicationFacade.LOCATION_DELETE_SUCCESS:
					notify('default', 'Successo', 'Eliminazione ok', locationListCmp.successIcon, 5000);
					resetTextInput();
					break;
				case ApplicationFacade.LOCATION_DELETE_ERROR:
					Alert.show("Errore delete");
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
				ApplicationFacade.GET_LOCATION_LIST_FAULT,
				ApplicationFacade.LOCATION_SAVE_CHANGES_SUCCESS,
				ApplicationFacade.LOCATION_SAVE_CHANGES_ERROR,
				ApplicationFacade.LOCATION_DELETE_SUCCESS,
				ApplicationFacade.LOCATION_DELETE_ERROR,
				ApplicationFacade.LOCATION_DELETE_FAULT	
			];
		}
		
		public function get locationListCmp():LocationList{
			return viewComponent as LocationList;
		}
		
		
	}
}