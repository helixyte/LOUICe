package org.helixyte.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class ItemStatusMember extends Member
    {
        public var name:String;
        public var description:String;

        public function ItemStatusMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink)
        }
    }
}