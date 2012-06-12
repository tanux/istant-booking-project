package controller.managermain
{
	import model.managermain.LocationListProxy;
	import model.managermain.LocationProxy;
	import model.vo.Location;
	import model.vo.LocationInList;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class LocationDeleteCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification) : void {
			var locationInList:LocationInList = notification.getBody() as LocationInList;
			
			var location:Location=locationInList.getLocation as Location;
			
			var location:Location= locationInList.getLocation as Location;			
			if (facade.hasProxy(LocationListProxy.NAME)){
				var locationListProxy:LocationListProxy = facade.retrieveProxy(LocationListProxy.NAME) as LocationListProxy;
				locationListProxy.deleteLocation(location);
				if (facade.hasProxy(LocationProxy.NAME)){
					var locationProxy:LocationProxy = facade.retrieveProxy(LocationProxy.NAME) as LocationProxy;
					locationProxy.removeLocation(locationInList);
				}else{				
					var newLocationProxy:LocationProxy = new LocationProxy(LocationProxy.NAME);
					newLocationProxy.removeLocation(locationInList);
					facade.registerProxy(newLocationProxy);						
				}
			}
			else{
				var newLocationListProxy:LocationListProxy = new LocationListProxy(LocationListProxy.NAME);
				newLocationListProxy.deleteLocation(location);
				facade.registerProxy(newLocationListProxy);
			}
		}
	}
}