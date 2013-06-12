package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.interfaces.INavigationLink;
	import org.everest.flex.model.Member;

    public class RackPositionMember extends Member
    {
//        public var label:String;
        private var _column_index:Number = -1;
        private var _row_index:Number = -1;
        private const ROW_LETTERS:Array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
            "AA","AB","AC","AD","AE","AF","AG","AH","AI","AJ","AK","AL","AM","AN","AO","AP","AQ","AR","AS","AT","AU","AV","AW","AX","AY","AZ"];


        public function RackPositionMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public override function set link(l:INavigationLink):void{
            this.title = l.title;
            this.href = l.href;
            _setRowAndColumnFromTitle(l.title);
        }

        public function get column_index():*
        {
            if(this._column_index == -1){
                return undefined;
            }
            return _column_index;
        }
        
        public function set column_index(value:Number):void
        {
            _column_index = value;
        }
        
        public function set row_index(value:Number):void
        {
            _row_index = value;
        }
        
        public function get row_index():*
        {
            if(this._row_index == -1){
                return undefined;
            }
            return _row_index;
        }
        public function get label():String
        {
            var c:int = column_index+1;
            return ROW_LETTERS[row_index] + c;
        }

        private function _setRowAndColumnFromTitle(positionLabel:String):void{
            var rowLetter:String = "";
            var columnNumber:String = "";
            var len:int = positionLabel.length;            
            for (var i:int=0; i < len; i++) {
                var c:String = positionLabel.charAt(i);
                if(isNaN(parseInt(c))) {
                    rowLetter += c;
                } else {
                    columnNumber += c;
                }
            }
            _row_index = ROW_LETTERS.indexOf(rowLetter.toUpperCase());
            _column_index = parseInt(columnNumber) - 1;
        }
    }
}