package controller.managermain
{
	import model.managermain.CustomerListProxy;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class GetCustomerListCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			if (facade.hasProxy(CustomerListProxy.NAME)){
				var customerListProxy:CustomerListProxy = facade.retrieveProxy(CustomerListProxy.NAME) as CustomerListProxy;
				customerListProxy.getCustomerList();
			}
			else{
				var newCustomerListProxy:CustomerListProxy = new CustomerListProxy(CustomerListProxy.NAME);
				newCustomerListProxy.getCustomerList();
				facade.registerProxy(newCustomerListProxy);
			}
		}
	}
}