package com.cenix.louice.modules.platespecsmember.ui.presenters
{
    import org.everest.flex.interfaces.INavigationLink;
    import com.cenix.louice.shared.model.vos.ContainerSpecsMember;
    import com.cenix.louice.shared.model.vos.PlateSpecsMember;
    import com.cenix.louice.shared.model.vos.WellSpecsMember;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    import mx.collections.ArrayCollection;

    public class PlateSpecsMemberPresentationModel extends MemberPresentationModel
    {
        public function PlateSpecsMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return PlateSpecsMember(_member).label;
        }

        [Bindable(Event="memberChanged")]
        public function get shape():INavigationLink
        {
            return PlateSpecsMember(_member).shape;
        }

        [Bindable(Event="memberChanged")]
        public function get manufacturer():INavigationLink
        {
            return PlateSpecsMember(_member).manufacturer;
        }

        [Bindable(Event="memberChanged")]
        public function get well_specs():WellSpecsMember
        {
            return PlateSpecsMember(_member).well_specs;
        }

    }
}