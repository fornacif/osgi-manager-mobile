package com.fornacif.osgimanager.event {
    import flash.events.Event;

    public class BundleStateEvent extends Event {
        public static const FRAMEWORK_VERSION_REQUEST:String = "BundleStateEvent.FRAMEWORK_VERSION_REQUEST";
		public static const LIST_BUNDLES_REQUEST:String = "BundleStateEvent.LIST_BUNDLES_REQUEST";
		public static const BUNDLE_SELECTED:String = "BundleStateEvent.BUNDLE_SELECTED";
		
        public function BundleStateEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
            super(type, bubbles, cancelable);
        }

    }
}
