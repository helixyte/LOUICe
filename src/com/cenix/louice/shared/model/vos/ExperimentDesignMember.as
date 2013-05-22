package com.cenix.louice.shared.model.vos
{
    import com.adobe.utils.DictionaryUtil;

    import flash.utils.Dictionary;

    import mx.collections.ArrayCollection;

    import spark.collections.Sort;
    import spark.collections.SortField;
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    [Bindable]
    public class ExperimentDesignMember extends Member
    {

        public var label:String;
        public var description:String;
        public var rack_shape:RackShapeMember;
        public var experiments:MembersCollection;
        public var experiment_metadata:ExperimentMetaDataMember;
        private var _experiment_design_racks:MembersCollection;
        private var _tagPredicates:ArrayCollection;


        public function ExperimentDesignMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }


        /**
         * Computes a list of all tag predicates for this experiment design.
         *
         * @return a list of all tag predicates for this experiment design
         */
        public function get tagPredicates():ArrayCollection
        {
            if (_tagPredicates == null)
            {
                var predicateMap:Dictionary = new Dictionary();

                for each (var rack:ExperimentDesignRackMember in experiment_design_racks)
                {
                    var layout:RackLayoutMember = rack.rack_layout;
                    for each (var taggedRackPositionSet:TaggedRackPositionSetMember in layout.tagged_rack_position_sets)
                    {
//                        for each (var tags:MembersCollection in taggedRackPositionSet.tags)
//                        {
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
//                        }

                    }
                }
                _tagPredicates = new ArrayCollection(DictionaryUtil.getValues(predicateMap));
                //add sorting
                var sortfield:SortField = new SortField("label")
                var sort:Sort = new Sort();
                sort.fields = [sortfield];
                _tagPredicates.sort = sort;
                _tagPredicates.refresh();
            }

            return _tagPredicates;
        }

        public function get experiment_design_racks():MembersCollection
        {
            if (_experiment_design_racks != null)
            {
                //sort by label
                var dataSortField:SortField = new SortField();
                    dataSortField.name = "label";
                    dataSortField.numeric = true;

                var numericDataSort:Sort = new Sort();
                numericDataSort.fields = [dataSortField];

                _experiment_design_racks.sort = numericDataSort;
                _experiment_design_racks.refresh();
            }
            return _experiment_design_racks;
        }

        public function updateExperimentDesignRackLayout(layout:RackLayoutMember):void
        {
            for each (var rack:ExperimentDesignRackMember in _experiment_design_racks)
            {
                if (rack.rack_layout.id == layout.id)
                {
                    rack.rack_layout = layout;
                    _experiment_design_racks.refresh();
                    return;
                }
            }

        }


        public function set experiment_design_racks(value:MembersCollection):void
        {
            _experiment_design_racks = value;
        }


    }

}