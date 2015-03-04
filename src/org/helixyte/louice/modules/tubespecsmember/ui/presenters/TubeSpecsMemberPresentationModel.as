package org.helixyte.louice.modules.tubespecsmember.ui.presenters
{
    import org.everest.flex.interfaces.INavigationLink;
    import org.everest.flex.model.MembersCollection;
    import org.helixyte.louice.shared.model.vos.OrganizationMember;
    import org.helixyte.louice.shared.model.vos.TubeRackSpecsMember;
    import org.helixyte.louice.shared.model.vos.TubeSpecsMember;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    import mx.collections.ArrayCollection;

    public class TubeSpecsMemberPresentationModel extends MemberPresentationModel
    {
        public function TubeSpecsMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return TubeSpecsMember(_member).label;
        }

        [Bindable(Event="memberChanged")]
        public function get description():String
        {
            return TubeSpecsMember(_member).description;
        }

        [Bindable(Event="memberChanged")]
        public function get max_volume():Number
        {
            return TubeSpecsMember(_member).max_volume;
        }

        [Bindable(Event="memberChanged")]
        public function get dead_volume():Number
        {
            return TubeSpecsMember(_member).dead_volume;
        }

        [Bindable(Event="memberChanged")]
        public function get manufacturer():OrganizationMember
        {
            return TubeSpecsMember(_member).manufacturer;
        }

        [Bindable(Event="memberChanged")]
        public function get tube_rack_specs():MembersCollection
        {
            return TubeSpecsMember(_member).tube_rack_specs;
        }
    }
}