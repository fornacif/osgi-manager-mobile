package com.fornacif.osgimanager.controller {
    import com.fornacif.osgimanager.model.BundleModel;
    import com.fornacif.osgimanager.model.BundleStateModel;
    import com.fornacif.osgimanager.model.ConnectionModel;
    import com.fornacif.osgimanager.model.FrameworkVersionModel;
    import com.fornacif.osgimanager.service.BundleStateService;
    import com.fornacif.osgimanager.service.ConnectionService;
    import com.fornacif.osgimanager.event.BundleStateEvent;
    import com.fornacif.osgimanager.view.BundleStateView;
    
    import flash.events.IEventDispatcher;
    
    import mx.collections.ArrayList;
    import mx.collections.IList;
    
    import org.swizframework.storage.ISharedObjectBean;
    import org.swizframework.utils.services.ServiceHelper;
    
    import spark.components.ViewNavigator;

    public class ConnectionController {
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Inject]
		public var connectionModel:ConnectionModel;
		
		[Inject]
		public var frameworkVersionModel:FrameworkVersionModel;
		
		[Inject]
		public var connectionService:ConnectionService;
		
		[Inject]
		public var bundleStateController:BundleStateController;
		
		[Inject]
		public var sharedObjectBean:ISharedObjectBean;
		
		[ViewNavigator]
		public var viewNavigator:ViewNavigator;

        [EventHandler(event = "ConnectionEvent.CONNECTION_REQUEST")]
        public function connect():void {
			saveConnectionModel();
			
			serviceHelper.executeServiceCall(connectionService.frameworkVersion(), frameworkVersionResultHandler, frameworkVersionFaultHandler);
        }
		
		private function frameworkVersionResultHandler(data:Object):void {
			var result:Object = JSON.parse(data.result);
			frameworkVersionModel.fill(result.value);
			
			viewNavigator.pushView(BundleStateView);
			
			// List bundles from connected framework
			bundleStateController.listBundles();
		}
		
		private function frameworkVersionFaultHandler(info:Object):void {
			trace(info);
		}
		
		[PostConstruct]
		public function loadConnectionModel():void {
			if (sharedObjectBean.hasValue("connectionModel")) {
				connectionModel.fill(sharedObjectBean.getValue("connectionModel"));			
			} else {
				connectionModel.loadDefault();
			}
			
		}
		
		public function saveConnectionModel():void {
			sharedObjectBean.setValue("connectionModel", connectionModel);
		}
    }
}
