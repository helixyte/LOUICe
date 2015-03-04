package org.helixyte.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class OrganizationMember extends Member
    {

        [Bindable]
        public var name:String;


        public function OrganizationMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

    }
}