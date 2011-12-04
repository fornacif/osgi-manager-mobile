package com.fornacif.osgimanager.service {
    
    import com.fornacif.osgimanager.model.ConnectionModel;
    import com.fornacif.osgimanager.service.request.ReadRequest;
    
    import mx.rpc.AsyncToken;
    import mx.rpc.http.HTTPService;

    public class ConnectionService extends JSONService {
		
		[Inject]
		[Bindable]
		public var connectionModel:ConnectionModel;
		
		public function frameworkVersion():AsyncToken {
			this.url = this.connectionModel.getURL();
			var request:ReadRequest = new ReadRequest("version");
			return this.send(request.toJSONString());
		}
    }
}
