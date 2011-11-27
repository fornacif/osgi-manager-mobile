package com.fornacif.osgimanager.bundlestate.event {
    import flash.events.Event;

    public class FrameworkVersionEvent extends Event {
        public static const FRAMEWORK_VERSION_REQUEST:String = "FrameworkVersionEvent.FRAMEWORK_VERSION_REQUEST";
		
        public function FrameworkVersionEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
            super(type, bubbles, cancelable);
        }

    }
}
