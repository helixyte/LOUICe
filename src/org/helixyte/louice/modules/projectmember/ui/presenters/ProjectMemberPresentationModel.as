package org.helixyte.louice.modules.projectmember.ui.presenters
{
    import org.helixyte.louice.shared.model.vos.OrganizationMember;
    import org.helixyte.louice.shared.model.vos.ProjectMember;
    import org.helixyte.louice.shared.model.vos.SubprojectMember;
    import org.helixyte.louice.shared.model.vos.UserMember;
    
    import flash.events.Event;
    import flash.events.IEventDispatcher;
    
    import org.everest.flex.events.MemberEvent;
    import org.everest.flex.model.MembersCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    public class ProjectMemberPresentationModel extends MemberPresentationModel
    {
        public function ProjectMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return ProjectMember(_member).label;
        }

        public function set label(label:String):void
        {
            ProjectMember(_member).label = label;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }

        [Bindable(Event="memberChanged")]
        public function get leader():UserMember
        {
            return ProjectMember(_member).leader;
        }

        public function set leader(leader:UserMember):void
        {
            ProjectMember(_member).leader = leader;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }

        [Bindable(Event="memberChanged")]
        public function get creation_date():Date
        {
            return ProjectMember(_member).creation_date;
        }

        [Bindable(Event="memberChanged")]
        public function get customer():OrganizationMember
        {
            return ProjectMember(_member).customer;

        }

        public function set customer(customer:OrganizationMember):void
        {
            ProjectMember(_member).customer = customer;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }

        [Bindable(Event="memberChanged")]
        public function get subprojects():MembersCollection
        {
            return ProjectMember(_member).subprojects;
        }


        public function addSubproject(subproject:SubprojectMember):void
        {
            if(ProjectMember(_member).subprojects == null){
                ProjectMember(_member).subprojects = new MembersCollection();
            }
            ProjectMember(_member).subprojects.addItem(subproject);
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }
    }
}