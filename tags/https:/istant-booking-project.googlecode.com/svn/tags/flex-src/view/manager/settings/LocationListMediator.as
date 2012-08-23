package view.manager.settings
{
	import com.adobe.serializers.json.JSONDecoder;
	import com.adobe.serializers.json.JSONEncoder;
	import com.adobe.serializers.json.JSONSerializationFilter;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Location;
	import model.vo.LocationInList;
	import model.vo.SelectedDay;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.controls.CheckBox;
	import mx.data.ChangeObject;
	import mx.events.ListEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.tylerchesley.bark.core.Notification;
	import org.tylerchesley.bark.events.NotificationEvent;
	
	import spark.components.ToggleButton;
	
	import view.ManagerMainMediator;
	import view.component.LocationList;


	
	public class LocationListMediator extends Mediator implements IMediator{
		public static const NAME:String = "LocationListMediator";
		[Bindable]private var locationInList:LocationInList;
						
		public function LocationListMediator(viewComponent:Object){
			super(NAME, viewComponent);
			locationListCmp.cmpHouseButton.btnAdd.addEventListener(MouseEvent.CLICK, addLocation);
			locationListCmp.cmpHouseButton.btnDelete.addEventListener(MouseEvent.CLICK, deleteLocation);
			locationListCmp.cmpHouseButton.btnSave.addEventListener(MouseEvent.CLICK, saveChanges);
			locationListCmp.cmpHouseButton.btnReset.addEventListener(MouseEvent.CLICK, resetAll);
		}
		
		private function init(evt:Event) : void {}
		
		private function resetAll(evt:Event): void{
			resetTextInput();	
			locationListCmp.cmpHouseButton.btnAdd.enabled = false;
			locationListCmp.cmpHouseButton.btnDelete.enabled = false;
			locationListCmp.cmpHouseButton.btnSave.enabled = false;
			locationListCmp.abilitaAdd=true;
			locationListCmp.dgLocationList.selectedIndex = -1;
		}
		
		private function makeArraysDays(): Array {							
			var days:Array = new Array();
			var i:int;
			var length:int = locationListCmp.days.length;			
			for (i=0; i<length; i++){
				var day:SelectedDay = new SelectedDay();
				day.selected = locationListCmp.chkBxDay[i].selected;
				day.numberAssociated = i+1;
				day.label = locationListCmp.days[i].label as String;
				days.push(day);
			}
			return days;
		}
		
		
		private function addLocation(evt:Event): void{			
			var jsEnc:JSONEncoder = new JSONEncoder();
			var newLocation:Location = new Location();			
			newLocation.city = locationListCmp.tiLocationName.text;			
			newLocation.address = locationListCmp.tiStreet.text;
			newLocation.telephoneNumber = locationListCmp.tiTelephone.text;			
			newLocation.receptionDays = jsEnc.encode(makeArraysDays());						
			facade.sendNotification(ApplicationFacade.LOCATION_ADD, newLocation);			
		}
		
		
		private function deleteLocation(evt:Event): void{
			var delLocation:Location = new Location();
			delLocation.id = locationInList.getLocation.id;
			var lInList:LocationInList = new LocationInList(delLocation, locationInList.getPosition);
			facade.sendNotification(ApplicationFacade.LOCATION_DELETE, lInList);
		}
		
		private function saveChanges(evt:Event): void {
			var jsEnc:JSONEncoder = new JSONEncoder();
			var locationChanged:Location = new Location();			
			locationChanged.id = locationInList.getLocation.id;
			locationChanged.city = locationListCmp.tiLocationName.text;
			locationChanged.address = locationListCmp.tiStreet.text;
			locationChanged.telephoneNumber = locationListCmp.tiTelephone.text;			
			locationChanged.receptionDays = jsEnc.encode(makeArraysDays());
			var lInList:LocationInList = new LocationInList(locationChanged, locationInList.getPosition);			
			facade.sendNotification(ApplicationFacade.LOCATION_SAVE_CHANGES, lInList);
		}
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){
				case ApplicationFacade.LOCATION_SELECTED_SETTINGSECTION:
					locationInList = notification.getBody() as LocationInList;
					locationListCmp.abilitaAdd=false;
					locationListCmp.daySelected=true;
					locationListCmp.tiLocationName.text = locationInList.getLocation.city as String;
					locationListCmp.tiStreet.text = locationInList.getLocation.address as String;
					locationListCmp.tiTelephone.text = locationInList.getLocation.telephoneNumber as String;					
					var jsDec:JSONDecoder = new JSONDecoder();
					for (var i:int=0; i<locationListCmp.days.length; i++){
						locationListCmp.chkBxDay[i].selected = jsDec.decode(locationInList.getLocation.receptionDays.toString())[i].selected;	
					}
					//locationListCmp.cmpHouseButton.btnSave.enabled = true;
					locationListCmp.cmpHouseButton.btnAdd.enabled = false;
					locationListCmp.cmpHouseButton.btnDelete.enabled = true;
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
					Alert.show("LocationList: Fault! Errore comunicazione server");
					break;
				case ApplicationFacade.LOCATION_SAVE_CHANGES_SUCCESS:
					notify('default', 'Successo', 'L\'operazione è andata a buon fine', locationListCmp.successIcon, 5000);
					resetTextInput();
					locationListCmp.abilitaAdd=true;
					locationListCmp.cmpHouseButton.btnSave.enabled = false;
					locationListCmp.cmpHouseButton.btnAdd.enabled = true;
					locationListCmp.cmpHouseButton.btnDelete.enabled = false;
					break;
				case ApplicationFacade.LOCATION_SAVE_CHANGES_ERROR:
					Alert.show("Errore nel salvataggio");
					break;
				case ApplicationFacade.LOCATION_DELETE_SUCCESS:
					notify('default', 'Successo', 'Eliminazione ok', locationListCmp.successIcon, 5000);
					resetTextInput();
					locationListCmp.abilitaAdd=true;
					locationListCmp.cmpHouseButton.btnSave.enabled = false;
					locationListCmp.cmpHouseButton.btnAdd.enabled = false;
					locationListCmp.cmpHouseButton.btnDelete.enabled = false;
					break;
				case ApplicationFacade.LOCATION_DELETE_ERROR:
					Alert.show("Errore delete");
					break;
			}
			
		}
		
		private function resetTextInput():void{
			locationListCmp.tiLocationName.text = LocationList.CITY_PROMT;
			locationListCmp.tiLocationName.showCancelButton = false;
			
			locationListCmp.tiStreet.text = LocationList.ADDRESS_PROMT;
			locationListCmp.tiStreet.showCancelButton = false;
			
			locationListCmp.tiTelephone.text =  LocationList.TELEPHONE_PROMT;
			locationListCmp.tiTelephone.showCancelButton = false;
			
			for (var i:int=0; i<locationListCmp.days.length; i++){
				locationListCmp.chkBxDay[i].selected = false;
			}
			
			locationListCmp.dgLocationList.selectedIndex = -1;
			locationListCmp.daySelected = false;
			locationListCmp.cmpHouseButton.btnAdd.enabled = false;
			locationListCmp.cmpHouseButton.btnSave.enabled = false;
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
				ApplicationFacade.LOCATION_SELECTED_SETTINGSECTION,
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