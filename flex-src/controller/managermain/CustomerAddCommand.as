package controller.managermain
{
	import model.managermain.CustomerListProxy;
	import model.managermain.CustomerProxy;
	import model.vo.Customer;
	
	import mx.controls.Alert;
	import mx.states.AddItems;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class CustomerAddCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification) : void {
			var customer:Customer=notification.getBody() as Customer;			
			if (facade.hasProxy(CustomerListProxy.NAME)){
				var customerProxy:CustomerProxy = facade.retrieveProxy(CustomerProxy.NAME) as CustomerProxy;
				customerProxy.addCustomer(customer);
			}
			else{
				var newCustomerProxy:CustomerProxy = new CustomerProxy(CustomerProxy.NAME);
				newCustomerProxy.addCustomer(customer);
				facade.registerProxy(newCustomerProxy);					
			}
			
		}
	}
}