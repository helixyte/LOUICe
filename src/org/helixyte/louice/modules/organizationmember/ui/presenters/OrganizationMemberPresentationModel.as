package org.helixyte.louice.modules.organizationmember.ui.presenters
{
    import org.everest.flex.events.MemberEvent;
    import org.helixyte.louice.shared.model.vos.OrganizationMember;
    import org.everest.flex.ui.presenters.MemberPresentationModel;
    
    import flash.events.Event;
    import flash.events.IEventDispatcher;

    public class OrganizationMemberPresentationModel extends MemberPresentationModel
    {
        public function OrganizationMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get name():String
        {
            return OrganizationMember(_member).name;
        }

        public function set name(name:String):void
        {
            OrganizationMember(_member).name = name;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }
    }
}