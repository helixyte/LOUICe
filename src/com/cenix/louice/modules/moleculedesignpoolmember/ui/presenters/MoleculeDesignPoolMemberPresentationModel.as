package com.cenix.louice.modules.moleculedesignpoolmember.ui.presenters
{
    import com.cenix.louice.shared.model.vos.MoleculeDesignPoolMember;
    import com.cenix.louice.shared.model.vos.MoleculeTypeMember;
    
    import flash.events.IEventDispatcher;
    
    import org.everest.flex.model.MembersCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;
    
    public class MoleculeDesignPoolMemberPresentationModel extends MemberPresentationModel
    {
		
        public function MoleculeDesignPoolMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get identifier():int
        {
            return MoleculeDesignPoolMember(_member).id;
        }

        [Bindable(Event="memberChanged")]
        public function get molecule_type():MoleculeTypeMember
        {
            return MoleculeDesignPoolMember(_member).molecule_type;
        }

		[Bindable(Event="memberChanged")]
		public function get number_designs():Number
		{
			return MoleculeDesignPoolMember(_member).number_designs;
		}
		
		[Bindable(Event="memberChanged")]
		public function get molecule_designs():MembersCollection
		{
			return MoleculeDesignPoolMember(_member).molecule_designs;
		}		
		
        [Bindable(Event="memberChanged")]
        public function get genes():MembersCollection
        {
            return MoleculeDesignPoolMember(_member).genes;
        }
        
        [Bindable(Event="memberChanged")]
        public function get supplier_molecule_designs():MembersCollection
        {
            return MoleculeDesignPoolMember(_member).supplier_molecule_designs;
        }
        
    }
}