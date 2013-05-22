package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class SpeciesMember extends Member
    {
        public var genus_name:String;
        public var species_name:String;
        public var common_name:String;
        public var acronym:String;
        public var ncbi_tax_id:String;

        public function SpeciesMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}