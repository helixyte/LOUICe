package com.cenix.louice.shared.model.vos
{
    import org.everest.flex.model.Member;

    public class JobMember extends Member
    {

        public var label:String;
        public var description:String;
        public var job_type:JobTypeMember;
        public var user:UserMember;
        public var subproject:SubprojectMember;
        public var status:String;
        public var start_time:Date;
        public var end_time:Date;

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