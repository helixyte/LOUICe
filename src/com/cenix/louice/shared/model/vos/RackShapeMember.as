package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class RackShapeMember extends Member
    {
        public var name:String;
        public var label:String;
        private var _number_rows:uint;
        private var _number_columns:uint;

        public function RackShapeMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get number_columns():*
        {
            if(this._number_columns == 0){
                return undefined;
            }
            return _number_columns;
        }

        public function set number_columns(value:uint):void
        {
            _number_columns = value;
        }

        public function set number_rows(value:uint):void
        {
            _number_rows = value;
        }

        public function get number_rows():*
        {
            if(this._number_rows == 0){
                return undefined;
            }
            return _number_rows;
        }
    }
}