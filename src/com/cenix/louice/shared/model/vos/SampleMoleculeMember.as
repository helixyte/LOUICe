package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class SampleMoleculeMember extends Member
    {
        public var concentration:Number;
        public var insert_date:Date;
        public var molecule_design_id:String;
        public var supplier:OrganizationMember;
        public var product_id:String;

        private var _freeze_thaw_cycles:int = -1;

        public function SampleMoleculeMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get freeze_thaw_cycles():* {
            if (_freeze_thaw_cycles == -1) {
                return undefined;
            } else {
                return uint(_freeze_thaw_cycles);
            }
        }
        
        public function set freeze_thaw_cycles(freeze_thaw_cycles:uint):void {
            _freeze_thaw_cycles = int(freeze_thaw_cycles);
        }

    }
}