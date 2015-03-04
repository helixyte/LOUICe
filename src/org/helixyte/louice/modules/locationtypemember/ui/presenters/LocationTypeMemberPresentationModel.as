package org.helixyte.louice.modules.locationtypemember.ui.presenters
{
    import org.helixyte.louice.shared.model.vos.LocationTypeMember;
    import org.everest.flex.model.MembersCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    import mx.collections.ArrayCollection;

    public class LocationTypeMemberPresentationModel extends MemberPresentationModel
    {
        public function LocationTypeMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get name():String
        {
            return LocationTypeMember(_member).name;
        }

        [Bindable(Event="memberChanged")]
        public function get locations():MembersCollection
        {
            return LocationTypeMember(_member).locations;
        }
    }
}