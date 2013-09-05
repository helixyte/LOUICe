package com.cenix.louice.modules.devicemember.ui.presenters
{

    import org.everest.flex.interfaces.INavigationLink;
    import com.cenix.louice.shared.model.vos.DeviceMember;
    import com.cenix.louice.shared.model.vos.DeviceTypeMember;
    import org.everest.flex.model.Link;
    import org.everest.flex.model.MembersCollection;
    import com.cenix.louice.shared.model.vos.OrganizationMember;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    import mx.collections.ArrayCollection;

    public class DeviceMemberPresentationModel extends MemberPresentationModel
    {
        public function DeviceMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return DeviceMember(_member).label;
        }

        public function set label(l:String):void
        {
            DeviceMember(_member).label = l;
        }

        [Bindable(Event="memberChanged")]
        public function get model():String
        {
            return DeviceMember(_member).model;
        }

        public function set model(model:String):void
        {
            DeviceMember(_member).model = model;
        }

        [Bindable(Event="memberChanged")]
        public function get type():DeviceTypeMember
        {
            return DeviceMember(_member).type;
        }

        public function set type(type:DeviceTypeMember):void
        {
            DeviceMember(_member).type = type
        }

        [Bindable(Event="memberChanged")]
        public function get manufacturer():OrganizationMember
        {
            return  DeviceMember(_member).manufacturer;
        }

        public function set manufacturer(manufacturer:OrganizationMember):void
        {
            DeviceMember(_member).manufacturer = manufacturer;
        }

        [Bindable(Event="memberChanged")]
        public function get locations():INavigationLink
        {
            return new Link('Locations',
                            '/locations/?q=device:equal-to:\'' + _member.selfLink + '\'');
        }
    }
}