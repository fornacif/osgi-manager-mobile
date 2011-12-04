package com.fornacif.osgimanager.service {

    import com.fornacif.osgimanager.model.ConnectionModel;
    import com.fornacif.osgimanager.service.request.ExecRequest;
    
    import mx.rpc.AsyncToken;
    import mx.rpc.http.HTTPService;

    public class BundleStateService extends JSONService {
		
		[Inject]
		[Bindable]
		public var connectionModel:ConnectionModel;

        public function listBundles():AsyncToken {
			this.url = this.connectionModel.getURL();
			var request:ExecRequest = new ExecRequest("exec", "osgi.core:type=bundleState,version=1.5", "listBundles");
			return this.send(request.toJSONString());
        }
    }
}
