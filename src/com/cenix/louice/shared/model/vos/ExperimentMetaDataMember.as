package com.cenix.louice.shared.model.vos
{
    import org.everest.flex.model.Member;

    [Bindable]
    public class ExperimentMetaDataMember extends Member
    {
        public var label:String;
        public var subproject:SubprojectMember;
        public var molecule_design_pool_set:MoleculeDesignPoolSetMember;
        public var experiment_design:ExperimentDesignMember;
        public var lab_iso_request:LabIsoRequestMember;
        public var creation_date:Date;
        public var experiment_metadata_type:ExperimentMetaDataTypeMember;

		private var _ticket_number:uint;
		private var _number_replicates:uint;

        public function ExperimentMetaDataMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get number_replicates():*
        {
            if((link != null)||(_number_replicates < 1)){
                return undefined;
            }
            return _number_replicates;
        }

        public function set number_replicates(value:uint):void
        {
            _number_replicates = value;
        }

		public function get ticket_number():*
		{
			if((link != null)||(_ticket_number < 1)){
				return undefined;
			}
			return _ticket_number;
		}
		
		public function set ticket_number(value:uint):void
		{
			_ticket_number = value;
		}
                    
	}
}