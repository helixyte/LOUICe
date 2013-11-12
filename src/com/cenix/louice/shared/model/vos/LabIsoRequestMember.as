package com.cenix.louice.shared.model.vos
{    
    
    [Bindable]
    public class LabIsoRequestMember extends IsoRequestMember
    {
        public static const STOCKMANAGEMENT_USER:String = 'stockmanagement';
        
        public var requester:UserMember;
        public var experiment_metadata:ExperimentMetaDataMember = null;
        public var rack_layout:RackLayoutMember;
        public var delivery_date:Date;
        public var process_job_first:Boolean;
        
        public function LabIsoRequestMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}