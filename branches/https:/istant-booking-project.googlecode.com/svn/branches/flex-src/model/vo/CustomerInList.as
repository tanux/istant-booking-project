package model.vo
{
	public class CustomerInList{
		
		private var customer:Customer;
		private var position:int;
		
		public function CustomerInList(customer:Customer, position:int){			
			this.customer = customer as Customer;
			this.position = position as int;			
		}
		
		public function get getCustomer():Customer{
			return this.customer;
		}
		public function get getPosition():int{
			return this.position;
		}
	}
}