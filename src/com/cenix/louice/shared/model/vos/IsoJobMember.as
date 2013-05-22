package com.cenix.louice.shared.model.vos
{
    [Bindable]
    public class IsoJobMember extends JobMember
    {
        public var iso_control_stock_rack:RackMember;

        public function IsoJobMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}