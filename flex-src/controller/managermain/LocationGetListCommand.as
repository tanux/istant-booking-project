package controller.managermain
{
	import model.managermain.LocationListProxy;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class CustomerGetListCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			if (facade.hasProxy(LocationListProxy.NAME)){
				var customerListProxy:LocationListProxy = facade.retrieveProxy(LocationListProxy.NAME) as LocationListProxy;
				customerListProxy.getLocationList();				
			}
			else{
				var newCustomerListProxy:LocationListProxy = new LocationListProxy(LocationListProxy.NAME);
				newCustomerListProxy.getLocationList();
				facade.registerProxy(newCustomerListProxy);				
			}
			facade.registerCommand(ApplicationFacade.LOCATION_SAVE_CHANGES, LocationSaveChangesController);
			//facade.registerCommand(ApplicationFacade.CUSTOMER_ADD, LocationAddCommand);
			//facade.registerCommand(ApplicationFacade.CUSTOMER_DELETE, LocationDeleteCommand);
		}
	}
}