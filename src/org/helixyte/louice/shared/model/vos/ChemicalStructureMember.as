package org.helixyte.louice.shared.model.vos
{
    import org.everest.flex.model.Member;
    
    public class ChemicalStructureMember extends Member
    {
        public var chemical_structure_type:ChemicalStructureTypeMember;
        public var representation:String;
        
        public function ChemicalStructureMember(title:String=null, 
                                                selfLink:String=null)
        {
            super(title, selfLink)
        }
    }
}