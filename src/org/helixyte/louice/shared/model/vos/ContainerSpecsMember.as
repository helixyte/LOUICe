package org.helixyte.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    [Bindable]
    public class ContainerSpecsMember extends Member
    {

        public var label:String;
        public var description:String;
        private var _max_volume:Number;
        private var _dead_volume:Number;
        public var manufacturer:OrganizationMember;

        public function ContainerSpecsMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get max_volume():*
        {
            if(link != null || isNaN(_max_volume)){
                return undefined;
            }
            return _max_volume;
        }

        public function set max_volume(value:Number):void
        {
            _max_volume = value;
        }

        public function get dead_volume():*
        {
            if(link != null || isNaN(_dead_volume)){
                return undefined;
            }
            return _dead_volume;
        }

        public function set dead_volume(value:Number):void
        {
            _dead_volume = value;
        }
    }
}