package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    [Bindable]
    public class IsoStockRackMember extends Member
    {
        public var rack:RackMember;

        public function IsoStockRackMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}
