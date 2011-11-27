package com.fornacif.osgimanager.application.service {
    
    import com.fornacif.osgimanager.application.model.ConnectionModel;
    
    import mx.rpc.AsyncToken;
    import mx.rpc.http.HTTPService;

    public class FrameworkVersionService extends HTTPService {
		
		[Inject]
		[Bindable]
		public var connectionModel:ConnectionModel;
		
		public function FrameworkVersionService():void {
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
