package com.fornacif.osgimanager.model {
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.IList;

	[Bindable]
	public class BundleModel {
		
		private const HEADERS:String = "Headers";
		private const VALUE:String = "Value";
		private const BUNDLE_NAME:String = "Bundle-Name";
		private const BUNDLE_ACTIVATOR:String = "Bundle-Activator";
		private const UNDEFINED:String = "undefined";
		
		public var id:String;
		public var name:String;
		public var version:String;
		public var state:String;
		public var symbolicName:String
		public var activator:String;
		public var exportedPackages:ArrayCollection;
		public var importedPackages:ArrayCollection;
		public var headers:Object;
		
		public function BundleModel(object:Object) {
			retrieveRootProperties(object);
			retrieveHeaderProperties(object);
		}
		
		private function retrieveRootProperties(object:Object):void {
			this.id = object.Identifier;
			this.version = object.Version;
			this.state = object.State;
			this.symbolicName = object.SymbolicName;
			this.exportedPackages = new ArrayCollection(object.ExportedPackages);
			this.importedPackages = new ArrayCollection(object.ImportedPackages);
		}
		
		private function retrieveHeaderProperties(object:Object):void {
			this.headers = object[HEADERS];
			this.name = headers[BUNDLE_NAME][VALUE];
			
			// Bundle-Activator is optional
			if (headers[BUNDLE_ACTIVATOR]) {
				this.activator = headers[BUNDLE_ACTIVATOR][VALUE];
			} else {
				this.activator = UNDEFINED;
			}
		}
		
	}
}