package org.helixyte.louice.shared.model.vos
{

    public class TubeRackMember extends RackMember
    {

        public var tube_rack_specs:TubeRackSpecsMember;

        public function TubeRackMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public override function get type():String{
            return "RACK";
        }
    }
}