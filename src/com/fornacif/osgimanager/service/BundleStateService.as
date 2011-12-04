package com.fornacif.osgimanager.service {

    import com.fornacif.osgimanager.model.ConnectionModel;
    
    import mx.rpc.AsyncToken;
    import mx.rpc.http.HTTPService;

    public class BundleStateService extends HTTPService {
		
		[Inject]
		[Bindable]
		public var connectionModel:ConnectionModel;

		public function BundleStateService():void {
			super();
			this.showBusyCursor = true;
			this.resultFormat = HTTPService.RESULT_FORMAT_TEXT;
		}

        public function listBundles():AsyncToken {
			this.url = this.connectionModel.getURL() + "exec/osgi.core:type=bundleState,version=1.5/listBundles";;
            return this.send();
        }
    }
}
