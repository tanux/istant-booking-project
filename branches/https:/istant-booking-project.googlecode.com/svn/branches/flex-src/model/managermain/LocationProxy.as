package model.managermain
{
	import model.services.LocationServices;
	import model.vo.Location;
	import model.vo.LocationInList;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import view.component.LocationList;
	import view.manager.settings.LocationListMediator;
	
	public class LocationProxy extends Proxy implements IProxy{
		public static const NAME = "LocationProxy";
		private var _location:Location;
		public function LocationProxy(proxyName:String, location:Location){
			super(proxyName, new ArrayCollection());
			_location = new Location();
			_location = location;
		}
		
		public function addLocation(idLocation:String):void{
			locations.addItem({id:idLocation,
							   city:_location.city,
							   address:_location.address,
							   telephone_number:_location.telephoneNumber, 
							   reception_days:_location.receptionDays});
		}
		
		public function removeLocation(position:int):void{
			locations.removeItemAt(position);
		}
		
		public function updateLocation(position:int):void{						
			locations.setItemAt({id:_location.id,
				city:_location.city,
				address:_location.address,
				telephone_number:_location.telephoneNumber,
				reception_days:_location.receptionDays},position);
		}
		public function get locations() : ArrayCollection{
			var locationList:LocationList = facade.retrieveMediator(LocationListMediator.NAME).getViewComponent() as LocationList;
			return locationList.locationList as ArrayCollection;
		}
	}
}