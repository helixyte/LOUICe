package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    [Bindable]
    public class IsoSampleStockRackMember extends Member
    {
        public var index:int;
        public var rack:RackMember;

        public function IsoSampleStockRackMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}