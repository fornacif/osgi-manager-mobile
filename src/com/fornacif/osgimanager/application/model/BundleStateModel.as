package com.fornacif.osgimanager.application.model {
	import mx.collections.ArrayList;
	import mx.collections.IList;

	[Bindable]
    public class BundleStateModel {
		
		public function BundleStateModel() {
			
		}
		
		public var bundles:ArrayList = new ArrayList();
    }
}
