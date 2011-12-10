package com.fornacif.osgimanager.controller {
    import com.fornacif.osgimanager.model.BundleModel;
    import com.fornacif.osgimanager.model.BundleStateModel;
    import com.fornacif.osgimanager.service.BundleStateService;
    import com.fornacif.osgimanager.view.BundleView;
    
    import flash.events.IEventDispatcher;
    
    import org.swizframework.utils.services.ServiceHelper;
    
    import spark.components.ViewNavigator;

    public class BundleStateController {
		
		[Inject]
		public var bundleStateModel:BundleStateModel;
		
		[Inject]
		public var bundleStateService:BundleStateService;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[ViewNavigator]
		public var viewNavigator:ViewNavigator;

        [EventHandler(event = "BundleStateEvent.LIST_BUNDLES_REQUEST")]
        public function listBundles():void {
			serviceHelper.executeServiceCall(bundleStateService.listBundles(), listBundlesResultHandler, listBundlesFaultHandler);
        }
		
		[EventHandler(event = "BundleStateEvent.BUNDLE_SELECTED")]
		public function bundleSelectedHandler():void {
			viewNavigator.pushView(BundleView);
		}

		private function listBundlesResultHandler(data:Object):void {
			var result:Object = JSON.parse(data.result);
			bundleStateModel.bundles.removeAll();
			for each (var bundle:Object in result.value) {
				var bundleModel:BundleModel = new BundleModel(bundle);
				bundleStateModel.bundles.addItem(bundleModel);
				if (bundleStateModel.selectedBundle && bundleModel.id == bundleStateModel.selectedBundle.id) {
					bundleStateModel.selectedBundle = bundleModel;
				}
			}
		}
		
		private function listBundlesFaultHandler(info:Object):void {
			trace(info);
		}
    }
}
