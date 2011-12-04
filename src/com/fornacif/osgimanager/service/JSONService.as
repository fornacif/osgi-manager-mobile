package com.fornacif.osgimanager.service {
    
    import com.fornacif.osgimanager.model.ConnectionModel;
    import com.fornacif.osgimanager.service.request.ReadRequest;
    
    import mx.rpc.AsyncToken;
    import mx.rpc.http.HTTPService;

    public class JSONService extends HTTPService {

		public function JSONService():void {
			super();
			this.showBusyCursor = true;
			this.method = "POST";
			this.contentType = "application/json";
			this.resultFormat = HTTPService.RESULT_FORMAT_TEXT;
		}
    }
}
