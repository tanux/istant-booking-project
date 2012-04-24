package view
{
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class ManagerMainMediator extends Mediator implements IMediator{
		public static const NAME:String = "ManagerMainMediator";
		public static const USER_TYPE:String = "managers";
		
		public function ManagerMainMediator(viewComponent:Object){
			super(NAME, viewComponent);
			affiliateMain.addEventListener(FlexEvent.CREATION_COMPLETE, init);
		}
		
		public function get affiliateMain():ManagerMain{
			return viewComponent as ManagerMain;
		}
	}
}