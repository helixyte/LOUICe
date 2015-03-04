package org.helixyte.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class JobTypeMember extends Member
    {
        public var name:String;
        public var label:String;
        public var xml:String;

        public function JobTypeMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}