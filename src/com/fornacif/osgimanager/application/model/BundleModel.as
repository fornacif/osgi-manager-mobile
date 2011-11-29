package com.fornacif.osgimanager.application.model {
	[Bindable]
	public class BundleModel {
		
		public var name:String;
		public var version:String;
		public var state:String;
		
		public function BundleModel(object:Object) {
			this.name = object["Headers"]["Bundle-Name"]["Value"];
			this.version = object.Version;
			this.state = object.State;
		}
		
	}
}