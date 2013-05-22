package com.cenix.louice.modules.wellspecsmember.ui.presenters
{
    import org.everest.flex.model.MembersCollection;
    import com.cenix.louice.shared.model.vos.OrganizationMember;
    import com.cenix.louice.shared.model.vos.WellSpecsMember;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    public class WellSpecsMemberPresentationModel extends MemberPresentationModel
    {
        public function WellSpecsMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return WellSpecsMember(_member).label;
        }

        [Bindable(Event="memberChanged")]
        public function get description():String
        {
            return WellSpecsMember(_member).description;
        }

        [Bindable(Event="memberChanged")]
        public function get max_volume():Number
        {
            return WellSpecsMember(_member).max_volume;
        }

        [Bindable(Event="memberChanged")]
        public function get dead_volume():Number
        {
            return WellSpecsMember(_member).dead_volume;
        }

        [Bindable(Event="memberChanged")]
        public function get manufacturer():OrganizationMember
        {
            return WellSpecsMember(_member).manufacturer;
        }

    }
}