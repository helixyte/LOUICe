package org.helixyte.louice.shared.model.vos
{
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    public class MoleculeDesignMember extends Member
    {
        public var molecule_type:MoleculeTypeMember;
        public var chemical_structures:MembersCollection;
        public var genes:MembersCollection;

        public function MoleculeDesignMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}