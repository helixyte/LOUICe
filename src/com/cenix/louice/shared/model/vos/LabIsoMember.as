package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.MembersCollection;

    [Bindable]
    public class LabIsoMember extends IsoMember
    {
        public var lab_iso_request:LabIsoRequestMember;
		public var library_plates:MembersCollection;
		public var requested_library_plates:String;

        public function LabIsoMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
            this.iso_type = 'LAB';
        }
		
    }
}
