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
		
		public function LocationProxy(proxyName){
			super(proxyName, new ArrayCollection());
		}
		
		public function addLocation(item:Location):void{
			locations.addItem({city:item.city,
							   address:item.address,
							   telephone_number:item.telephoneNumber, 
							   reception_days:item.receptionDays});
		}
		
		public function removeLocation(item:LocationInList):void{
			locations.removeItemAt(item.getPosition);
		}
		
		public function updateLocation(item:LocationInList):void{
			locations.setItemAt({id:item.getLocation.id,
				city:item.getLocation.city,
				address:item.getLocation.address,
				telephone_number:item.getLocation.telephoneNumber}, item.getPosition);
		}
		public function get locations() : ArrayCollection{
			var locationList:LocationList = facade.retrieveMediator(LocationListMediator.NAME).getViewComponent() as LocationList;
			return locationList.locationList as ArrayCollection;
		}
	}
}