package com.fornacif.osgimanager.controller {
    import com.fornacif.osgimanager.model.BundleModel;
    import com.fornacif.osgimanager.model.BundleStateModel;
    import com.fornacif.osgimanager.service.BundleStateService;
    import com.fornacif.osgimanager.event.BundleStateEvent;
    
    import flash.events.IEventDispatcher;
    
    import mx.collections.ArrayList;
    import mx.collections.IList;
    
    import org.swizframework.utils.services.ServiceHelper;

    public class BundleStateController {
		
		[Inject]
		public var bundleStateModel:BundleStateModel;
		
		[Inject]
		public var bundleStateService:BundleStateService;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;

        [EventHandler(event = "BundleStateEvent.LIST_BUNDLES_REQUEST")]
        public function listBundles():void {
			serviceHelper.executeServiceCall(bundleStateService.listBundles(), listBundlesResultHandler, listBundlesFaultHandler);
        }

		private function listBundlesResultHandler(data:Object):void {
			var result:Object = JSON.parse(data.result);
			bundleStateModel.bundles.removeAll();
			for each (var bundle:Object in result.value) {
				bundleStateModel.bundles.addItem(new BundleModel(bundle));
			}
		}
		
		private function listBundlesFaultHandler(info:Object):void {
			trace(info);
		}
    }
}
