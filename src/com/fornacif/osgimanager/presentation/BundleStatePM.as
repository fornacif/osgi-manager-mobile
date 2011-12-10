package com.fornacif.osgimanager.presentation {
    import com.fornacif.osgimanager.event.BundleStateEvent;
    import com.fornacif.osgimanager.model.BundleModel;
    import com.fornacif.osgimanager.model.BundleStateModel;
    import com.fornacif.osgimanager.model.ConnectionModel;
    import com.fornacif.osgimanager.model.FrameworkVersionModel;
    
    import flash.events.IEventDispatcher;

    public class BundleStatePM {

        [Dispatcher]
        public var dispatcher:IEventDispatcher;

        [Inject]
		[Bindable]
        public var frameworkVersionModel:FrameworkVersionModel;
		
		[Inject]
		[Bindable]
		public var bundleStateModel:BundleStateModel;
		
		[Inject]
		[Bindable]
		public var connectionModel:ConnectionModel;
		
        public function listBundles():void {
            var bundleStateEvent:BundleStateEvent = new BundleStateEvent(BundleStateEvent.LIST_BUNDLES_REQUEST);
            dispatcher.dispatchEvent(bundleStateEvent);
        }
		
		public function bundleSelectedHandler(bundle:BundleModel):void {
			bundleStateModel.selectedBundle = bundle;
			var bundleStateEvent:BundleStateEvent = new BundleStateEvent(BundleStateEvent.BUNDLE_SELECTED);
			dispatcher.dispatchEvent(bundleStateEvent);
		}

    }
}
