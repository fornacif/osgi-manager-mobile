package com.fornacif.osgimanager.model {
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.IList;

	[Bindable]
	public class BundleModel {
		
		public var id:String;
		public var name:String;
		public var version:String;
		public var symbolicName:String
		public var state:String;
		public var exportedPackages:ArrayCollection;
		public var importedPackages:ArrayCollection;
		public var headers:Object;
		
		public function BundleModel(object:Object) {
			// Gets MBean root properties
			this.id = object.Identifier;
			this.version = object.Version;
			this.symbolicName = object.SymbolicName;
			this.state = object.State;
			this.exportedPackages = new ArrayCollection(object.ExportedPackages);
			this.importedPackages = new ArrayCollection(object.ImportedPackages);
			
			// Gets headers properties
			this.headers = object["Headers"];
			this.name = headers["Bundle-Name"]["Value"];
		}
		
	}
}