package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    [Bindable]
    public class StockRackMember extends Member
    {
        public var label:String;
        public var rack:RackMember;

        public function StockRackMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

    }
}