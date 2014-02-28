package com.cenix.louice.modules.experimentjobmember.ui.presenter
{
    import com.cenix.louice.shared.model.vos.ExperimentJobMember;
    import com.cenix.louice.shared.model.vos.ExperimentMember;
    import com.cenix.louice.shared.model.vos.ExperimentMetaDataMember;
    import com.cenix.louice.shared.model.vos.ExperimentRackMember;
    import com.cenix.louice.shared.model.vos.JobMember;
    import com.cenix.louice.shared.model.vos.PlateMember;
    import com.cenix.louice.shared.model.vos.SubprojectMember;
    import com.cenix.louice.shared.model.vos.UserMember;
    
    import flash.events.Event;
    import flash.events.IEventDispatcher;
    
    import org.everest.flex.events.MemberEvent;
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    public class ExperimentJobMemberPresentationModel extends MemberPresentationModel
    {
        [Bindable]
        public var plateCount:int = 0;

        public function ExperimentJobMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        public override function set member(member:Member):void
        {
            super.member = member;

            var experiments:MembersCollection = ExperimentJobMember(_member).experiments;

            if ((experiments != null)&&(experiments.length > 0))
            {
                plateCount = 0;

                for each (var experiment:ExperimentMember in experiments)
                {
                    plateCount += experiment.experiment_racks.length;
                }

            }
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return JobMember(_member).label;
        }

        [Bindable(Event="memberChanged")]
        public function get subproject():SubprojectMember
        {
            return JobMember(_member).subproject;
        }

        public function set subproject(subproject:SubprojectMember):void
        {
            JobMember(_member).subproject = subproject;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }

        [Bindable(Event="memberChanged")]
        public function get user():UserMember
        {
            return JobMember(_member).user;
        }

        public function set user(user:UserMember):void
        {
            JobMember(_member).user = user;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }

        [Bindable(Event="memberChanged")]
        public function get start_time():Date
        {
            return JobMember(_member).start_time;
        }

        public function set start_time(start_time:Date):void
        {
            JobMember(_member).start_time = start_time;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }

        [Bindable(Event="memberChanged")]
        public function get end_time():Date
        {
            return JobMember(_member).end_time;
        }

        public function set end_time(end_time:Date):void
        {
            JobMember(_member).end_time = end_time;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }


        [Bindable(Event="memberChanged")]
        public function get experimentMetadata():ExperimentMetaDataMember
        {
            if (experiments && experiments.length > 0)
            {
                var experiment:ExperimentMember = experiments[0];
                return experiment.experiment_design.experiment_metadata;
            }

            return null;
        }

        [Bindable(Event="memberChanged")]
        public function get experiments():MembersCollection
        {
            return ExperimentJobMember(_member).experiments;
        }

        public override function submit(member:Member=null, 
                                        processInBackground:Boolean=false,
                                        editMode:String=MemberEvent.EDIT_MODE_REPLACE):void
        {
            trace("- Editing Member using XML\n");
            var m:ExperimentJobMember = ExperimentJobMember(_member);
            for each (var experiment:ExperimentMember in m.experiments)
            {
                for each (var rack:ExperimentRackMember in experiment.experiment_racks)
                {
                    var plate:PlateMember = new PlateMember();
                    plate.label = rack.plate.label;
                    plate.barcode = rack.plate.barcode;
                    plate.creation_date = rack.plate.creation_date;
                    plate.specs = rack.plate.specs;
                    plate.status = rack.plate.status;
                    rack.plate = plate;
                }
            }
            var event:MemberEvent = new MemberEvent(MemberEvent.EDIT_MEMBER);
            event.member = m;
            dispatcher.dispatchEvent(event);
        }
    }
}