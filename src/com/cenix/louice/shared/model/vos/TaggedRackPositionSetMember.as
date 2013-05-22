package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;
	import org.everest.flex.model.MembersCollection;

    public class TaggedRackPositionSetMember extends Member
    {
        public var tags:MembersCollection;
        public var rack_position_set:RackPositionSetMember;

        public function TaggedRackPositionSetMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}