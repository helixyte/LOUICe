package com.cenix.louice.shared.model.vos
{
    import org.everest.flex.interfaces.INavigationLink;
    import org.everest.flex.model.Member;

    public class PlateMember extends RackMember
    {

        public var plate_specs:PlateSpecsMember;

        public function PlateMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public override function get type():String{
            return "PLATE";
        }

        /**
         * This is a way to make allow a manually generate a link for a Plate
         * if it has been transmitted as a whole.
         */
        public function generateNavigationLink():INavigationLink
        {
            var l:String = "/racks/" + barcode;
            var t:String = barcode + " - " + label;
            return new Member(t,l);

        }
    }
}