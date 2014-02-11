package com.cenix.louice.shared.model.vos
{
    import spark.collections.Sort;
    import spark.collections.SortField;
    
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    [Bindable]
    public class IsoMember extends Member
    {   
        public var iso_type:String = 'BASE';
        public var label:String;
        public var status:String;
        public var rack_layout:RackLayoutMember;
        public var iso_job:IsoJobMember;
        public var stock_racks:MembersCollection;
        public var preparation_plates:MembersCollection;
        public var molecule_design_pool_set:MoleculeDesignPoolSetMember;
        public var optimizer_excluded_racks:String;
        public var optimizer_required_racks:String;

        private var _aliquot_plates:MembersCollection;
        private var _number_stock_racks:uint = 0;
        
        public function IsoMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get sortfield():String
        {
            return iso_job.id + label.replace("_","");
        }

        public function get aliquot_plates():MembersCollection
        {
            return _aliquot_plates;
        }
        
        public function set aliquot_plates(value:MembersCollection):void
        {
            if (value != null)
            {
                var sortfield:SortField = new SortField("label");
                var sort:Sort = new Sort();
                sort.fields = [sortfield];
                value.sort = sort;
                value.refresh();
            }
            _aliquot_plates = value;
        }
        
        public function get number_stock_racks():* {
            if (_number_stock_racks == 0) {
                return undefined;
            } else {
                return _number_stock_racks;
            }
        }
        
        public function set number_stock_racks(number_stock_racks:uint):void {
            _number_stock_racks = number_stock_racks;
        }
        
    }
}