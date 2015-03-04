package org.helixyte.louice.shared.model.vos
{    
    [Bindable]
    public class LabIsoRequestMember extends IsoRequestMember
    {
        public var delivery_date:Date;
        public var requester:UserMember;
        public var experiment_metadata:ExperimentMetaDataMember = null;
        public var rack_layout:RackLayoutMember;
        
        private var _process_job_first:int = -1;
        private var _ticket_number:uint = 0;

        public function LabIsoRequestMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
			this.iso_type = 'LAB';
        }

        public function get process_job_first():* {
            if (_process_job_first == -1) {
                return undefined;
            }
            else {
                return _process_job_first == 1;
            }
        }
        
        public function set process_job_first(flag:Boolean):void {
            _process_job_first = flag ? 1 : 0;
        }

        public function get ticket_number():* {
            if (_ticket_number == 0) {
                return undefined;
            } else {
                return _ticket_number;
            }
        }
        
        public function set ticket_number(ticket_number:uint):void {
            _ticket_number = ticket_number;

        }
    }
}
