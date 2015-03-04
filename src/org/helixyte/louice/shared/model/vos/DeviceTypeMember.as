package org.helixyte.louice.shared.model.vos
{

    import mx.collections.ArrayCollection;
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    public class DeviceTypeMember extends Member
    {
        public var label:String;
        public var devices:MembersCollection;

        public function DeviceTypeMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink)
        }
    }
}