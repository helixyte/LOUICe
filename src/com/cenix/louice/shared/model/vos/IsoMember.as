package com.cenix.louice.shared.model.vos
{
    import spark.collections.Sort;
    import spark.collections.SortField;
    
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    [Bindable]
    public class IsoMember extends Member
    {
        public var iso_type:String;
        public var label:String;
        public var molecule_design_pool_set:MoleculeDesignPoolSetMember;
        public var rack:RackMember;
        public var status:String;
        public var optimizer_excluded_racks:String;
        public var optimizer_required_racks:String;
        public var rack_layout:RackLayoutMember;
        public var iso_sample_stock_racks:MembersCollection;
        public var iso_preparation_plate:PlateMember;
        private var _iso_aliquot_plates:MembersCollection;
        public var iso_job:IsoJobMember;

        public function IsoMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get sortfield():String
        {
            return iso_job.id + label.replace("_","");
        }

        public function get iso_aliquot_plates():MembersCollection
        {
            return _iso_aliquot_plates;
        }

        public function set iso_aliquot_plates(value:MembersCollection):void
        {
            if (value != null)
            {
                var sortfield:SortField = new SortField("label");
                var sort:Sort = new Sort();
                sort.fields = [sortfield];
                value.sort = sort;
                value.refresh();
            }
            _iso_aliquot_plates = value;
        }

    }
}