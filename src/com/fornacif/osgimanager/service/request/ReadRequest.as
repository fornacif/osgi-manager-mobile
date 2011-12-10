package com.fornacif.osgimanager.service.request {
	public class ReadRequest extends Request {
		public var attribute:String;
		public var path:String;
		
		public function ReadRequest(type:String, mbean:String = null, attribute:String = null, path:String = null) {
			super(type, mbean);
			this.attribute = attribute;
			this.path = path;
		}
	}
}