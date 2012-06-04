package view.managermain
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Customer;
	import model.vo.CustomerInList;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.ListEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.ManagerMainMediator;
	import view.component.CustomerList;
	
	public class CustomerListMediator extends Mediator implements IMediator{
		public static const NAME:String = "CustomerListMediator";
		[Bindable]private var customerInList:CustomerInList;
		public function CustomerListMediator(viewComponent:Object){
			super(NAME, viewComponent);
			customerListCmp.btnSave.addEventListener(MouseEvent.CLICK,saveChanges);			
		}
		
		private function init(evt:Event) : void {}
		
		private function saveChanges(evt:Event): void {			
			var customerChanged:Customer = new Customer();			
			customerChanged.id = customerInList.getCustomer.id;
			customerChanged.firstName = customerListCmp.tiFirstname.text;
			customerChanged.lastName = customerListCmp.tiLastname.text;
			customerChanged.email = customerListCmp.tiEmail.text;
			customerChanged.telephoneNumber = customerListCmp.tiTelephoneNumber.text;
			var cInList:CustomerInList = new CustomerInList(customerChanged, customerInList.getPosition);
			facade.sendNotification(ApplicationFacade.CUSTOMER_SAVE_CHANGES, cInList);			
		}
		
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
					customerInList = notification.getBody() as CustomerInList;
					customerListCmp.tiFirstname.text = customerInList.getCustomer.firstName as String;
					customerListCmp.tiLastname.text = customerInList.getCustomer.lastName as String;
					customerListCmp.tiEmail.text = customerInList.getCustomer.email as String;
					customerListCmp.tiTelephoneNumber.text = customerInList.getCustomer.telephoneNumber as String;
					customerListCmp.btnSave.enabled = true;
					break;
				case ApplicationFacade.CUSTOMER_SAVE_CHANGES_SUCCESS:
					Alert.show("Dati Salvati");
					break;
				case ApplicationFacade.CUSTOMER_SAVE_CHANGES_ERROR:
					Alert.show("Errore nel salvataggio");
					break;
			}

		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_CUSTOMER_LIST_SUCCESS,
				ApplicationFacade.GET_CUSTOMER_LIST_ERROR,
				ApplicationFacade.GET_CUSTOMER_LIST_FAULT,
				ApplicationFacade.CUSTOMER_SELECTED,
				ApplicationFacade.CUSTOMER_SAVE_CHANGES_SUCCESS,
				ApplicationFacade.CUSTOMER_SAVE_CHANGES_ERROR
				
			];
		}
		
		public function get customerListCmp():CustomerList{
			return viewComponent as CustomerList;
		}
		
		
	}
}