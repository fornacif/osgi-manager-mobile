package com.fornacif.osgimanager.bundlestate.pm {
    import com.fornacif.osgimanager.application.model.BundleStateModel;
    import com.fornacif.osgimanager.bundlestate.event.BundleStateEvent;
    
    import flash.events.IEventDispatcher;

    public class BundleStatePM {

        [Dispatcher]
        public var dispatcher:IEventDispatcher;

        [Inject]
        [Bindable]
        public var bundleStateModel:BundleStateModel;
		
		public function BundleStatePM() {
			
		}

		[PostConstruct]
        public function listBundles():void {
            var bundleStateEvent:BundleStateEvent = new BundleStateEvent(BundleStateEvent.LIST_BUNDLES_REQUEST);
            dispatcher.dispatchEvent(bundleStateEvent);
        }

    }
}
