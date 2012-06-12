package model.managermain
{
	import model.services.CustomersService;
	import model.vo.Customer;
	import model.vo.CustomerInList;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import view.component.CustomerList;
	import view.manager.main.CustomerListMediator;
	
	public class CustomerProxy extends Proxy implements IProxy{
		public static const NAME = "CustomerProxy";
		
		public function CustomerProxy(proxyName){
			super(proxyName, new ArrayCollection());
		}
		
		public function addCustomer(item:Customer):void{
			customers.addItem({firstname:item.firstName,
							   lastname:item.lastName,
							   email:item.email,
							   telephone_number:item.telephoneNumber});
		}
		
		public function removeCustomer(item:CustomerInList):void{
			customers.removeItemAt(item.getPosition);
		}
		
		public function updateCustomer(item:CustomerInList):void{
			customers.setItemAt({id:item.getCustomer.id,
				                 firstname:item.getCustomer.firstName,
								 lastname:item.getCustomer.lastName,
								 email:item.getCustomer.email,
								 telephone_number:item.getCustomer.telephoneNumber}, item.getPosition);
		}
		public function get customers() : ArrayCollection{
			var customerList:CustomerList = facade.retrieveMediator(CustomerListMediator.NAME).getViewComponent() as CustomerList;
			return customerList.customerList as ArrayCollection;
		}
	}
}