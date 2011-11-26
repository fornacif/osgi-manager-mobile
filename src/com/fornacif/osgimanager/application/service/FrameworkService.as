package com.fornacif.osgimanager.application.service {

    import mx.rpc.AsyncToken;
    import mx.rpc.http.HTTPService;

    public class FrameworkService extends HTTPService {
		
		public static const CONTENT_TYPE:String = "application/json";
		public static const LIST_BUNDLES_URL:String = "http://localhost:8080/jolokia/exec/osgi.core:type=bundleState,version=1.5/listBundles";
		
		public function FrameworkService():void {
			super();
			//this.contentType = CONTENT_TYPE;
			//this.resultType = JSON;
		}

        public function listBundles():AsyncToken {
			this.url = LIST_BUNDLES_URL;
            return this.send();
        }
    }
}
