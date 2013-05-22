package com.cenix.louice.shared.ui.components.rack
{

   	import mx.collections.ArrayCollection;
    
    import org.as3commons.lang.StringUtils;

    import spark.collections.Sort;
    import spark.collections.SortField;

    public class RackPositionComperator
    {
        public function RackPositionComperator()
        {
        }

        /**
         * Rack label go from A, B, .. , Z, AA, AB, .., AZ and so on
         * To sort by rack label this special compare function is needed.
         *
         * @param a
         * @param b
         * @return
         */
        public static function compare(a:String, b:String):int
        {
            var alength:int = a.length;
            var blength:int = b.length;
            if (alength < blength){
                return -1;
            } else if (alength > blength){
                return 1;
            } else {
                return StringUtils.naturalCompare(a,b);
            }
        }

        /**
         * Rack label go from A, B, .. , Z, AA, AB, .., AZ and so on
         * To sort by rack label this special compare function is needed.
         *
         * @param a
         * @param b
         * @return
         */
        public static function compareDataGridColumn(aRow:*, bRow:*):int
        {
            var a:String = aRow['position'];
            var b:String = bRow['position'];
//            return StringUtils.compareTo(a,b);
            return StringUtils.naturalCompare(a,b);
        }

        public static function sort(c:ArrayCollection):void
        {
            var dataSortField:SortField = new SortField();
                dataSortField.compareFunction = RackPositionComperator.compareDataGridColumn;
            var dataSort:Sort = new Sort();
            dataSort.fields = [dataSortField];
            c.sort = dataSort;
            c.refresh();
        }
    }
}