package com.fornacif.osgimanager.application.controller {
    import com.fornacif.osgimanager.application.model.BundleStateModel;
    import com.fornacif.osgimanager.application.service.BundleStateService;
    import com.fornacif.osgimanager.bundlestate.event.BundleStateEvent;
    
    import flash.events.IEventDispatcher;
    
    import mx.collections.ArrayList;
    import mx.collections.IList;
    
    import org.swizframework.utils.services.ServiceHelper;

    public class BundleStateController {

        [Inject]
        public var frameworkModel:BundleStateModel;
		
		[Inject]
		public var frameworkService:BundleStateService;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;

        [EventHandler(event = "BundleStateEvent.LIST_BUNDLES_REQUEST")]
        public function listBundles():void {
			serviceHelper.executeServiceCall(frameworkService.listBundles(), listBundlesResultHandler, listBundlesFaultHandler);
        }

		protected function listBundlesResultHandler(data:Object):void {
			var result:Object = JSON.parse(data.result);
			frameworkModel.bundles.removeAll();
			for each (var bundle:Object in result.value) {
				frameworkModel.bundles.addItem(bundle);
			}
		}
		
		protected function listBundlesFaultHandler(info:Object):void {
			trace(info);
		}
    }
}
