package com.cenix.louice.shared.model.vos
{

    public class WellMember extends ContainerMember
    {
        public var well_specs:WellSpecsMember;

        public function WellMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}