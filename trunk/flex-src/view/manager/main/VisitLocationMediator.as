package view.manager.main
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.LocationList;
	import view.component.VisitLocations;
	
	public class VisitLocationMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "LocationsInAccordionMediator";
		
		public function VisitLocationMediator(viewComponent:Object){			
			super(NAME, viewComponent);	
			visitDayCmp.addEventListener(VisitLocations.LOCATION_SELECTED, notifyLocationSelected);
		}
		
		private function notifyLocationSelected(evt:Event):void{
			sendNotification(ApplicationFacade.LOCATION_SELECTED_MAIN, visitDayCmp.locationSelected);
			sendNotification(ApplicationFacade.GET_NO_AVAILABLE_DAY, visitDayCmp.locationSelected);
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.GET_LOCATION_LIST_SUCCESS:
					var locations:ArrayCollection = notification.getBody() as ArrayCollection;                                  
					visitDayCmp.locationList = locations;	
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
		
		public function get visitDayCmp():VisitLocations{
			return viewComponent as VisitLocations;
		}
	}
}