package com.fornacif.osgimanager.application.model {
	import mx.utils.URLUtil;
	
	import org.swizframework.utils.services.URLRequestHelper;

	[Bindable]
	public class ConnectionModel {	
		public var protocol:String = "http";
		public var host:String = "192.168.0.10";
		public var port:int = 8080;
		public var context:String = "jolokia";
		
		public function getURL():String {
			return protocol + "://" + host + ":" + port + "/" + context + "/";
		}
	}
}