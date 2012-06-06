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
			var customer:CustomerInList=notification.getBody() as CustomerInList;	
			if (facade.hasProxy(CustomerProxy.NAME)){
				var customerProxy:CustomerProxy = facade.retrieveProxy(CustomerProxy.NAME) as CustomerProxy;
				customerProxy.removeCustomer(customer);
			}
			else{
				var newCustomerProxy:CustomerProxy = new CustomerProxy(CustomerProxy.NAME);
				newCustomerProxy.removeCustomer(customer);
				facade.registerProxy(newCustomerProxy);					
			}
		}
	}
}