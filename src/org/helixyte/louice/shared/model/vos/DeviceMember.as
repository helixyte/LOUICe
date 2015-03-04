package org.helixyte.louice.shared.model.vos
{
    import mx.collections.ArrayCollection;
    import org.everest.flex.model.Member;

    [Bindable]
    public class DeviceMember extends Member
    {
        public var label:String;
        public var model:String;
        public var type:DeviceTypeMember;
        public var manufacturer:OrganizationMember;

        public function DeviceMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink)
        }
    }
}