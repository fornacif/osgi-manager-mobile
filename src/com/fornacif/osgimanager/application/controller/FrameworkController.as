package com.fornacif.osgimanager.application.controller {
    import com.fornacif.osgimanager.application.model.FrameworkModel;
    import com.fornacif.osgimanager.application.service.FrameworkService;
    
    import mx.rpc.CallResponder;
    
    import org.swizframework.utils.services.ServiceHelper;

    public class FrameworkController {

        [Inject]
        public var frameworkModel:FrameworkModel;
		
		[Inject]
		public var frameworkService:FrameworkService;
		
		[Inject]
		public var serviceHelper:ServiceHelper;

        [EventHandler(event = "FrameworkEvent.LIST_BUNDLES")]
        public function listBundles():void {
			serviceHelper.executeServiceCall(frameworkService.listBundles(), listBundlesResultHandler, listBundlesFaultHandler);
        }

		protected function listBundlesResultHandler(data:Object):void {
			var result:Object = JSON.parse(data.result);
		}
		
		protected function listBundlesFaultHandler(info:Object):void {
			// handle service fault
		}
    }
}
