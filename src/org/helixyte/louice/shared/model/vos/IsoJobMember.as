package org.helixyte.louice.shared.model.vos
{
    import org.everest.flex.model.MembersCollection;

    [Bindable]
    public class IsoJobMember extends JobMember
    {
        public var stock_racks:MembersCollection;
        public var preparation_plates:MembersCollection;
        public var status:String;

        private var _number_stock_racks:int = -1;
        
        public function IsoJobMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get number_stock_racks():* {
            if (_number_stock_racks == -1) {
                return undefined;
            } else {
                return _number_stock_racks;
            }
        }
        
        public function set number_stock_racks(number_stock_racks:uint):void {
            _number_stock_racks = number_stock_racks;
        }
        
    }
}