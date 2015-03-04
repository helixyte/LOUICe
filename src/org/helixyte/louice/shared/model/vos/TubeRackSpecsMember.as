package org.helixyte.louice.shared.model.vos
{
	import org.everest.flex.model.MembersCollection;

    public class TubeRackSpecsMember extends RackSpecsMember
    {
        public var tube_specs:MembersCollection;

        public function TubeRackSpecsMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}