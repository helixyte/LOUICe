package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class RackPositionMember extends Member
    {
//        public var label:String;
        public var column_index:uint;
        public var row_index:uint;
        private const ROW_LETTERS:Array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
            "AA","AB","AC","AD","AE","AF","AG","AH","AI","AJ","AK","AL","AM","AN","AO","AP","AQ","AR","AS","AT","AU","AV","AW","AX","AY","AZ"];


        public function RackPositionMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get label():String
        {
            var c:int = column_index+1;
            return ROW_LETTERS[row_index] + c;
        }
    }
}