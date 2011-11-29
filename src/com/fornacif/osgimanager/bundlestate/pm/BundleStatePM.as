package com.fornacif.osgimanager.bundlestate.pm {
    import com.fornacif.osgimanager.application.model.BundleStateModel;
    import com.fornacif.osgimanager.application.model.ConnectionModel;
    import com.fornacif.osgimanager.application.model.FrameworkVersionModel;
    import com.fornacif.osgimanager.bundlestate.event.BundleStateEvent;
    import com.fornacif.osgimanager.bundlestate.event.FrameworkVersionEvent;
    
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
		
		[PostConstruct]
		public function init():void {
			frameworkVersion();
			listBundles();
		}
		
		public function frameworkVersion():void {
			var frameworkVersionEvent:FrameworkVersionEvent = new FrameworkVersionEvent(FrameworkVersionEvent.FRAMEWORK_VERSION_REQUEST);
			dispatcher.dispatchEvent(frameworkVersionEvent);
		}
		
        public function listBundles():void {
            var bundleStateEvent:BundleStateEvent = new BundleStateEvent(BundleStateEvent.LIST_BUNDLES_REQUEST);
            dispatcher.dispatchEvent(bundleStateEvent);
        }

    }
}
