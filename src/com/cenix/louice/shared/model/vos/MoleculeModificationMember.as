package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class MoleculeModificationMember extends Member
    {
        public var name:String;

        public function MoleculeModificationMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}