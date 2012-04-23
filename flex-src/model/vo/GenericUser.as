package model.vo
{
	public class GenericUser{
		
		private var affiliate:Affiliate;		
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
		
	}
}