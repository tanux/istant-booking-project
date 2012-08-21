package view.manager.main
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.ManagerMainMediator;
	import view.component.HomeSection;
	import view.component.LocationList;
	import view.component.VisitLocations;
	import view.manager.HomeSectionMediator;
	
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
				facade.sendNotification(ApplicationFacade.LOCATION_SELECTED_ACCORDION_BOOKING);				
			}
			
		}
		
		private var myTip:ToolTip;
		import mx.controls.ToolTip;
		import mx.managers.ToolTipManager;
		import flash.events.MouseEvent;
		
		private function createBigTip(event:MouseEvent, s:String, x:int, y:int):void {
			var home:HomeSectionMediator = facade.retrieveMediator(HomeSectionMediator.NAME) as HomeSectionMediator;
			if (home.abilitaHelp){
				//var x:int = event.currentTarget.x + event.currentTarget.width + 10; 
				//var y:int = event.currentTarget.y;
				myTip = ToolTipManager.createToolTip(s,x,y) as ToolTip;
				myTip.setStyle("backgroundColor",0xFFCC00);
				myTip.width = 200;
				myTip.height = 40;
			}
		}
		
		private function destroyBigTip():void {
			var home:HomeSectionMediator = facade.retrieveMediator(HomeSectionMediator.NAME) as HomeSectionMediator;
			if (home.abilitaHelp){
				if (myTip != null)
					ToolTipManager.destroyToolTip(myTip);				
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
				case ApplicationFacade.CUSTOMER_SELECTED_HOMESECTION:
					//var homeSection: HomeSection = new HomeSection() as HomeSection;
					//homeSection.cmpVisitProperties.imgLoc.visible=true;
					createBigTip(MouseEvent as MouseEvent,"Mino", 150,330 );
					break;
			}
		}               
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_LOCATION_LIST_SUCCESS,
				ApplicationFacade.GET_LOCATION_LIST_ERROR,
				ApplicationFacade.GET_LOCATION_LIST_FAULT,
				ApplicationFacade.LOCATION_SELECTED_ACCORDION,
				ApplicationFacade.CUSTOMER_SELECTED_HOMESECTION
			];      
		}
		
		public function get visitLocationCmp():VisitLocations{
			return viewComponent as VisitLocations;
		}
	}
}