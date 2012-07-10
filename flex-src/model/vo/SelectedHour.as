package model.vo
{
	public class SelectedHour{
		
		private var _index:int;
		private var _busy:Boolean;
		private var _hour:String;
		
		
		public function SelectedHour(){
			
		}

		public function get index():int
		{
			return _index;
		}

		public function set index(value:int):void
		{
			_index = value;
		}

		public function get busy():Boolean
		{
			return _busy;
		}

		public function set busy(value:Boolean):void
		{
			_busy = value;
		}
		
		public function get hour():String
		{
			return _hour;
		}
		
		public function set hour(value:String):void
		{
			_hour = value;
		}
	}
}