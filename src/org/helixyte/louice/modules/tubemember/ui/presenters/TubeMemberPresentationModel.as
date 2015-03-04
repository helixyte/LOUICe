package org.helixyte.louice.modules.tubemember.ui.presenters
{
    import org.helixyte.louice.shared.model.vos.ContainerSpecsMember;
    import org.helixyte.louice.shared.model.vos.ItemStatusMember;
    import org.helixyte.louice.shared.model.vos.RackPositionMember;
    import org.helixyte.louice.shared.model.vos.RackSpecsMember;
    import org.helixyte.louice.shared.model.vos.TubeMember;
    
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
        public function get sample_molecule_design_pool_id():String
        {
            return TubeMember(_member).sample_molecule_design_pool_id;
        }
        
        [Bindable(Event="memberChanged")]
        public function get sample_molecules():MembersCollection
        {
            return TubeMember(_member).sample_molecules;
        }

        [Bindable(Event="memberChanged")]
        public function get sample_supplier():INavigationLink
        {
            return TubeMember(_member).sample_supplier;
        }

        [Bindable(Event="memberChanged")]
        public function get sample_product_id():String
        {
            return TubeMember(_member).sample_product_id;
        }
}
}