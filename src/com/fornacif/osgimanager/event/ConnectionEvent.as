package com.fornacif.osgimanager.event {
    import flash.events.Event;

    public class ConnectionEvent extends Event {
        public static const CONNECTION_REQUEST:String = "ConnectionEvent.CONNECTION_REQUEST";
		
        public function ConnectionEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
            super(type, bubbles, cancelable);
        }

    }
}
