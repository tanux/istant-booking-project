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
	import org.tylerchesley.bark.core.Notification;
	import org.tylerchesley.bark.events.NotificationEvent;
	
	import view.ManagerMainMediator;
	import view.component.CustomerList;
	
	public class CustomerListMediator extends Mediator implements IMediator{
		public static const NAME:String = "CustomerListMediator";
		[Bindable]private var customerInList:CustomerInList;
		public function CustomerListMediator(viewComponent:Object){
			super(NAME, viewComponent);
			customerListCmp.btnSave.addEventListener(MouseEvent.CLICK,saveChanges);
			customerListCmp.btnAddUser.addEventListener(MouseEvent.CLICK, addCustomer);
			customerListCmp.btnDelUser.addEventListener(MouseEvent.CLICK, deleteCustomer);
		}
		private function init(evt:Event) : void {}
		
		public function addCustomer(evt:Event): void{
			var newCustomer:Customer = new Customer();
			newCustomer.firstName = customerListCmp.tiFirstname.textInput.text;
			newCustomer.lastName = customerListCmp.tiLastname.textInput.text;
			newCustomer.email = customerListCmp.tiEmail.textInput.text;
			newCustomer.telephoneNumber = customerListCmp.tiTelephoneNumber.textInput.text;			
			facade.sendNotification(ApplicationFacade.CUSTOMER_ADD, newCustomer );
		}
		
		public function deleteCustomer(evt:Event): void{
			var delCustomer:Customer = new Customer();
			delCustomer.id = customerInList.getCustomer.id;
			delCustomer.firstName = customerListCmp.tiFirstname.textInput.text;
			delCustomer.lastName = customerListCmp.tiLastname.textInput.text;
			delCustomer.email = customerListCmp.tiEmail.textInput.text;
			delCustomer.telephoneNumber = customerListCmp.tiTelephoneNumber.textInput.text;
			var cInList:CustomerInList = new CustomerInList(delCustomer, customerInList.getPosition);
			facade.sendNotification(ApplicationFacade.CUSTOMER_DELETE, cInList);
		}
		
		private function saveChanges(evt:Event): void {			
			var customerChanged:Customer = new Customer();			
			customerChanged.id = customerInList.getCustomer.id;
			customerChanged.firstName = customerListCmp.tiFirstname.textInput.text;
			customerChanged.lastName = customerListCmp.tiLastname.textInput.text;
			customerChanged.email = customerListCmp.tiEmail.textInput.text;
			customerChanged.telephoneNumber = customerListCmp.tiTelephoneNumber.textInput.text;
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
					notify('default', 'Successo', 'L\'operazione è andata a buon fine', customerListCmp.successIcon, 3000);
					customerInList = notification.getBody() as CustomerInList;
					
					customerListCmp.tiFirstname.text = "Nome" as String;
					customerListCmp.tiFirstname.textInput.text = "Nome" as String;
					

					customerListCmp.tiLastname.text = "Cognome" as String;
					customerListCmp.tiLastname.textInput.text = "Cognome" as String;
					
					
					customerListCmp.tiEmail.text = "E-mail" as String;
					customerListCmp.tiEmail.textInput.text = "E-mail" as String;
					
					
					customerListCmp.tiTelephoneNumber.text = "Telefono" as String;
					customerListCmp.tiTelephoneNumber.textInput.text = "Telefono" as String;
					
					
					customerListCmp.btnSave.enabled = false;
					break;
				case ApplicationFacade.CUSTOMER_SAVE_CHANGES_ERROR:
					notify('default', 'Errore', 'L\'operazione non è stata completata con successo', customerListCmp.errorIcon, 3000);
					break;				
			}

		}
		
		private function notify(type:String,title:String,description:String,icon:Object, duration:Number) : void {
			var notification:Notification = new Notification(type, duration, title, description, icon);
			notification.addEventListener(NotificationEvent.NOTIFICATION_ITEM_CLICK, clickHandler);
			customerListCmp.dispatchEvent(new NotificationEvent(NotificationEvent.NOTIFY, notification));
		}
		
		private function clickHandler(event:NotificationEvent) : void {}
		
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