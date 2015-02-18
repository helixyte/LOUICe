package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class LocationMember extends Member
    {
        public var barcode:String;
        public var label:String;
		public var name:String;
        public var type:String;
        public var device:DeviceMember;
        public var rack:RackMember;

        private var _index:uint = 0;

        public function LocationMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get index():* {
            if (_index == 0) {
                return undefined;
            } else {
                return _index;
            }
        }
        
        public function set index(index:uint):void {
            _index = index;
        }
        
    }
}