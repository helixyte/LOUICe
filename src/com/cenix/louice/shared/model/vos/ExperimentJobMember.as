package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.MembersCollection;

    public class ExperimentJobMember extends JobMember
    {
        public var experiments:MembersCollection;

        public function ExperimentJobMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}