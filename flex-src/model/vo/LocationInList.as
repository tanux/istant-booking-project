package model.vo
{
	import model.vo.Location;

	public class LocationInList{
		
		private var location:Location;
		private var position:int;
		
		public function LocationInList(location:Location, position:int){			
			this.location = location as Location;
			this.position = position as int;			
		}
		
		public function get getLocation():Location{
			return this.location;
		}
		public function get getPosition():int{
			return this.position;
		}
	}
}