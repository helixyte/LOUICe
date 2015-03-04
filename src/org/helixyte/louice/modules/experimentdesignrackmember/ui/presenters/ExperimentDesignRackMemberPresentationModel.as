package org.helixyte.louice.modules.experimentdesignrackmember.ui.presenters
{
    import org.helixyte.louice.shared.model.vos.ExperimentDesignRackMember;
    import org.helixyte.louice.shared.model.vos.RackLayoutMember;
    import org.helixyte.louice.shared.model.vos.RackShapeMember;
    import org.helixyte.louice.shared.model.vos.SubprojectMember;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    public class ExperimentDesignRackMemberPresentationModel extends MemberPresentationModel
    {
        public function ExperimentDesignRackMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return ExperimentDesignRackMember(_member).label;
        }

        [Bindable(Event="memberChanged")]
        public function get rack_shape():String
        {
            var shape:RackShapeMember = ExperimentDesignRackMember(_member).rack_shape;
            return (shape) ? shape.label : "";
        }

        [Bindable(Event="memberChanged")]
        public function get rack_layout():RackLayoutMember
        {
            return ExperimentDesignRackMember(_member).rack_layout;
        }

        [Bindable(Event="memberChanged")]
        public function get subproject():SubprojectMember
        {
            return ExperimentDesignRackMember(_member).subproject;
        }

    }
}