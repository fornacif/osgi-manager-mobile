package com.fornacif.osgimanager.bundlestate.view {
	import spark.components.IconItemRenderer;
	import spark.components.supportClasses.ItemRenderer;
	
	public class BundleIconItemRenderer {
		public function BundleIconItemRenderer() {
			super();
			this.labelFunction = getBundleIdentifierStateAndName;
			this.messageFunction = getSymbolicNameAndVersion;
		}
		
		private function getBundleIdentifierStateAndName(item:Object):String {
			var result:String = item.Identifier;
			result += " - " + item.State;
			result += " - " + item["Headers"]["Bundle-Name"]["Value"];
			return result;
		}
		
		private function getSymbolicNameAndVersion(item:Object):String {
			var result:String = item.SymbolicName;
			result += " - " + item.Version;
			return result;
		}
	}
}