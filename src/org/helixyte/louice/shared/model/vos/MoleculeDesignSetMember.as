package org.helixyte.louice.shared.model.vos
{
	import org.everest.flex.model.Member;
	import org.everest.flex.model.MembersCollection;

    [Bindable]
    public class MoleculeDesignSetMember extends Member
    {

        public var molecule_designs:MembersCollection;
        public var set_type:String;

        public function MoleculeDesignSetMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}