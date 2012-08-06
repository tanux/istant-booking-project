package model.managermain
{
	import model.services.CustomersService;
	import model.vo.Customer;
	import model.vo.CustomerInList;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import view.component.CustomerSection;
	import view.manager.main.CustomerSectionMediator;
	
	public class CustomerProxy extends Proxy implements IProxy{
		public static const NAME = "CustomerProxy";
		private var _customer:Customer;
		
		public function CustomerProxy(proxyName:String, customer:Customer){
			super(proxyName, new ArrayCollection());
			_customer = new Customer();
			_customer = customer;
		}
		
		public function addCustomer(idCustomer:String):void{			
			customers.addItem({id:idCustomer,
							   firstname:_customer.firstName,
							   lastname:_customer.lastName,
							   email:_customer.email,
							   telephone_number:_customer.telephoneNumber});
		}
		
		public function removeCustomer(position:int):void{
			customers.removeItemAt(position);
		}
		
		public function updateCustomer(position:int):void{
			customers.setItemAt({id:_customer.id,
				                 firstname:_customer.firstName,
								 lastname:_customer.lastName,
								 email:_customer.email,
								 telephone_number:_customer.telephoneNumber}, position);
		}
		public function get customers() : ArrayCollection{
			var customerList:CustomerSection = facade.retrieveMediator(CustomerSectionMediator.NAME).getViewComponent() as CustomerSection;
			return customerList.customerList as ArrayCollection;
		}
	}
}