package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.MembersCollection;

    public class TubeSpecsMember extends ContainerSpecsMember
    {
        public var tube_rack_specs:MembersCollection;

        public function TubeSpecsMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}