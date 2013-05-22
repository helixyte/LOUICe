package com.cenix.louice.shared.model.vos
{
    import mx.collections.Sort;

    import spark.collections.SortField;
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    public class ExperimentMember extends Member
    {
        public var label:String;
        public var destination_rack_specs:RackSpecsMember;
        public var source_rack:RackMember;
        public var experiment_design:ExperimentDesignMember;
        public var experiment_job:ExperimentJobMember;
        public var experiment_type:String;

        private var _experiment_racks:MembersCollection;
        private var _number_replicates:uint;

        public function ExperimentMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get experiment_racks():MembersCollection
        {
            if (_experiment_racks != null)
            {
                //sort by label
                var dataSortField:SortField = new SortField();
                dataSortField.name = "design_rack";
                dataSortField.numeric = true;

                var numericDataSort:Sort= new Sort();
                numericDataSort.fields = [dataSortField];

                _experiment_racks.sort = numericDataSort;
                _experiment_racks.refresh();
            }

            return _experiment_racks;
        }

        public function set experiment_racks(value:MembersCollection):void
        {
            _experiment_racks = value;
        }

    }
}