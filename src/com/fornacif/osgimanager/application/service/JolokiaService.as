package com.fornacif.osgimanager.application.service {

    import mx.rpc.AsyncToken;
    import mx.rpc.http.HTTPService;

    public class JolokiaService extends HTTPService {
		
		protected static const JOLOKIA_URL:String = "http://localhost:8080/jolokia/";
		
		public function JolokiaService():void {
			super();
			this.showBusyCursor = true;
			this.resultFormat = HTTPService.RESULT_FORMAT_TEXT;
		}
    }
}
