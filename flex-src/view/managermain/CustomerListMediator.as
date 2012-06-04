package view.managermain
{
	import flash.events.Event;
	
	import model.vo.Customer;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.ManagerMainMediator;
	import view.component.CustomerList;
	
	public class CustomerListMediator extends Mediator implements IMediator{
		public static const NAME:String = "CustomerListMediator";
		
		public function CustomerListMediator(viewComponent:Object){
			super(NAME, viewComponent);
			
		}
		
		private function init(evt:Event) : void {}
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){
				case ApplicationFacade.GET_CUSTOMER_LIST_SUCCESS:					
					var customerListResult:ArrayCollection = notification.getBody() as ArrayCollection;					
					customerListCmp.customerList = customerListResult;					
					break;
				case ApplicationFacade.GET_CUSTOMER_LIST_ERROR:
					Alert.show("Lista Clienti: Errore nel prelevamento dati");
					break;
				case ApplicationFacade.GET_CUSTOMER_LIST_FAULT:
					Alert.show("CustomerList: Fault");
					break;
				case ApplicationFacade.CUSTOMER_SELECTED:
					var customer:Customer = notification.getBody() as Customer;
					customerListCmp.tiFirstname.text = customer.firstName as String;
					customerListCmp.tiLastname.text = customer.lastName as String;
					customerListCmp.tiEmail.text = customer.email as String;
					customerListCmp.tiTelephoneNumber.text = customer.telephoneNumber as String;
					break;
			}

		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_CUSTOMER_LIST_SUCCESS,
				ApplicationFacade.GET_CUSTOMER_LIST_ERROR,
				ApplicationFacade.GET_CUSTOMER_LIST_FAULT,
				ApplicationFacade.CUSTOMER_SELECTED
			];
		}
		
		public function get customerListCmp():CustomerList{
			return viewComponent as CustomerList;
		}
		
		
	}
}