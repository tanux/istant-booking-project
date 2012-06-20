package view.manager.main
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.LocationList;
	import view.component.VisitLocations;
	
	public class LocationsInAccordionMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "LocationsInAccordionMediator";
		
		public function LocationsInAccordionMediator(viewComponent:Object){			
			super(NAME, viewComponent);			
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.GET_LOCATION_LIST_SUCCESS:
					var locations:ArrayCollection = notification.getBody() as ArrayCollection;                                  
					locationListInAccordionCmp.locationList = locations;	
					break;
				case ApplicationFacade.GET_LOCATION_LIST_ERROR:
					Alert.show("Errore nel caricamento della lista delle location");
					break;
			}
		}               
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_LOCATION_LIST_SUCCESS,
				ApplicationFacade.GET_LOCATION_LIST_ERROR,
				ApplicationFacade.GET_LOCATION_LIST_FAULT				
			];      
		}
		
		public function get locationListInAccordionCmp():VisitLocations{
			return viewComponent as VisitLocations;
		}
	}
}