package com.cenix.louice.shared.utils
{
    import com.cenix.louice.shared.model.vos.UserMember;
    
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.external.ExternalInterface;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    
    import mx.core.FlexGlobals;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;
    import mx.rpc.http.HTTPService;
    
    import org.as3commons.lang.StringUtils;
    import org.everest.flex.ui.components.ErrorView;

    /**
     * The download and managment of the currently logged in user is done outside
     * of the everest client framework.
     * The reason is that it has to be loaded ahead of the actual framework and
     * that it should be available across all modules.
     *
     * @author rothe
     *
     */
    public class CurrentUserManager
    {
        [Bindable]
        public var currentUser:UserMember;

        [Bindable]
        public var currentUserName:String;

        public function CurrentUserManager()
        {
            loadCurrentUser();
        }

        /**
         * As we are using http authentication we need to apply a dirty hack
         * to trigger a logout. In general logout is not part of the http protocol:
         * Existing HTTP clients and user agents typically retain authentication
         * information indefinitely. HTTP/1.1. does not provide a method for a
         * server to direct clients to discard these cached credentials.
         *
         * An application layer authentication would probably be a better way
         * to do this.
         */
        public function logout(event:*=null):void
        {
            //this is a messy patch but since we use the old http 
            //authentication there is no proper way to handle the logout.
            currentUser = null;
            currentUserName = "";
            var userAgentCmd : String = 
              "function(){return navigator.appVersion+'-'+navigator.appName;}";
            var userAgent : String = ExternalInterface.call(userAgentCmd);
            if (userAgent.indexOf("MSIE") > 0)
            {
                var clearAuthCacheCmd : String =
                  "function(){document.execCommand('ClearAuthenticationCache');}";
                ExternalInterface.call(clearAuthCacheCmd);
            } else {
                var loader:URLLoader = new URLLoader();
                var appUrl : String = 
                        StringUtils.substringBetween(
                            FlexGlobals.topLevelApplication.url, 
                            "http://","/")
                loader.load(new URLRequest("http://logout@" + appUrl));
                loader.addEventListener(IOErrorEvent.IO_ERROR,
                                        logout); //failure is not an option!
                loader.addEventListener(Event.COMPLETE,
                    function() : void{loadCurrentUser();});
            }
        }

        private function loadCurrentUser():void
        {
            var http : HTTPService = new HTTPService();
            http.addEventListener(ResultEvent.RESULT,
                                  currentUserResultHandler);
            http.addEventListener(FaultEvent.FAULT,
                                  currentUserFaultHandler);
            http.url = "/users/current-user";
            http.method = "GET";
            http.resultFormat = "object";
            http.send();
        }

        private function currentUserResultHandler(event:ResultEvent):void
        {
            var currentUserObject:* = event.result;
            if (currentUserObject)
            {
                currentUser = UserMember.fromObject(currentUserObject);
                if (currentUser != null)
                {
                    currentUserName = currentUser.username;
                    trace("- Loaded current user: " + currentUserName);
                } else {
                    ErrorView.show("Error while trying to load the current user.");
                }
            } else {
                ErrorView.show("Error while trying to load the current user.");
            }

        }

        private function currentUserFaultHandler(event:FaultEvent):void
        {
            ErrorView.show("Error while trying to get the current user.\n" + event.message);
        }
    }
}