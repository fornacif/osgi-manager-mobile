package com.fornacif.osgimanager.application.controller {
    import com.fornacif.osgimanager.application.model.FrameworkVersionModel;
    import com.fornacif.osgimanager.application.service.FrameworkVersionService;
    import com.fornacif.osgimanager.bundlestate.event.BundleStateEvent;
    
    import flash.events.IEventDispatcher;
    
    import mx.collections.ArrayList;
    import mx.collections.IList;
    
    import org.swizframework.utils.services.ServiceHelper;

    public class FrameworkVersionController {

        [Inject]
        public var frameworkVersionModel:FrameworkVersionModel;
		
		[Inject]
		public var frameworkVersionService:FrameworkVersionService;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[EventHandler(event = "FrameworkVersionEvent.FRAMEWORK_VERSION_REQUEST")]
		public function frameworkVersion():void {
			serviceHelper.executeServiceCall(frameworkVersionService.frameworkVersion(), frameworkVersionResultHandler, frameworkVersionFaultHandler);
		}
		
		private function frameworkVersionResultHandler(data:Object):void {
			var result:Object = JSON.parse(data.result);
			frameworkVersionModel.fill(result.value);
		}
		
		private function frameworkVersionFaultHandler(info:Object):void {
			trace(info);
		}
    }
}
