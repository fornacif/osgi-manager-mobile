package views
{
	public class JSONRequest {
		public var id:int;
		public var jsonrpc:String = "2.0";
		public var method:String;
		public var params:Array;
		
		public function JSONRequest() {
		}
	} 
}