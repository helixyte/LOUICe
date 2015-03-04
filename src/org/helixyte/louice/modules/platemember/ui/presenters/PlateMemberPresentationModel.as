package org.helixyte.louice.modules.platemember.ui.presenters
{
    import org.everest.flex.interfaces.INavigationLink;
    import org.everest.flex.model.MembersCollection;
    import org.helixyte.louice.shared.model.vos.PlateMember;
    import org.helixyte.louice.shared.ui.components.rack.RackPositionComperator;
    import org.everest.flex.ui.presenters.CollectionPresentationModel;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    public class PlateMemberPresentationModel extends MemberPresentationModel
    {

        public function PlateMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get barcode():String
        {
            return PlateMember(_member).barcode;
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return PlateMember(_member).label;
        }

        [Bindable(Event="memberChanged")]
        public function get comment():String
        {
            return PlateMember(_member).comment;
        }

        [Bindable(Event="memberChanged")]
        public function get creation_date():Date
        {
            return PlateMember(_member).creation_date;
        }

        [Bindable(Event="memberChanged")]
        public function get specs():INavigationLink
        {
            return PlateMember(_member).specs;
        }

        [Bindable(Event="memberChanged")]
        public function get location():INavigationLink
        {
            return PlateMember(_member).location;
        }

        [Bindable(Event="memberChanged")]
        public function get status():INavigationLink
        {
            return PlateMember(_member).status;
        }

        [Bindable(Event="memberChanged")]
        public function get containers():MembersCollection
        {
            var c:MembersCollection = PlateMember(_member).containers;

            if (c != null)
            {
                RackPositionComperator.sort(c);
            }

            return c;
        }

        [Bindable(Event="memberChanged")]
        public function get hasContainers():Boolean
        {
            if(_member == null)
            {
                return false;
            }
            var c:MembersCollection = PlateMember(_member).containers;
            return (c && c.length > 0) ? true : false;
        }
    }
}
