package com.cenix.louice.shared.utils
{
    import com.asfusion.mate.actionLists.IScope;
    import com.asfusion.mate.actions.IAction;
    import com.asfusion.mate.actions.builders.HTTPServiceInvoker;
    import com.asfusion.mate.actions.builders.serviceClasses.Request;
    import com.asfusion.mate.core.ISmartObject;
    import com.asfusion.mate.core.Properties;

    import mx.rpc.http.HTTPService;

    public class BinaryPostServiceInvoker extends HTTPServiceInvoker
    {
        public function BinaryPostServiceInvoker()
        {
            super();
        }


        /*-----------------------------------------------------------------------------------------------------------
        *                                          Override protected methods
        -------------------------------------------------------------------------------------------------------------*/
        /*-.........................................createInstance..........................................*/
        /**
         * @inheritDoc
         */
        override protected function prepare(scope:IScope):void
        {
        //	super.prepare(scope);
            if(!currentInstance) currentInstance = new HTTPService();
            var httpInstance:HTTPService = currentInstance;
            if(url)
            {
                var realURL:String = (url is ISmartObject) ? ISmartObject(url).getValue(scope).toString() : url.toString();
                httpInstance.url = realURL;
            }
            if(request)
            {
                httpInstance.request = request;
            }
            if(channelSet)				httpInstance.channelSet = channelSet;
            if(contentType)				httpInstance.contentType = contentType;
            if(destination) 			httpInstance.destination = destination;
            if(headers) 				httpInstance.headers = headers;
            if(requestTimeoutChanged)	httpInstance.requestTimeout = requestTimeout
            if(resultFormat) 			httpInstance.resultFormat = resultFormat;
            if(rootURL)					httpInstance.rootURL = rootURL;
            if(proxyChanged)			httpInstance.useProxy = useProxy;
            if(objectsBindableChanged)	httpInstance.makeObjectsBindable = makeObjectsBindable;

            if(method)
            {
                var realMethod:Object = ( method is ISmartObject ) ?  ISmartObject( method ).getValue( scope ) : method;
                if( realMethod is String )
                {
                    httpInstance.method = realMethod as String;
                }
            }

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
                httpInstance.setCredentials(username as String, password as String);
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
                httpInstance.setRemoteCredentials(remoteUsername as String, remotePassword as String);
            }
        }

    }
}