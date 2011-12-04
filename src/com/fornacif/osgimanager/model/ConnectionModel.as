package com.fornacif.osgimanager.model {
	
	[Bindable]
	public class ConnectionModel {	

		public var protocol:String;
		public var host:String;
		public var port:String;
		public var context:String;
		
		public function getURL():String {
			return protocol + "://" + host + ":" + port + "/" + context + "/";
		}
		
		public function loadDefault():void {
			this.protocol = "http";
			this.host = "localhost";
			this.port = "8080";
			this.context = "jolokia";
		}
		
		public function fill(value:Object):void {
			this.protocol = value.protocol;
			this.host = value.host;
			this.port = value.port;
			this.context = value.context;
		}
	}
}