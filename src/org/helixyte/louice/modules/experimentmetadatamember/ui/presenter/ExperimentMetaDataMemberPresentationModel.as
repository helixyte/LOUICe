package org.helixyte.louice.modules.experimentmetadatamember.ui.presenter
{
    import com.adobe.utils.DictionaryUtil;
    import org.helixyte.louice.shared.model.vos.ExperimentDesignMember;
    import org.helixyte.louice.shared.model.vos.ExperimentDesignRackMember;
    import org.helixyte.louice.shared.model.vos.ExperimentMember;
    import org.helixyte.louice.shared.model.vos.ExperimentMetaDataMember;
    import org.helixyte.louice.shared.model.vos.ExperimentMetaDataTypeMember;
    import org.helixyte.louice.shared.model.vos.JobMember;
    import org.helixyte.louice.shared.model.vos.LabIsoRequestMember;
    import org.helixyte.louice.shared.model.vos.RackLayoutMember;
    import org.helixyte.louice.shared.model.vos.SubprojectMember;
    import org.helixyte.louice.shared.model.vos.TagMember;
    import org.helixyte.louice.shared.model.vos.TagPredicate;
    
    import flash.events.Event;
    import flash.events.IEventDispatcher;
    import flash.utils.Dictionary;
    
    import mx.collections.ArrayCollection;
    import mx.collections.Sort;
    
    import spark.collections.SortField;
    
    import org.everest.flex.events.MemberEvent;
    import org.everest.flex.events.NavigationEvent;
    import org.everest.flex.interfaces.INavigationLink;
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;
    import org.everest.flex.utils.HashSet;

    public class ExperimentMetaDataMemberPresentationModel extends MemberPresentationModel
    {

        [Bindable]
        public var tagPredicates:ArrayCollection;

        [Bindable]
        public var experimentJobs:ArrayCollection = new ArrayCollection();

        public function ExperimentMetaDataMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        public override function set member(member:Member):void
        {
            super.member = member;
            // Extract jobs for the experiment job view.
            if (member != null)
            {
                // Trigger asynchronous load of all tags and values.
                var dEvt:NavigationEvent = 
                    new NavigationEvent(NavigationEvent.LOAD_SUBORDINATE_PAGE);
                dEvt.pageUrl = member.selfLink + 'tags?size=1000';
                dispatcher.dispatchEvent(dEvt);
            }            
            var experimentDesign:ExperimentDesignMember = experimentDesign;
            if ((experimentDesign != null) 
                && (experimentDesign.experiments != null) 
                && (experimentDesign.experiments.length > 0))
            {
                var dejavue:HashSet = new HashSet();
                experimentJobs.removeAll();
                for each (var experiment:ExperimentMember in experimentDesign.experiments)
                {
                    var job:JobMember = experiment.experiment_job;
                    if((job != null) && (!dejavue.has(job.id)))
                    {
                        dejavue.add(job.id);
                        experimentJobs.addItem(job);
                    }
                }
                experimentJobs.refresh();
            }
        }

        public function get selfLink():String
        {
            return _member.selfLink;
        }

        public function loadExperimentDesignRack(rack:ExperimentDesignRackMember):void
        {
            var dEvt:NavigationEvent = 
                new NavigationEvent(NavigationEvent.LOAD_SUBORDINATE_PAGE);

            dEvt.pageUrl = rack.rack_layout.href;
            dispatcher.dispatchEvent(dEvt);
        }

        public function deleteJob(job:JobMember):void
        {
            trace("- Delete job: " + job.selfLink);
            job.selfLink = '/experiment-jobs/' + job.id
            var event:MemberEvent;
            event = new MemberEvent(MemberEvent.DELETE_MEMBER);
            event.member = job;
            dispatcher.dispatchEvent(event);
        }

        public function createJob(job:JobMember):void
        {
            trace("- Create Job ");
            var event:MemberEvent = new MemberEvent(MemberEvent.CREATE_MEMBER);
            event.pageUrl = '/experiment-jobs';
            event.member = job;
            dispatcher.dispatchEvent(event);
        }
        
        public function reset():void
        {
            ExperimentMetaDataMember(_member).experiment_design = null;
            ExperimentMetaDataMember(_member).molecule_design_pool_set = null;
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return ExperimentMetaDataMember(_member).label;
        }

        public function set label(label:String):void
        {
            ExperimentMetaDataMember(_member).label = label;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }
        
        [Bindable(Event="memberChanged")]
        public function get ticketNumber():int
        {
            return ExperimentMetaDataMember(_member).ticket_number;
        }

        [Bindable(Event="memberChanged")]
        public function get subproject():SubprojectMember
        {
            return ExperimentMetaDataMember(_member).subproject;
        }

        public function set subproject(subproject:SubprojectMember):void
        {
            ExperimentMetaDataMember(_member).subproject = subproject;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }

        [Bindable(Event="memberChanged")]
        public function get experimentDesign():ExperimentDesignMember
        {
            return ExperimentMetaDataMember(_member).experiment_design;
        }
        
        public function set experimentDesign(experiment_design:ExperimentDesignMember):void
        {
            ExperimentMetaDataMember(_member).experiment_design = experiment_design;
        }

        [Bindable(Event="memberChanged")]
        public function get molecule_design_pool_set():INavigationLink
        {
            return ExperimentMetaDataMember(_member).molecule_design_pool_set;
        }
        
        [Bindable(Event="memberChanged")]
        public function get iso_request():LabIsoRequestMember
        {
            return ExperimentMetaDataMember(_member).lab_iso_request;
        }

        public function set iso_request(iso_request:LabIsoRequestMember):void
        {
            ExperimentMetaDataMember(_member).lab_iso_request = iso_request;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }

        public override function set subMember(member:Member):void
        {
            if (member != null)
            {
                if (member is RackLayoutMember)
                {
                    var layout:RackLayoutMember = RackLayoutMember(member);
                    experimentDesign.updateExperimentDesignRackLayout(layout);
                }
            }
        }

        public override function set subMembers(tags:MembersCollection):void
        {
            if (tags != null)
            {
                var predicateMap:Dictionary = new Dictionary();

                for each (var tag:* in tags)
                {
                    if (!(tag is TagMember))
                    {
                        return;
                    }

                    if (predicateMap[tag.predicate] == null)
                    {
                        predicateMap[tag.predicate] = new TagPredicate(tag);
                    }
                    else
                    {
                        predicateMap[tag.predicate].addValue(tag.value);
                    }
                }

                this.tagPredicates = new ArrayCollection(DictionaryUtil.getValues(predicateMap));
                // Sort by label.
                var sortfield:SortField = new SortField("label");
                var sort:Sort = new Sort();
                sort.fields = [sortfield];
                this.tagPredicates.sort = sort;
                this.tagPredicates.refresh();
            }
        }

        [Bindable(Event="memberChanged")]
        public function get creation_date():Date
        {
            return ExperimentMetaDataMember(_member).creation_date;
        }

        [Bindable(Event="memberChanged")]
        public function get number_replicates():uint
        {
            return ExperimentMetaDataMember(_member).number_replicates;
        }

        public function set number_replicates(number_replicates:uint):void
        {
            ExperimentMetaDataMember(_member).number_replicates = number_replicates;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }

        [Bindable(Event="memberChanged")]
        public function get experiment_metadata_type():ExperimentMetaDataTypeMember
        {
            return ExperimentMetaDataMember(_member).experiment_metadata_type;
        }

        public function set experiment_metadata_type(experiment_metadata_type:ExperimentMetaDataTypeMember):void
        {
            ExperimentMetaDataMember(_member).experiment_metadata_type = experiment_metadata_type;
            dispatchEvent(new Event(MemberEvent.MEMBER_CHANGED));
        }
		
		[Bindable(Event="memberChanged")]
		public function get hasCompletedIsoRequest():Boolean 
		{
			if (_member == null) {
				return false;
			}			
			var isoRequest:LabIsoRequestMember = ExperimentMetaDataMember(_member).lab_iso_request;
			var owner:String = isoRequest.owner;
			if (owner == null) {
				return false;
			}
			return (owner == isoRequest.requester.directory_user_id);
		}
    }
}
