package com.cenix.louice.modules.tuberackspecsmember.ui.presenters
{
    import org.everest.flex.interfaces.INavigationLink;
    import com.cenix.louice.shared.model.vos.ContainerSpecsMember;
    import org.everest.flex.model.MembersCollection;
    import com.cenix.louice.shared.model.vos.TubeRackSpecsMember;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    import mx.collections.ArrayCollection;

    public class TubeRackSpecsMemberPresentationModel extends MemberPresentationModel
    {
        public function TubeRackSpecsMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return TubeRackSpecsMember(_member).label;
        }

        [Bindable(Event="memberChanged")]
        public function get shape():INavigationLink
        {
            return TubeRackSpecsMember(_member).shape;
        }

        [Bindable(Event="memberChanged")]
        public function get manufacturer():INavigationLink
        {
            return TubeRackSpecsMember(_member).manufacturer;
        }

        [Bindable(Event="memberChanged")]
        public function get tube_specs():MembersCollection
        {
            return TubeRackSpecsMember(_member).tube_specs;
        }

    }
}