package com.fornacif.osgimanager.service.request {
	public class ExecRequest extends Request {
		public var operation:String;
		public var arguments:Array;
		
		public function ExecRequest(type:String, mbean:String = null, operation:String = null, arguments:Array = null) {
			super(type, mbean);
			this.operation = operation;
			this.arguments = arguments;
		}
	}
}