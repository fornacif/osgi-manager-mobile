package com.fornacif.osgimanager.presentation {
    import com.fornacif.osgimanager.event.ConnectionEvent;
    import com.fornacif.osgimanager.model.ConnectionModel;
    import com.pialabs.eskimo.controls.SkinnableAlert;
    
    import flash.events.IEventDispatcher;
    
    import mx.resources.IResourceManager;
    import mx.resources.ResourceManager;

    public class ConnectionPM {

        [Dispatcher]
        public var dispatcher:IEventDispatcher;
		
		[Inject]
		[Bindable]
		public var connectionModel:ConnectionModel;
		
		private var resourceManager:IResourceManager = ResourceManager.getInstance();
		
		public function connect():void {
			var connectionEvent:ConnectionEvent = new ConnectionEvent(ConnectionEvent.CONNECTION_REQUEST);
			dispatcher.dispatchEvent(connectionEvent);
		}
		
		[EventHandler(event = "ConnectionEvent.CONNECTION_FAILED")]
		public function connectionFailed():void {
			SkinnableAlert.show(resourceManager.getString('connection', 'connection.failed.message', 
				                [connectionModel.protocol, connectionModel.host, connectionModel.port, connectionModel.context]),
				                resourceManager.getString('connection', 'connection.failed.title'));
		}

    }
}
