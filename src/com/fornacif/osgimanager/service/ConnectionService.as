package com.fornacif.osgimanager.service {
    
    import com.fornacif.osgimanager.model.ConnectionModel;
    
    import mx.rpc.AsyncToken;
    import mx.rpc.http.HTTPService;

    public class ConnectionService extends HTTPService {
		
		[Inject]
		[Bindable]
		public var connectionModel:ConnectionModel;
		
		public function ConnectionService():void {
			super();
			this.showBusyCursor = true;
			this.resultFormat = HTTPService.RESULT_FORMAT_TEXT;
		}
		
		public function frameworkVersion():AsyncToken {
			this.url = connectionModel.getURL();
			return this.send();
		}
    }
}
