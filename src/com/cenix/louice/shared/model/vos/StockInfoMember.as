package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;
	import org.everest.flex.model.MembersCollection;

    public class StockInfoMember extends Member
    {
        public var total_tubes:int;
        public var total_volume:Number;
        public var maximum_volume:Number;
        public var minimum_volume:Number;
        public var concentration:Number;
		public var molecule_type:MoleculeTypeMember;
		public var molecule_design_pool:MoleculeDesignPoolMember;
		public var molecule_design_pool_id:int;
        public var genes:MembersCollection;

        public function StockInfoMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
		
    }
}