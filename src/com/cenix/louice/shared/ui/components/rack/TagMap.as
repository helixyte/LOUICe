package com.cenix.louice.shared.ui.components.rack
{
    import com.adobe.utils.DictionaryUtil;
    import com.cenix.louice.shared.model.vos.TagMember;

    import flash.utils.Dictionary;

    import mx.collections.ArrayCollection;

    import spark.collections.Sort;
    import spark.collections.SortField;

    public class TagMap
    {
        private var _map : Dictionary;

        /**
         * Contains a position based listing of all tags.
         * (row_index,column_index) -> [tag1 .. tagn]
         */
        public function TagMap()
        {
            _map = new Dictionary();
        }

        public function addTags(position:String, newTags:Array):void
        {
            var tags:ArrayCollection = _map[position];

            if (tags == null)
            {
                tags = new ArrayCollection();

                //add sorting
                var sortfield:SortField = new SortField("label");
                var sort:Sort = new Sort();
                sort.fields = [sortfield];
                tags.sort = sort;
                tags.refresh();
            }

            for each (var tag:TagMember in newTags)
            {
                tags.addItem(tag);
            }


            _map[position] = tags;
        }

        public function getTags(position:String):ArrayCollection
        {
            return _map[position];
        }

        public function get positions():Array
        {
            return DictionaryUtil.getKeys(_map);
        }

    }
}