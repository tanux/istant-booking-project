package view
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class AffiliateMainMediator extends Mediator implements IMediator{
		public static const NAME:String = "AffiliateMainMediator";
		
		public function AffiliateMainMediator(viewComponent:Object){
			super(NAME, viewComponent);
			affiliateMain.addEventListener(FlexEvent.CREATION_COMPLETE, init);
			affiliateMain.lbRegisterAffiliate.addEventListener(MouseEvent.CLICK, enableStateRegister);
		}
		
		private function init(evt:Event) : void {}
		
		private function enableStateRegister(evt:Event):void{
			affiliateMain.currentState = "stateRegister";
		}
		
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){
				
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
			
			];
		}
		
		public function get affiliateMain():AffiliateMain{
			return viewComponent as AffiliateMain;
		}
		
	}
}