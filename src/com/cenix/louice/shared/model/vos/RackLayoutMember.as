package com.cenix.louice.shared.model.vos
{
    import com.adobe.utils.DictionaryUtil;
    import com.cenix.louice.shared.ui.components.rack.TagMap;

    import flash.utils.Dictionary;

    import mx.collections.ArrayCollection;

    import org.as3commons.lang.StringUtils;

    import spark.collections.Sort;
    import spark.collections.SortField;
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    public class RackLayoutMember extends Member
    {
        public var label:String;
        public var rack_shape:RackShapeMember;
        public var tagged_rack_position_sets:MembersCollection;

        private var _tagMap:TagMap;
        private var _tagPredicates:ArrayCollection;

        public function RackLayoutMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }


        public function get tagPredicateMap():TagMap{
            //returns a position based map of all tags for this layout

            if (_tagMap == null)
            {
                _tagMap = new TagMap();

                for each (var taggedRackPositionSet:TaggedRackPositionSetMember in tagged_rack_position_sets)
                {
                    if (taggedRackPositionSet.rack_position_set)
                    {
                        var localTags:ArrayCollection = new ArrayCollection();

                        for each (var tag:TagMember in taggedRackPositionSet.tags)
                        {
                            localTags.addItem(tag);
                        }


                        for each (var pos:RackPositionMember in taggedRackPositionSet.rack_position_set.rack_positions)
                        {
                            _tagMap.addTags(pos.label, localTags.toArray());
                        }
                    }
                }
            }

            return _tagMap;
        }

        /**
         * Computes a list of all tag predicates for this iso request.
         *
         * @return a list of all tag predicates for this iso request
         */
        public function get tagPredicates():ArrayCollection
        {
            if (_tagPredicates == null)
            {
                var predicateMap:Dictionary = new Dictionary();

                for each (var taggedRackPositionSet:TaggedRackPositionSetMember in tagged_rack_position_sets)
                {
                    for each (var tag:TagMember in taggedRackPositionSet.tags)
                    {
                        if (predicateMap[tag.predicate] == null)
                        {
                            predicateMap[tag.predicate] = new TagPredicate(tag);
                        }
                        else
                        {
                            predicateMap[tag.predicate].addValue(tag.value);
                        }
                    }
                }

                _tagPredicates = new ArrayCollection(DictionaryUtil.getValues(predicateMap));
                //add sorting
                var sortfield:SortField = new SortField("label");
                var sort:Sort = new Sort();
                sort.fields = [sortfield];
                _tagPredicates.sort = sort;
                _tagPredicates.refresh();
            }
            return _tagPredicates;
        }
    }
}