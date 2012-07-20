package controller.managermain
{
	import model.managermain.CustomerListProxy;
	import model.managermain.CustomerProxy;
	import model.vo.Customer;
	import model.vo.CustomerInList;
	
	import mx.controls.Alert;
	import mx.states.AddItems;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class CustomerAddCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification) : void {
			var customerInList:CustomerInList = notification.getBody() as CustomerInList;
			var customer:Customer=notification.getBody() as Customer;			
			if (facade.hasProxy(CustomerListProxy.NAME)){
				var customerListProxy:CustomerListProxy = facade.retrieveProxy(CustomerListProxy.NAME) as CustomerListProxy;
				customerListProxy.addCustomer(customer);
			}
			else{
				var newCustomerListProxy:CustomerListProxy = new CustomerListProxy(CustomerListProxy.NAME);
				newCustomerListProxy.addCustomer(customer);
				facade.registerProxy(newCustomerListProxy);
			}
			var newCustomerProxy:CustomerProxy = new CustomerProxy(CustomerProxy.NAME, customer);
			facade.registerProxy(newCustomerProxy);
		}
	}
}