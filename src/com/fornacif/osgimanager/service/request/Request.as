package com.fornacif.osgimanager.service.request {
	public class Request {
		
		public var type:String;
		public var mbean:String;
		
		public function Request(type:String, mbean:String) {
			this.type = type;
			this.mbean = mbean;
		}
		
		public function toJSONString():String {
			return JSON.stringify(this);
		}
	}
}