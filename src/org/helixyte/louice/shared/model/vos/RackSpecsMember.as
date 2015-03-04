package org.helixyte.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class RackSpecsMember extends Member
    {
        public var type:String;
        public var label:String;
        public var shape:RackShapeMember;
        public var manufacturer:OrganizationMember;
        public var _has_tubes:*;

        public function RackSpecsMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get has_tubes():*
        {
            if(this.link != null){
                return undefined;
            }
            return _has_tubes;
        }

        public function set has_tubes(has_tubes:*):void
        {
            this._has_tubes = has_tubes;
        }
    }
}