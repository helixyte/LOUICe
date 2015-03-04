package org.helixyte.louice.shared.model.vos
{
	import org.everest.flex.model.Member;
	import org.everest.flex.model.MembersCollection;

    [Bindable]
    public class RackMember extends Member
    {
        public var barcode:String;
        public var label:String;
        public var comment:String;
        public var creation_date:Date;
        public var specs:RackSpecsMember;
        public var location:LocationMember;
        public var status:ItemStatusMember;
        public var containers:MembersCollection;
        private var _total_containers:*;
        private var _type:String;

        public function RackMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get total_containers():*
        {
            if (this.link != null)
            {
                //this is a patch for the serialization ...
                return undefined;
            }
            return _total_containers;
        }

        public function set total_containers(total_containers:*):void
        {
            this._total_containers=total_containers;
        }

        public override function toString():String
        {
            return (label != null) ? label : title;
        }

        public function get type():String
        {
            return this._type;
        }

        public function set type(type:String):void
        {
            this._type = type;
        }

        public function isFuture():Boolean{
            return status.toString().toUpperCase() == "FUTURE";
        }
    }
}
