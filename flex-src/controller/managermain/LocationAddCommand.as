package controller.managermain
{
	import model.managermain.LocationListProxy;
	import model.managermain.LocationProxy;
	import model.vo.Location;
	import model.vo.LocationInList;
	
	import mx.controls.Alert;
	import mx.states.AddItems;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class LocationAddCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification) : void {
			var locationInList:LocationInList = notification.getBody() as LocationInList;
			var location:Location=notification.getBody() as Location;			
			if (facade.hasProxy(LocationListProxy.NAME)){
				var locationListProxy:LocationListProxy = facade.retrieveProxy(LocationListProxy.NAME) as LocationListProxy;
				locationListProxy.addLocation(location);
				if (facade.hasProxy(LocationProxy.NAME)){
					var locationProxy:LocationProxy = facade.retrieveProxy(LocationProxy.NAME) as LocationProxy;
					locationProxy.addLocation(location);
				}else{				
					var newLocationProxy:LocationProxy = new LocationProxy(LocationProxy.NAME);
					newLocationProxy.addLocation(location);
					facade.registerProxy(newLocationProxy);						
				}
			}
			else{
				var newLocationListProxy:LocationListProxy = new LocationListProxy(LocationListProxy.NAME);
				newLocationListProxy.addLocation(location);
				facade.registerProxy(newLocationListProxy);
			}
		}
	}
}