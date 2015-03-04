package org.helixyte.louice.modules.devicetypemember.ui.presenters
{
    import org.helixyte.louice.shared.model.vos.DeviceTypeMember;
    import org.everest.flex.model.MembersCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    public class DeviceTypeMemberPresentationModel extends MemberPresentationModel
    {
        public function DeviceTypeMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return DeviceTypeMember(_member).label;
        }

        public function set label(l:String):void
        {
            DeviceTypeMember(_member).label = l;
        }

        [Bindable(Event="memberChanged")]
        public function get devices():MembersCollection
        {
            return DeviceTypeMember(_member).devices;
        }

        public function set devices(d:MembersCollection):void
        {
              DeviceTypeMember(_member).devices = d;
        }
    }
}