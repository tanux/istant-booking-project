package controller.managermain
{
	import model.managermain.CustomerListProxy;
	import model.managermain.CustomerProxy;
	import model.vo.Customer;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class CustomerAddCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification) : void {
			var customerProxy:CustomerProxy = facade.retrieveProxy(CustomerProxy.NAME) as CustomerProxy;
			customerProxy.addCustomer(notification.getBody() as Customer);
		}
	}
}