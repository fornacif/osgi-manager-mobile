package com.fornacif.osgimanager.application.model {
	import mx.collections.ArrayList;
	import mx.collections.IList;

	[Bindable]
    public class FrameworkVersionModel {
		
		public var vendor:String;
		public var product:String;
		public var version:String;
		
		public function fill(value:Object):void {
			this.vendor = value.info.vendor;
			this.product = value.info.product;
			this.version = value.info.version;
		}
		
		
    }
}
