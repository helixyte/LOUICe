package com.cenix.louice.modules.tubemember.ui.presenters
{
    import com.cenix.louice.shared.model.vos.ContainerSpecsMember;
    import com.cenix.louice.shared.model.vos.ItemStatusMember;
    import com.cenix.louice.shared.model.vos.RackPositionMember;
    import com.cenix.louice.shared.model.vos.RackSpecsMember;
    import com.cenix.louice.shared.model.vos.TubeMember;
    
    import flash.events.IEventDispatcher;
    
    import org.everest.flex.interfaces.INavigationLink;
    import org.everest.flex.model.MembersCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    public class TubeMemberPresentationModel extends MemberPresentationModel
    {
        public function TubeMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get barcode():String
        {
            return TubeMember(_member).barcode;
        }

        [Bindable(Event="memberChanged")]
        public function get tube_rack():INavigationLink
        {
            return TubeMember(_member).tube_rack;
        }

        [Bindable(Event="memberChanged")]
        public function get location():INavigationLink
        {
            return TubeMember(_member).location;
        }

        [Bindable(Event="memberChanged")]
        public function get position():RackPositionMember
        {
            return TubeMember(_member).position;
        }

        [Bindable(Event="memberChanged")]
        public function get tube_rack_specs():RackSpecsMember
        {
            return TubeMember(_member).tube_rack_specs;
        }

        [Bindable(Event="memberChanged")]
        public function get tube_specs():ContainerSpecsMember
        {
            return TubeMember(_member).tube_specs;
        }

        [Bindable(Event="memberChanged")]
        public function get itemstatus():ItemStatusMember
        {
            return TubeMember(_member).itemstatus;
        }

        [Bindable(Event="memberChanged")]
        public function get sample_volume():Number
        {
            return TubeMember(_member).sample_volume;
        }

        [Bindable(Event="memberChanged")]
        public function get sample_molecules():MembersCollection
        {
            return TubeMember(_member).sample_molecules;
        }

    }
}