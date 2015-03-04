package org.helixyte.louice.shared.model.vos
{
    import org.everest.flex.interfaces.INavigationLink;
    import org.everest.flex.model.Member;

    public class GeneMember extends Member
    {
        public var accession:String;
        public var locus_name:String;
        public var species:SpeciesMember;
        public var molecule_designs:INavigationLink;

        public function GeneMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
        
        public function get geneIdLabel():String
        {
            
            return accession + ':' + locus_name + ':' + species.acronym;
        }

    }
}