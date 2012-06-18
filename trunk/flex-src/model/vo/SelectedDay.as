package model.vo
{
	public class SelectedDay{
		
		private var _numberAssociated:int;
		private var _selected:Boolean;
		private var _label:String;
		
		public function SelectedDay(){					
		}
		
		
		public function get numberAssociated():int
		{
			return _numberAssociated;
		}

		public function set numberAssociated(value:int):void
		{
			_numberAssociated = value;
		}

		public function get selected():Boolean
		{
			return _selected;
		}

		public function set selected(value:Boolean):void
		{
			_selected = value;
		}

		public function get label():String
		{
			return _label;
		}

		public function set label(value:String):void
		{
			_label = value;
		}


	}
}