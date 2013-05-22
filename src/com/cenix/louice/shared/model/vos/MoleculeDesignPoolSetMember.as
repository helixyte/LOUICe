package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;
	import org.everest.flex.model.MembersCollection;

    [Bindable]
    public class MoleculeDesignPoolSetMember extends Member
    {

        public var molecule_design_pools:MembersCollection;

        public function MoleculeDesignPoolSetMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}