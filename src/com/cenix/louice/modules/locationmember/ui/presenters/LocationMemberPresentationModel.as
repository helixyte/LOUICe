package com.cenix.louice.modules.locationmember.ui.presenters
{
    import org.everest.flex.interfaces.INavigationLink;
    import com.cenix.louice.shared.model.vos.LocationMember;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    import mx.collections.ArrayCollection;

    public class LocationMemberPresentationModel extends MemberPresentationModel
    {
        public function LocationMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get barcode():String
        {
            return LocationMember(_member).barcode;
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return LocationMember(_member).label;
        }

        [Bindable(Event="memberChanged")]
        public function get type():String
        {
            return LocationMember(_member).type;
        }

        [Bindable(Event="memberChanged")]
        public function get device():INavigationLink
        {
            return LocationMember(_member).device;
        }

        [Bindable(Event="memberChanged")]
        public function get index():int
        {
            return LocationMember(_member).index;
        }

        [Bindable(Event="memberChanged")]
        public function get rack():INavigationLink
        {
            return LocationMember(_member).rack;
        }
    }
}