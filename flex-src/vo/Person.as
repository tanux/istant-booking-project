package vo
{
	public class Person {
		private var _name:String;
		private var _surname:String;
		private var _mail:String;
		private var _tel:String;
		
		public function Person() {
		}
		
		public function get name() : String {
			return _name;
		}
		
		public function get surname() : String {
			return _surname;
		}
		
		public function get mail() : String {
			return _mail;
		}
		
		public function get tel() : String {
			return _tel;
		}
		
		public function set name(n:String) : void {
			_name = n;
		}
		
		public function set surname(s:String) : void {
			_surname = s;
		}
		
		public function set mail(m:String) : void {
			_mail = m;
		}
		
		public function set tel(t:String) : void {
			_tel = t;
		}
	}
}