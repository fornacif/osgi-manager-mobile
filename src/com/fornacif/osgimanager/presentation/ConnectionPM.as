package com.fornacif.osgimanager.presentation {
    import com.fornacif.osgimanager.model.ConnectionModel;
    import com.fornacif.osgimanager.event.ConnectionEvent;
    
    import flash.events.IEventDispatcher;

    public class ConnectionPM {

        [Dispatcher]
        public var dispatcher:IEventDispatcher;
		
		[Inject]
		[Bindable]
		public var connectionModel:ConnectionModel;
		
		public function connect():void {
			var connectionEvent:ConnectionEvent = new ConnectionEvent(ConnectionEvent.CONNECTION_REQUEST);
			dispatcher.dispatchEvent(connectionEvent);
		}

    }
}
