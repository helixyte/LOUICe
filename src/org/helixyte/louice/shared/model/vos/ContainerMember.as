package org.helixyte.louice.shared.model.vos
{
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    public class ContainerMember extends Member
    {
        public var rack:RackMember;
        public var rack_specs:RackSpecsMember;
        public var position:RackPositionMember;
        public var sample_volume:Number;
        public var sample_molecule_design_pool_id:String;
        public var sample_molecules:MembersCollection;
        public var container_specs:ContainerSpecsMember;
        public var itemstatus:ItemStatusMember;

        public function ContainerMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }


//        /**
//         * Used mainly for sorting
//         */
//        public function get concentration():String
//        {
//            return concatenateOnAttribute(sample_molecules, "concentration");
//        }
//
//        private function concatenateOnAttribute(objects:Array, attr:String):String
//        {
//            var values:Array = [];
//            var attrValue:* = null;
//            var attrStringValue:String = "";
//            for each (var o:* in objects) {
//                attrValue = o[attr];
//                if (attrValue != null) {
//                    if (attrValue is Date) {
//                        attrStringValue = (attrValue as Date).toLocaleString();
//                    }
//                    else {
//                        attrStringValue = StringUtil.trim(attrValue);
//                    }
//                    if (attrStringValue.length > 0) {
//                        values.push(attrStringValue);
//                    }
//                }
//            }
//            return values.join("\n");
//        }
    }
}