package model.vo
{

	public class GenericUser{
		
		private var affiliate:Affiliate;	
		private var manager:Manager;
		private var type:String;
		
		public function GenericUser(type:String){
			this.type = type;			
		}
		
		public function set setUserAsAffiliate(user:Affiliate):void{
			this.affiliate = user as Affiliate;
		}
		
		public function get getUserAsAffiliate():Affiliate{
			return this.affiliate as Affiliate;
		}
		
		public function get getType():String{
			return this.type;
		}
		
		public function set setUserAsManager(user:Manager):void{
			this.manager = user as Manager;
		}
		
		public function get getUserAsManager():Manager{
			return this.manager as Manager;
		}
		
	}
}