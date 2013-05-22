package com.cenix.louice.modules.itemstatusmember.ui.presenters
{
    import com.cenix.louice.shared.model.vos.ItemStatusMember;

    import flash.events.IEventDispatcher;

    import mx.collections.ArrayCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    public class ItemStatusMemberPresentationModel extends MemberPresentationModel
    {
        public function ItemStatusMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get name():String
        {
            return ItemStatusMember(_member).name;
        }

        [Bindable(Event="memberChanged")]
        public function get description():String
        {
            return ItemStatusMember(_member).description;
        }
    }
}