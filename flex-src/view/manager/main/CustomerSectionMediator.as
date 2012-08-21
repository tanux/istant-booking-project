package view.manager.main
{
	import controller.managermain.CustomerAddCommand;
	import controller.managermain.CustomerDeleteCommand;
	import controller.managermain.CustomerSaveChangesCommand;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Customer;
	import model.vo.CustomerInList;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.controls.ToolTip;
	import mx.events.CloseEvent;
	import mx.events.ListEvent;
	import mx.managers.ToolTipManager;
	import mx.rpc.events.FaultEvent;
	import mx.validators.Validator;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.tylerchesley.bark.core.Notification;
	import org.tylerchesley.bark.events.NotificationEvent;
	
	import view.ManagerMainMediator;
	import view.component.CustomerSection;
	import view.component.LocationList;
	import view.component.VisitLocations;
	import view.component.VisitPropertiesAffiliateMain;
	import view.manager.HomeSectionMediator;
	import view.manager.main.VisitLocationMediator;
	
	public class CustomerSectionMediator extends Mediator implements IMediator{
		public static const NAME:String = "CustomerListMediator";
		[Bindable]private var customerInList:CustomerInList;
		[Bindalbe] public var custom:Boolean = false;		
		public function CustomerSectionMediator(viewComponent:Object){
			super(NAME, viewComponent);
			customerListCmp.btnSave.addEventListener(MouseEvent.CLICK,saveChanges);
			customerListCmp.btnAddUser.addEventListener(MouseEvent.CLICK, addCustomer);
			customerListCmp.btnDelUser.addEventListener(MouseEvent.CLICK, confirmDeleteCustomer);
			customerListCmp.btnCancel.addEventListener(MouseEvent.CLICK, resetAll);					
		}
		private function init(evt:Event) : void {}		

		
		
		
		public function resetAll(evt:Event):void{
			resetTextInput();	
			customerListCmp.btnAddUser.enabled = false;
			customerListCmp.btnDelUser.enabled = false;
			customerListCmp.btnSave.enabled = false;
			customerListCmp.abilitaAdd=true;
			customerListCmp.dgCustomerList.selectedIndex = -1;			
			var managerMainMediator:ManagerMainMediator = facade.retrieveMediator(ManagerMainMediator.NAME) as ManagerMainMediator;			
			managerMainMediator.managerMain.cmpHomeSection.cmpVisitProperties.cmpLocations.boxSede.enabled = false;
			managerMainMediator.managerMain.cmpHomeSection.cmpVisitProperties.cmpVisitDay.boxDay.enabled = false;
			managerMainMediator.managerMain.cmpHomeSection.cmpVisitProperties.cmpVisitHours.boxHours.enabled = false;
		}
		
		public function addCustomer(evt:Event): void{
			var newCustomer:Customer = new Customer();
			newCustomer.firstName = customerListCmp.tiFirstname.text;
			newCustomer.lastName = customerListCmp.tiLastname.text;
			newCustomer.email = customerListCmp.tiEmail.text;
			newCustomer.telephoneNumber = customerListCmp.tiTelephoneNumber.text;
			facade.sendNotification(ApplicationFacade.CUSTOMER_ADD, newCustomer );
		}
		
		private function confirmDeleteCustomer(evt:MouseEvent):void{
			Alert.show("Sei sicuro di voler eliminare il cliente?","Conferma Eliminazione",Alert.YES|Alert.NO,null,deleteCustomer,null,Alert.NO);
		}
		public function deleteCustomer(evt:CloseEvent): void{
			 if (evt.detail == Alert.YES){
				 var delCustomer:Customer = new Customer();
				 delCustomer.id = customerInList.getCustomer.id;
				 delCustomer.firstName = customerListCmp.tiFirstname.text;
				 delCustomer.lastName = customerListCmp.tiLastname.text;
				 delCustomer.email = customerListCmp.tiEmail.text;
				 delCustomer.telephoneNumber = customerListCmp.tiTelephoneNumber.text;
				 var cInList:CustomerInList = new CustomerInList(delCustomer, customerInList.getPosition);
				 facade.sendNotification(ApplicationFacade.CUSTOMER_DELETE, cInList);
				 resetAll(evt);
			 }			
		}
		
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
					notify('default', 'Errore', 'Lista Clienti: Errore nel prelevamento dati', customerListCmp.errorIcon, 5000);
					//Alert.show("Lista Clienti: Errore nel prelevamento dati");
					break;
				case ApplicationFacade.GET_CUSTOMER_LIST_FAULT:
					var evt:FaultEvent = notification.getBody() as FaultEvent;
					notify('default', 'Errore', 'CustomerList Fault: '+evt.fault.faultDetail, customerListCmp.errorIcon, 5000);
					//Alert.show("CustomerList Fault: "+evt.fault.faultDetail);
					break;
				case ApplicationFacade.CUSTOMER_SELECTED_HOMESECTION:					
					customerInList = notification.getBody() as CustomerInList;					
					customerListCmp.abilitaAdd=false;
					customerListCmp.tiFirstname.text = customerInList.getCustomer.firstName as String;
					customerListCmp.tiLastname.text = customerInList.getCustomer.lastName as String;
					customerListCmp.tiEmail.text = customerInList.getCustomer.email as String;
					customerListCmp.tiTelephoneNumber.text = customerInList.getCustomer.telephoneNumber as String;
					customerListCmp.btnDelUser.enabled = true;
					customerListCmp.tiFirstname.showCancelButton = true;
					customerListCmp.tiLastname.showCancelButton = true;
					customerListCmp.tiEmail.showCancelButton = true;
					customerListCmp.tiTelephoneNumber.showCancelButton = true;					
					custom = true;								
					break;
				case ApplicationFacade.CUSTOMER_SAVE_CHANGES_SUCCESS:
					notify('default', 'Successo', 'L\'operazione è andata a buon fine', customerListCmp.successIcon, 5000);
					resetTextInput();					
					customerListCmp.abilitaAdd=true;
					customerListCmp.btnSave.enabled = false;
					customerListCmp.btnDelUser.enabled = false;
					customerListCmp.dgCustomerList.selectedIndex = -1;
					break;
				case ApplicationFacade.CUSTOMER_SAVE_CHANGES_ERROR:
					notify('default', 'Errore', 'Errore nel salvataggio', customerListCmp.errorIcon, 5000);
					//Alert.show("Errore nel salvataggio");
					break;
				case ApplicationFacade.CUSTOMER_ADD_SUCCESS:
					notify('default', 'Successo', 'Inserimento ok', customerListCmp.successIcon, 5000);
					resetTextInput();
					customerListCmp.btnAddUser.enabled = false;
					break;
				case ApplicationFacade.CUSTOMER_ADD_ERROR:
					notify('default', 'Errore', 'Errore inserimento', customerListCmp.errorIcon, 5000);
					//Alert.show("Errore inserimento");
					break;
				case ApplicationFacade.CUSTOMER_DELETE_SUCCESS:
					notify('default', 'Successo', 'Eliminazione ok', customerListCmp.successIcon, 5000);
					resetTextInput();
					customerListCmp.btnDelUser.enabled = false;
					customerListCmp.abilitaAdd=true;
					customerListCmp.btnSave.enabled = false;
					customerListCmp.dgCustomerList.selectedIndex = -1;
					break;
				case ApplicationFacade.CUSTOMER_DELETE_ERROR:
					notify('default', 'Errore', 'Errore delete', customerListCmp.errorIcon, 5000);
					//Alert.show("Errore delete");
					break;
				case ApplicationFacade.BOOKING_ADD_SUCCESS:
					customerListCmp.btnDelUser.enabled = false;
					customerListCmp.abilitaAdd=true;
					customerListCmp.btnSave.enabled = false;
					customerListCmp.dgCustomerList.selectedIndex = -1;
					break;
			}

		}
		
		public function resetTextInput():void{			
			customerListCmp.tiFirstname.text = CustomerSection.NAME_PROMT;	
			
			customerListCmp.tiFirstname.showCancelButton = false;
			
			customerListCmp.tiLastname.text = CustomerSection.SURNAME_PROMT;
			customerListCmp.tiLastname.showCancelButton = false;
			
			customerListCmp.tiEmail.text = CustomerSection.EMAIL_PROMT;
			customerListCmp.tiEmail.showCancelButton = false;
			
			customerListCmp.tiTelephoneNumber.text = CustomerSection.TELEFONO_PROMT;
			customerListCmp.tiTelephoneNumber.showCancelButton = false;
		}
		
		private function notify(type:String = 'default',
								title:String = '', 
								description:String = '', 
								icon:Object = null,
								duration:Number = 3000) : void {
			
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
				ApplicationFacade.CUSTOMER_SELECTED_HOMESECTION,
				ApplicationFacade.CUSTOMER_SAVE_CHANGES_SUCCESS,
				ApplicationFacade.CUSTOMER_SAVE_CHANGES_ERROR,
				ApplicationFacade.CUSTOMER_ADD_SUCCESS,
				ApplicationFacade.CUSTOMER_ADD_ERROR,
				ApplicationFacade.CUSTOMER_ADD_FAULT,
				ApplicationFacade.CUSTOMER_DELETE_SUCCESS,
				ApplicationFacade.CUSTOMER_DELETE_ERROR,
				ApplicationFacade.CUSTOMER_DELETE_FAULT,
				ApplicationFacade.BOOKING_ADD_SUCCESS
			];
		}
		
		public function get customerListCmp():CustomerSection{
			return viewComponent as CustomerSection;
		}
		
		
	}
}