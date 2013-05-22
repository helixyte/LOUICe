package com.cenix.louice.shared.utils
{
    import com.asfusion.mate.actionLists.EventHandlers;
    import com.asfusion.mate.actionLists.IScope;
    import com.asfusion.mate.actionLists.ServiceScope;
    import com.asfusion.mate.events.UnhandledFaultEvent;

    import flash.events.DataEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;

    import mx.rpc.Fault;

    public class FileUploadHandlers extends EventHandlers {
        public function FileUploadHandlers(inheritedScope:IScope = null) {
            super();
            this.inheritedScope = inheritedScope;
        }

        override protected function fireEvent(event:Event):void {

            if (actions && actions.length > 0) {
                var currentScope:ServiceScope = new ServiceScope(inheritedScope.event, debug, inheritedScope);
                currentScope.owner = this;

                if (event is DataEvent && event.type == DataEvent.UPLOAD_COMPLETE_DATA) {
                    currentScope.result = DataEvent(event).data;
                } else if (event is IOErrorEvent) {
                    currentScope.fault = new Fault("", IOErrorEvent(event).text);
                }

                setScope(currentScope);
                runSequence(currentScope, actions);
            } else if (event is IOErrorEvent) {
                var faultEvent:UnhandledFaultEvent = new UnhandledFaultEvent(UnhandledFaultEvent.FAULT);
                faultEvent.fault = new Fault("", IOErrorEvent(event).text);
                inheritedScope.dispatcher.dispatchEvent(faultEvent);
            }
        }
    }
}
