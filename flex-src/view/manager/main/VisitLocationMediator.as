package view.manager.main
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.ManagerMainMediator;
	import view.component.LocationList;
	import view.component.VisitLocations;
	
	public class VisitLocationMediator extends Mediator implements IMediator{
		[Bindable] public var loc: Boolean = false;
		public static const NAME:String = "VisitLocationMediator";
		public static const NAME_IN_HOME:String = NAME+"Home";
		public static const NAME_IN_BOOKING:String = NAME+"Booking";
		
		public function VisitLocationMediator(mediatorName:String,viewComponent:Object){			
			super(mediatorName, viewComponent);	
			visitLocationCmp.addEventListener(VisitLocations.LOCATION_SELECTED_EVENT, notifyLocationSelected);			
		}
		
		private function notifyLocationSelected(evt:Event):void{			
			facade.sendNotification(ApplicationFacade.LOCATION_SELECTED_ACCORDION, visitLocationCmp.locationSelected);
			if (getMediatorName() == NAME_IN_HOME){				
				facade.sendNotification(ApplicationFacade.GET_NO_AVAILABLE_DAY_HOME, visitLocationCmp.locationSelected);
				facade.sendNotification(ApplicationFacade.LOCATION_SELECTED_ACCORDION_HOME);
			}
			
			else if (getMediatorName() == NAME_IN_BOOKING){
				facade.sendNotification(ApplicationFacade.GET_NO_AVAILABLE_DAY_BOOKING, visitLocationCmp.locationSelected);
				facade.sendNotification(ApplicationFacade.LOCATION_SELECTED_ACCORDION_BOOKING);				
			}
			
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.GET_LOCATION_LIST_SUCCESS:					
					var locations:ArrayCollection = notification.getBody() as ArrayCollection;					
					visitLocationCmp.locationList = locations;
					break;
				case ApplicationFacade.GET_LOCATION_LIST_ERROR:
					Alert.show("Errore nel caricamento della lista delle location");
					break;
				case ApplicationFacade.LOCATION_SELECTED_ACCORDION:
					loc=true;
					break;
			}
		}               
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_LOCATION_LIST_SUCCESS,
				ApplicationFacade.GET_LOCATION_LIST_ERROR,
				ApplicationFacade.GET_LOCATION_LIST_FAULT,
				ApplicationFacade.LOCATION_SELECTED_ACCORDION
			];      
		}
		
		public function get visitLocationCmp():VisitLocations{
			return viewComponent as VisitLocations;
		}
	}
}