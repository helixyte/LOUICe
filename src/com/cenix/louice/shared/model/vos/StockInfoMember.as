package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;
	import org.everest.flex.model.MembersCollection;

    public class StockInfoMember extends Member
    {
        public var total_volume:Number;
        public var maximum_volume:Number;
        public var minimum_volume:Number;
        public var concentration:Number;
		public var molecule_type:MoleculeTypeMember;
		public var molecule_design_pool:MoleculeDesignPoolMember;
        public var genes:MembersCollection;
        
        private var _total_tubes:int = -1;
        private var _molecule_design_pool_id:uint = 0;

        public function StockInfoMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
		
        public function get total_tubes():* {
            if (_total_tubes == -1) {
                return undefined;
            } else {
                return uint(_total_tubes);
            }
        }
        
        public function set total_tubes(total_tubes:uint):void {
            _total_tubes = int(total_tubes);
        }
 
        public function get molecule_design_pool_id():* {
            if (_molecule_design_pool_id == 0) {
                return undefined;
            } else {
                return _molecule_design_pool_id;
            }
        }
        
        public function set molecule_design_pool_id(molecule_design_pool_id:uint):void {
            _molecule_design_pool_id = molecule_design_pool_id;
        }
        
    }
}