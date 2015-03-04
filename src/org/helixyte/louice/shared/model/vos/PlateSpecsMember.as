package org.helixyte.louice.shared.model.vos
{
    public class PlateSpecsMember extends RackSpecsMember
    {
        public var well_specs:WellSpecsMember;

        public function PlateSpecsMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}