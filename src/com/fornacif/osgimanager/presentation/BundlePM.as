package com.fornacif.osgimanager.presentation {
    
    import com.fornacif.osgimanager.event.BundleStateEvent;
    import com.fornacif.osgimanager.model.BundleModel;
    
    import flash.events.IEventDispatcher;

    public class BundlePM {

        [Dispatcher]
        public var dispatcher:IEventDispatcher;
		
		[Inject(source="bundleStateModel.selectedBundle", bind="true")]
		[Bindable]
		public var selectedBundle:BundleModel;
		
		[Bindable]
		public var importedPackagesFilterText:String;
		
		public function listBundles():void {
			var bundleStateEvent:BundleStateEvent = new BundleStateEvent(BundleStateEvent.LIST_BUNDLES_REQUEST);
			dispatcher.dispatchEvent(bundleStateEvent);
		}

		public function initPackageFilterFunctions():void {
			selectedBundle.importedPackages.filterFunction = filterImportedPackages;
		}
		
		public function refreshImportedPackages():void {
			selectedBundle.importedPackages.refresh();
		}
		
		private function filterImportedPackages(item:String):Boolean {
			if (item.match(importedPackagesFilterText)) {
				return true;
			} else {
				return false;
			}
		}
    }
}
