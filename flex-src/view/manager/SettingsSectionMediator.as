package view.manager
{
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.SettingsSection;
	import view.manager.settings.LocationListMediator;
	
	public class SettingsSectionMediator extends Mediator implements IMediator{
		public static const NAME:String = "SettingsMediator";
		public function SettingsSectionMediator(viewComponent:Object){
			super(NAME, viewComponent);
			cmpSetting.addEventListener(FlexEvent.CREATION_COMPLETE, initSection);
		}
		
		private function initSection(evt:Event){
			facade.registerMediator(new LocationListMediator(cmpSetting.cmpManagementLocation.cmpLocationList));
			sendNotification(ApplicationFacade.GET_LOCATION_LIST);
		}
		
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){
				case ApplicationFacade.ACTIVE_SETTING_SECTION:
						
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.ACTIVE_SETTING_SECTION,
			];
		}
		
		public function get cmpSetting():SettingsSection{
			return viewComponent as SettingsSection;
		}
	}
}