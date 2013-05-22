package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;
	import org.everest.flex.model.MembersCollection;

    public class RackPositionSetMember extends Member
    {
        public var rack_positions:MembersCollection;

        public function RackPositionSetMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}