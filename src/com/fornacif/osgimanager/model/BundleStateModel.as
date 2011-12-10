package com.fornacif.osgimanager.model {
	import mx.collections.ArrayList;
	import mx.collections.IList;

	[Bindable]
    public class BundleStateModel {
		public var bundles:ArrayList = new ArrayList();
		public var selectedBundle:BundleModel;
    }
}
