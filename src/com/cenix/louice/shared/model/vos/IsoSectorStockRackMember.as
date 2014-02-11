package com.cenix.louice.shared.model.vos
{
    [Bindable]
    public class IsoSectorStockRackMember extends StockRackMember
    {
        private var _index:uint = 0;

        public function IsoSectorStockRackMember(title:String=null, selfLink:String=null)
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
