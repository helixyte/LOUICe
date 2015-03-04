package org.helixyte.louice.shared.model.vos
{
    import org.everest.flex.model.Member;

    public class JobMember extends Member
    {
		public var job_type:String;
        public var label:String;
        public var user:UserMember;
        public var creation_time:Date;

        public function JobMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get sortfield():String
        {
            return String(id);
        }
    }
}