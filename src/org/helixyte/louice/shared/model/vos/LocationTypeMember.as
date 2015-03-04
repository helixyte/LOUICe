package org.helixyte.louice.shared.model.vos
{
	import org.everest.flex.model.Member;
	import org.everest.flex.model.MembersCollection;
    
    public class LocationTypeMember extends Member
    {
        public var name:String;
        public var locations:MembersCollection;

        public function LocationTypeMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink)
        }
    }
}