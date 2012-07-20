package controller.managermain
{
	import model.managermain.CustomerListProxy;
	import model.managermain.CustomerProxy;
	import model.vo.Customer;
	import model.vo.CustomerInList;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class CustomerDeleteCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification) : void {
			var customerInList:CustomerInList = notification.getBody() as CustomerInList;
			var customer:Customer=customerInList.getCustomer as Customer;			
			if (facade.hasProxy(CustomerListProxy.NAME)){
				var customerListProxy:CustomerListProxy = facade.retrieveProxy(CustomerListProxy.NAME) as CustomerListProxy;
				customerListProxy.deleteCustomer(customer);
				
				if (facade.hasProxy(CustomerProxy.NAME)){
					var customerProxy:CustomerProxy = facade.retrieveProxy(CustomerProxy.NAME) as CustomerProxy;
					customerProxy.removeCustomer(customerInList.getPosition);
				}else{				
					var newCustomerProxy:CustomerProxy = new CustomerProxy(CustomerProxy.NAME, customer);
					newCustomerProxy.removeCustomer(customerInList.getPosition);
					facade.registerProxy(newCustomerProxy);						
				}
			}
			else{
				var newCustomerListProxy:CustomerListProxy = new CustomerListProxy(CustomerListProxy.NAME);
				newCustomerListProxy.deleteCustomer(customer);
				facade.registerProxy(newCustomerListProxy);
			}
		}
	}
}