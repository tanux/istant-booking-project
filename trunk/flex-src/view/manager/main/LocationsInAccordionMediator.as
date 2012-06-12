package view.manager.main
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class LocationsInAccordionMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "LocationsInAccordionMediator";
		
		public function LocationsInAccordionMediator(viewComponent:Object){
			super(NAME, viewComponent);
		}
	}
}