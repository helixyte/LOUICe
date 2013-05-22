package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class ExperimentRackMember extends Member
    {

        public var experiment:ExperimentMember;
        public var design_rack:ExperimentDesignRackMember;
        public var plate:PlateMember;
        public var source_rack:RackMember;

        [Bindable]
        public var manual:Boolean;

        [Bindable]
        public var biomek:Boolean;

        [Bindable]
        public var repeat:Boolean;

        public function ExperimentRackMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
    }
}