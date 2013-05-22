package com.cenix.louice.shared.model.vos
{
    import org.everest.flex.interfaces.INavigationLink;
    import org.everest.flex.model.Member;

    public class ExperimentDesignRackMember extends Member
    {

        public var label:String;
        public var rack_shape:RackShapeMember;
        public var rack_layout:RackLayoutMember;
        public var subproject:SubprojectMember;



        public function ExperimentDesignRackMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public override function toString():String
        {
            return (label != null) ? label : title;
        }

    }
}