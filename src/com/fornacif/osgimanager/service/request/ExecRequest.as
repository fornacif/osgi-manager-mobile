package com.fornacif.osgimanager.service.request {
	public class ExecRequest {
		public var type:String;
		public var mbean:String;
		public var operation:String;
		public var arguments:Array;
		
		public function ExecRequest(type:String, mbean:String = null, operation:String = null, arguments:Array = null) {
			this.type = type;
			this.mbean = mbean;
			this.operation = operation;
			this.arguments = arguments;
		}
		
		public function toJSONString():String {
			return JSON.stringify(this);
		}
	}
}