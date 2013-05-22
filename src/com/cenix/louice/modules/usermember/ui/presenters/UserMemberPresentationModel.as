package com.cenix.louice.modules.usermember.ui.presenters
{

    import com.cenix.louice.shared.model.vos.UserMember;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    public class UserMemberPresentationModel extends MemberPresentationModel
    {
        public function UserMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get username():String
        {
            return UserMember(_member).username;
        }

    }
}