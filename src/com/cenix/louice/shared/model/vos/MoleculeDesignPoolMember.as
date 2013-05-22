package com.cenix.louice.shared.model.vos
{
	
    public class MoleculeDesignPoolMember extends MoleculeDesignSetMember
    {
        public var molecule_type:MoleculeTypeMember;
        public var number_designs:Number;

        public function MoleculeDesignPoolMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
		
    }
}