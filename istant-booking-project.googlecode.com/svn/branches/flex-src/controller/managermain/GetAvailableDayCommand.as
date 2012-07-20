package controller.managermain
{
	import model.managermain.LocationListProxy;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class GetAvailableDayCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification): void{
			if (facade.hasProxy(LocationListProxy.NAME)){				
				var locationListProxy:LocationListProxy = facade.retrieveProxy(LocationListProxy.NAME) as LocationListProxy;
				locationListProxy.getNoAvailableDay();				
			}
			else{
				var newLocationListProxy:LocationListProxy = new LocationListProxy(LocationListProxy.NAME);
				newLocationListProxy.getNoAvailableDay();
				facade.registerProxy(newLocationListProxy);				
			}
		}
	}
}