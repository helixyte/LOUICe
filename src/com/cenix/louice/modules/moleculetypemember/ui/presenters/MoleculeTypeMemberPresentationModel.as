package com.cenix.louice.modules.moleculetypemember.ui.presenters
{
    import com.cenix.louice.shared.model.vos.MoleculeTypeMember;
    
    import flash.events.IEventDispatcher;
    
    import org.everest.flex.model.MembersCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    public class MoleculeTypeMemberPresentationModel extends MemberPresentationModel
    {
        public function MoleculeTypeMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get name():String
        {
            return MoleculeTypeMember(_member).name;
        }

        [Bindable(Event="memberChanged")]
        public function get description():String
        {
            return MoleculeTypeMember(_member).description;
        }

        [Bindable(Event="memberChanged")]
        public function get thaw_time():Number
        {
            return MoleculeTypeMember(_member).thaw_time;
        }

        [Bindable(Event="memberChanged")]
        public function get modifications():MembersCollection
        {
            return MoleculeTypeMember(_member).modifications;
        }

    }
}