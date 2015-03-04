package org.helixyte.louice.shared.model.constants
{
    public class AppRelease
    {
        public static const DEBUGGING:String = "debuggingAppRelease";

        public static const DEVELOPMENT:String = "developmentAppRelease";

        public static const DEMO:String = "demoAppRelease";

        public static const PRODUCTION:String = "productionAppRelease";

//		public function get appRelease(host:S):String
//		{
//			// FIXME: Move this function somewhere else
//			if (StringUtil.beginsWith(appUrl.host, AppHostPort.DEBUGGING_HOST) &&
//				appUrl.port == AppHostPort.DEBUGGING_PORT) {
//				return AppRelease.DEBUGGING;
//			}
//			else if (StringUtil.beginsWith(appUrl.host, AppHostPort.DEVELOPMENT_HOST) &&
//				appUrl.port == AppHostPort.DEVELOPMENT_PORT) {
//				return AppRelease.DEVELOPMENT;
//			}
//			else if (StringUtil.beginsWith(appUrl.host, AppHostPort.DEMO_HOST) &&
//				appUrl.port == AppHostPort.DEMO_PORT) {
//				return AppRelease.DEMO;
//			}
//			else if (StringUtil.beginsWith(appUrl.host, AppHostPort.PRODUCTION_HOST) &&
//				appUrl.port == "") {
//				return AppRelease.PRODUCTION;
//			}
//			else {
//				return null;
//			}
//		}

//        [Bindable(event="appReleaseChanged")]
//        public function get appRelease():String
//        {
//            return _appRelease;
//        }
//
//        public function set appRelease(release:String):void
//        {
//            switch (release) {
//                case AppRelease.DEBUGGING:
//                    _appRelease = "Debug";
//                    break;
//                case AppRelease.DEVELOPMENT:
//                    _appRelease = "Development Release";
//                    break;
//                case AppRelease.DEMO:
//                    _appRelease = "Demo Release";
//                    break;
//                case AppRelease.PRODUCTION:
//                    _appRelease = "";
//                    break;
//                default:
//                    _appRelease = "UNKNOWN RELEASE";
//                    break;
//            }
//            dispatchEvent(new Event("appReleaseChanged"));
//        }
    }
}