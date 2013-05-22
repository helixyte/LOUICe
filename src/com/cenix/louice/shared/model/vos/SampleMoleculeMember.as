package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class SampleMoleculeMember extends Member
    {
        public var concentration:Number;
        public var insert_date:Date;
        public var molecule_design_id:String;
        public var freeze_thaw_cycles:int;
        public var supplier:OrganizationMember;
        public var product_id:String;

        public function SampleMoleculeMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}