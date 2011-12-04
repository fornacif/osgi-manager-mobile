package com.fornacif.osgimanager.service.request {
	public class ReadRequest {
		public var type:String;
		public var mbean:String;
		public var attribute:String;
		public var path:String;
		
		public function ReadRequest(type:String, mbean:String = null, attribute:String = null, path:String = null) {
			this.type = type;
			this.mbean = mbean;
			this.attribute = attribute;
			this.path = path;
		}
		
		public function toJSONString():String {
			return JSON.stringify(this);
		}
	}
}