package com.cenix.louice.shared.utils
{

    import com.asfusion.mate.actionLists.IScope;
    import com.asfusion.mate.actionLists.ServiceHandlers;
    import com.asfusion.mate.actions.IAction;
    import com.asfusion.mate.actions.builders.HTTPServiceInvoker;
    import com.asfusion.mate.actions.builders.ServiceInvoker;
    import com.asfusion.mate.core.ISmartObject;
    import com.asfusion.mate.events.UnhandledFaultEvent;

    import flash.events.DataEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.FileReference;
    import flash.net.URLRequest;
    import flash.net.URLRequestHeader;
    import flash.net.URLRequestMethod;
    import flash.utils.ByteArray;

    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;
    import mx.utils.Base64Encoder;

    import ru.inspirit.net.MultipartURLLoader;

    public class FileUploadServiceInvoker extends ServiceInvoker implements IAction {
        private var _url:Object;
        private var _binaryData:Object;
        private var _request:Object;
        private var _contentType:String;

        public function FileUploadServiceInvoker() {
        }

        /*-.........................................contentType..........................................*/

        /**
         * Type of content for service requests. The default is <code>application/x-www-form-urlencoded</code> which sends requests like a normal HTTP POST with name-value pairs.
         * <code>application/xml</code> send requests as XML.
         */
        public function get contentType():String
        {
            return _contentType;
        }

        public function set contentType(value:String):void
        {
            _contentType = value;
        }


        /*-.........................................request..........................................*/

        /**
         * Object of name-value pairs used as parameters to the URL. If the <code>contentType</code> property is set to <code>application/xml</code>,
         * it should be an XML document.
         * the request object can include <code>smartObjects</code> from the <code>EventMap</code> such as:
         * event, lastResult, currentEvent, resultObject, fault, message, data etc.
         */
        public function get request():Object
        {
            return _request;
        }

        public function set request(value:Object):void
        {
            _request = value;
        }

        public function get url():Object {
            return _url;
        }

        public function set url(value:Object):void {

                _url = value;
        }

        public function get binaryData():Object {
            return _binaryData;
        }

        public function set binaryData(value:Object):void {
            _binaryData = value;
        }


        /**
         * @inheritDoc
         */
        override protected function prepare(scope:IScope):void
        {
            super.prepare(scope);

            currentInstance = new MultipartURLLoader();

            var httpInstance:MultipartURLLoader = MultipartURLLoader(currentInstance);

            if(request)
            {
                var smartRequest:Object;
                if(request is ISmartObject)
                {
                    smartRequest = ISmartObject(request).getValue(scope);
                }
                else
                {
                    smartRequest = request;
                }
                if(smartRequest is XML || smartRequest is String)
                {
                    //httpInstance.data = smartRequest;
                }
//                else
//                {
//                    var realRequest:Object = new Object();
//                    realRequest = Properties.smartCopy( smartRequest, realRequest, scope);
//                    httpInstance.request = realRequest;
//                }
            }
//            if(channelSet)				httpInstance.channelSet = channelSet;
//            if(contentType)				httpInstance.contentType = contentType;
//            if(destination) 			httpInstance.destination = destination;
//            if(headers) 				httpInstance.headers = headers;
//            if(requestTimeoutChanged)	httpInstance.requestTimeout = requestTimeout
//            if(resultFormat) 			httpInstance.resultFormat = resultFormat;
//            if(rootURL)					httpInstance.rootURL = rootURL;
//            if(proxyChanged)			httpInstance.useProxy = useProxy;
//            if(objectsBindableChanged)	httpInstance.makeObjectsBindable = makeObjectsBindable;


            if(username && password)
            {
                if(username is ISmartObject)
                {
                    username = ISmartObject(username).getValue(scope);
                }
                if(password is ISmartObject)
                {
                    password = ISmartObject(password).getValue(scope);
                }

                var encoder:Base64Encoder = new Base64Encoder();
                    encoder.insertNewLines = false;
                    encoder.encode(username + ":" + password);
                var credentials:String = encoder.toString();

                //create HTTP Auth request header
                var authHeader:URLRequestHeader = new URLRequestHeader("Authorization", "Basic " + credentials);
                httpInstance.requestHeaders.push(authHeader);
            }
            if(remoteUsername && remotePassword)
            {
                if(remoteUsername is ISmartObject)
                {
                    remoteUsername = ISmartObject(remoteUsername).getValue(scope);
                }
                if(remotePassword is ISmartObject)
                {
                    remotePassword = ISmartObject(remotePassword).getValue(scope);
                }
//                httpInstance.setRemoteCredentials(remoteUsername as String, remotePassword as String);
                var encoder1:Base64Encoder = new Base64Encoder();
                encoder1.insertNewLines = false;
                encoder1.encode(username + ":" + password);
                var credentials1:String = encoder1.toString();


                //create HTTP Auth request header
                var authHeader1:URLRequestHeader = new URLRequestHeader("Authorization", "Basic " + credentials1);
                httpInstance.requestHeaders.push(authHeader1);
            }
        }


        override protected function run(scope:IScope):void {

            var loader:MultipartURLLoader = MultipartURLLoader(currentInstance);
                loader.addFile(getRealBinaryData(scope),"file");

            loader.load(getRealUrl(scope));
        }

        private function getRealBinaryData(scope:IScope):ByteArray {
            var value:ByteArray = binaryData is ISmartObject ? ISmartObject(binaryData).getValue(scope) as ByteArray : ByteArray(binaryData);
            return value;
        }

        private function getRealUrl(scope:IScope):String{
            return (url is ISmartObject) ? ISmartObject(url).getValue(scope).toString() : url.toString();
        }

        override protected function complete(scope:IScope):void {

            innerHandlersDispatcher = currentInstance;

            if (resultHandlers && resultHandlers.length > 0) {
                var resultHandlersInstance:FileUploadHandlers = createInnerHandlers(scope, DataEvent.UPLOAD_COMPLETE_DATA, resultHandlers, FileUploadHandlers) as FileUploadHandlers;
                resultHandlersInstance.validateNow();
            }
            if ((faultHandlers && faultHandlers.length > 0) || scope.dispatcher.hasEventListener(UnhandledFaultEvent.FAULT)) {
                var faultHandlersInstance:FileUploadHandlers = createInnerHandlers(scope, IOErrorEvent.IO_ERROR, faultHandlers, FileUploadHandlers) as FileUploadHandlers;
                faultHandlersInstance.validateNow();
            }
        }
    }
}

