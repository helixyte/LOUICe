package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class LocationMember extends Member
    {
        public var barcode:String;
        public var label:String;
        public var type:String;
        public var device:DeviceMember;
        public var index:int;
        public var rack:RackMember;

        public function LocationMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}