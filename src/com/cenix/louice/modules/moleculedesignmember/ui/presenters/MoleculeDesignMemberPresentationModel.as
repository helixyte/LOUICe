package com.cenix.louice.modules.moleculedesignmember.ui.presenters
{
    import com.cenix.louice.shared.model.vos.MoleculeDesignMember;
    import com.cenix.louice.shared.model.vos.MoleculeTypeMember;
    
    import flash.events.IEventDispatcher;
    
    import org.everest.flex.model.MembersCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;
    
    public class MoleculeDesignMemberPresentationModel extends MemberPresentationModel
    {
        public function MoleculeDesignMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get identifier():int
        {
            return MoleculeDesignMember(_member).id;
        }

        [Bindable(Event="memberChanged")]
        public function get chemical_structures():MembersCollection
        {
            return MoleculeDesignMember(_member).chemical_structures;
        }

        [Bindable(Event="memberChanged")]
        public function get molecule_type():MoleculeTypeMember
        {
            return MoleculeDesignMember(_member).molecule_type;
        }

        [Bindable(Event="memberChanged")]
        public function get genes():MembersCollection
        {
            return MoleculeDesignMember(_member).genes;
        }
    }
}