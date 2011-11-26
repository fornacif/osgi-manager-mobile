package com.fornacif.osgimanager.application.service {

    import mx.rpc.AsyncToken;
    import mx.rpc.http.HTTPService;

    public class BundleStateService extends JolokiaService {
		
		private static const LIST_BUNDLES_URL:String = JOLOKIA_URL + "exec/osgi.core:type=bundleState,version=1.5/listBundles";
		
		public function BundleStateService():void {
			super();
			this.showBusyCursor = true;
			this.resultFormat = HTTPService.RESULT_FORMAT_TEXT;
		}

        public function listBundles():AsyncToken {
			this.url = LIST_BUNDLES_URL;
            return this.send();
        }
    }
}
