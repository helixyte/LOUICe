package com.cenix.louice.modules.isorequestmember.ui.presenters
{
    import com.cenix.louice.shared.model.vos.ExperimentMetaDataMember;
    import com.cenix.louice.shared.model.vos.ExperimentMetaDataTypeMember;
    import com.cenix.louice.shared.model.vos.IsoJobMember;
    import com.cenix.louice.shared.model.vos.IsoMember;
    import com.cenix.louice.shared.model.vos.IsoRequestMember;
    import com.cenix.louice.shared.model.vos.LabIsoMember;
    import com.cenix.louice.shared.model.vos.LabIsoRequestMember;
    import com.cenix.louice.shared.model.vos.RackLayoutMember;
    import com.cenix.louice.shared.model.vos.RackMember;
    import com.cenix.louice.shared.model.vos.RackShapeMember;
    import com.cenix.louice.shared.model.vos.UserMember;
    
    import flash.events.Event;
    import flash.events.IEventDispatcher;
    import flash.net.SharedObject;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    
    import mx.collections.ArrayCollection;
    import mx.core.FlexGlobals;
    
    import spark.collections.Sort;
    import spark.collections.SortField;
    
    import org.everest.flex.events.MemberEvent;
    import org.everest.flex.events.NavigationEvent;
    import org.everest.flex.interfaces.INavigationLink;
    import org.everest.flex.model.Link;
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    public class IsoRequestMemberPresentationModel extends MemberPresentationModel
    {
        [Bindable]
        public var racks:Dictionary = new Dictionary();

        [Bindable]
        public var platesToLoad:int = 0;

        [Bindable]
        public var hasIsos:Boolean = false;

        [Bindable]
        public var acceptEnabled:Boolean = false;

        [Bindable]
        public var generateEnabled:Boolean = false;

        [Bindable]
        public var reopenEnabled:Boolean = false;

        [Bindable]
        public var rackShape:uint;

        [Bindable]
        public var isosLoading:Boolean;

        [Bindable]
        private var _application:Object = FlexGlobals.topLevelApplication;
        
        private var _selectedIsoIndex:int = -1;
        private var _isos:MembersCollection;

        // We need this to remember which ISO was selected on reload.
        private var so:SharedObject = SharedObject.getLocal("LOUICe");

        public function IsoRequestMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        public override function set member(member:Member):void
        {
            super.member = member;
            if (member != null)
            {
                var shape:RackShapeMember = 
                        LabIsoRequestMember(_member).rack_layout.rack_shape;
                rackShape = shape.number_columns * shape.number_rows;
                // Trigger async load of the ISOs.
                var dLink:INavigationLink = isosLink;
                if ((dLink != null)&&(dLink.href != null)) {

                    var dEvt:NavigationEvent = new NavigationEvent(
                        NavigationEvent.LOAD_SUBORDINATE_PAGE);

                    dEvt.pageUrl = dLink.href + "?size=500";
                    dispatcher.dispatchEvent(dEvt);
                    isosLoading = true;
                }
                this.updatePossibleActions();
            }
        }

        public override function set subMembers(members:MembersCollection):void
        {
            isosLoading = false;
            if (members != null)
            {
                this.isos = members;
                if (so.data.hasOwnProperty("selectedIso"))
                {
                    var i:int = 0;
                    for each (var iso:* in isos)
                    {
                        if (iso.title == so.data.selectedIso)
                        {
                            selectedIsoIndex = i;
                            break
                        }
                        i++;
                    }
                }
                dispatchEvent(new Event(Event.CHANGE));
            }
        }

        public override function set subMember(member:Member):void
        {
            isosLoading = false;
            if (member != null)
            {
                if ((member is RackMember)&&(platesToLoad > 0))
                {
                    racks[RackMember(member).barcode] = member;
                    platesToLoad--;
                    dispatchEvent(new MemberEvent(MemberEvent.MEMBER_CHANGED));

                } else if (member is LabIsoMember){
                    var mbs:MembersCollection = new MembersCollection();
                    mbs.addItem(member);
                    subMembers = mbs;
                }
            }
        }

        /**
         * Trigger async load of a rack or plate.
         * @param barcode
         *
         */
        public function loadRack(barcode:String):void
        {
            var rackLink:Link = new Link("a rack to load", "/racks/" + barcode);
            var iEvt:NavigationEvent = 
                    new NavigationEvent(NavigationEvent.LOAD_SUBORDINATE_PAGE);
            iEvt.pageUrl = rackLink.href;
            dispatcher.dispatchEvent(iEvt);
            platesToLoad++;
        }

        public function changeOwner(newOwner:String):void
        {
            this.owner = newOwner;
            var isoReqClone:LabIsoRequestMember = this._member.blank();
            isoReqClone.owner = this.owner;
            submit(isoReqClone);
        }

        public function generateNewIsos(numberOfIsos:int, 
                                        optimizer_excluded_racks:String, 
                                        optimizer_required_racks:String):void
        {
            var newIsos:MembersCollection = new MembersCollection();
            for (var i:int = 0; i < numberOfIsos; i++)
            {
                var iso:LabIsoMember = new LabIsoMember();
                iso.label = "new iso";
                iso.status = "NEW";
                iso.optimizer_excluded_racks = optimizer_excluded_racks;
                iso.optimizer_required_racks = optimizer_required_racks;
                newIsos.addItem(iso);
            }
            LabIsoRequestMember(_member).isos = newIsos;
            var isoReqClone:LabIsoRequestMember = this._member.blank();
            isoReqClone.isos = newIsos;
            submit(isoReqClone);
        }

        public function updateStockRacks(isoOrIsoJob:*, barcode1:String, barcode2:String,
                                         barcode3:String, barcode4:String): void
        {
            var numStockRacks:int = 0;
            if (isoOrIsoJob is IsoJobMember) {
                numStockRacks += IsoJobMember(isoOrIsoJob).number_stock_racks;
            } else {
                numStockRacks += IsoMember(isoOrIsoJob).number_stock_racks;
            }
            var bcString:String = barcode1;
            this.racks = new Dictionary()
            if (numStockRacks > 1) {
                bcString += ";" + barcode2;
            }
            if (numStockRacks > 2) {
                bcString += ";" + barcode3;
            }
            if (numStockRacks > 3) {
                bcString += ";" + barcode4;
            }                    
            var status:String = "UPDATE_STOCK_RACKS"+bcString;
            if (isoOrIsoJob is IsoJobMember) {
                submitIsoJobChange(isoOrIsoJob, status);
            } else {
                submitIsoChange(isoOrIsoJob, status);
            }
        }
        
        public function getXl20WorklistUrl(
            isoOrIsoJob:*, barcode1:String, barcode2:String, barcode3:String, 
            barcode4:String, excludedRacks:String, requiredTubes:String):String 
        {
            var numStockRacks:int = 0;
            var url:String = getSelfLink(isoOrIsoJob);
            url += "/worklists.zip";
            if (isoOrIsoJob is IsoJobMember) {
                numStockRacks += IsoJobMember(isoOrIsoJob).number_stock_racks;
            } else {
                numStockRacks += IsoMember(isoOrIsoJob).number_stock_racks;
            }            
            url += "?type=XL20";
            if (numStockRacks == 1) {
                url += "&rack=" + barcode1;                    
            } else {
                url += "&rack1=" + barcode1;
            }
            if (numStockRacks > 1) {
                url += "&rack2=" + barcode2;    
            }
            if (numStockRacks > 2) {
                url += "&rack3=" + barcode3;    
            }
            if (numStockRacks > 3) {
                url += "&rack4=" + barcode4;
            }
            url += "&optimizer_excluded_racks=" + cleanBarcodes(excludedRacks);
            url += "&optimizer_required_racks=" + cleanBarcodes(requiredTubes);
            if (_application.RELEASE_QUALIFIER != '')
                url += "&include_dummy_output=true";
            return url;
        }
        
        public function getPipettingWorklistUrl(isoOrIsoJob:*):String
        {
            var url:String = getSelfLink(isoOrIsoJob);
            url += "/worklists.zip";
            url += "?type=PIPETTING";
            return url;
        }
        
        public function processXl20OutputData(data:ByteArray):void
        {
			var event:MemberEvent = new MemberEvent(MemberEvent.CREATE_MEMBER_FROM_DATA);
			event.binaryData = data;
			event.contentType = 'text/vnd.biomicrolab.xl20.output';
			event.pageUrl = '/tube-transfer-worklists'; 
			event.responseContentType = 'application/atom+xml';
			dispatcher.dispatchEvent(event);
        }

        public function executePipettingWorklist(isoOrIsoJob:*):void
        {
            var status:String = "PIPETTING";
            if (isoOrIsoJob is IsoJobMember) {
                submitIsoJobChange(isoOrIsoJob, status);    
            } else {
                submitIsoChange(isoOrIsoJob, status);
            }
        }
        
        public function cancelIso(iso:LabIsoMember):void
        {
            submitIsoChange(iso, "CANCEL_ISO");
        }

        public function closeIso(iso:LabIsoMember):void
        {
            submitIsoChange(iso, "CLOSE_ISO");
        }

        public function reopenIso(iso:LabIsoMember):void
        {
            submitIsoChange(iso, "REOPEN_ISO");
        }

        public function copyIso(iso:LabIsoMember, withOptimization:Boolean):void
        {
            submitIsoChange(iso, withOptimization ? 
                "COPY_ISO_WITH_OPTIMIZATION" : "COPY_ISO_WITHOUT_OPTIMIZATION");
        }

        private function submitIsoChange(iso:LabIsoMember, status:String):void
        {
            var isoClone:LabIsoMember = LabIsoMember(iso.blank());
            isoClone.status = status;
            var isoReqClone:LabIsoRequestMember = 
                                LabIsoRequestMember(this._member.blank());
            isoReqClone.isos = new MembersCollection();
            isoReqClone.isos.addItem(isoClone);
            submit(isoReqClone);
        }
        
        private function submitIsoJobChange(isoJob:IsoJobMember, status:String):void
        {
            var isoJobClone:IsoJobMember = IsoJobMember(isoJob.blank());
            isoJobClone.status = status;
            var isoReqClone:LabIsoRequestMember = 
                LabIsoRequestMember(this._member.blank());
            isoReqClone.jobs = new MembersCollection();
            isoReqClone.jobs.addItem(isoJobClone);
            submit(isoReqClone);
        }
        
        [Bindable(Event="memberChanged")]
        public function get iso_type():String
        {
            return LabIsoRequestMember(_member).iso_type;
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return LabIsoRequestMember(_member).label;
        }

        [Bindable(Event="memberChanged")]
        public function get rack_layout():RackLayoutMember
        {
            return LabIsoRequestMember(_member).rack_layout;
        }

        [Bindable(Event="memberChanged")]
        public function set rack_layout(rl:RackLayoutMember):void
        {
            LabIsoRequestMember(_member).rack_layout = rl;
        }

        [Bindable(Event="memberChanged")]
        public function get delivery_date():Date
        {
            return LabIsoRequestMember(_member).delivery_date;
        }

        [Bindable]
        public function get isos():MembersCollection
        {
            return _isos;
        }
        
        public function set isos(isos:MembersCollection):void
        {
            if((isos != null)&&(isos.length > 0))
            {
                this._isos = new MembersCollection();
                this.hasIsos = true;
                var lastJobId:int = 0;
                var iso_sort:SortField = new SortField("sortfield");
                iso_sort.numeric = false;
                var sort:Sort = new Sort();
                sort.fields = [iso_sort];
                isos.sort = sort;
                isos.refresh();
                for each (var iso:* in isos)
                {
                    if (iso is LabIsoMember)
                    {
                        if (iso.iso_job.id != lastJobId)
                        {
                            lastJobId = iso.iso_job.id;
                            this._isos.addItem(iso.iso_job);
                        }
                        this._isos.addItem(iso);
                    }   
                }   
            }
        }
        
        [Bindable(Event="memberChanged")]
        public function get requester():UserMember
        {
            return LabIsoRequestMember(_member).requester;
        }
        
        [Bindable(Event="memberChanged")]
        public function get owner():String
        {
            return LabIsoRequestMember(_member).owner;
        }
        
        [Bindable(Event="memberChanged")]
        public function set owner(newOwner:String):void
        {
            LabIsoRequestMember(_member).owner = newOwner;
        }
        
        [Bindable(Event="memberChanged")]
        public function get expected_number_isos():int
        {
            return LabIsoRequestMember(_member).expected_number_isos;
        }
        
        [Bindable(Event="memberChanged")]
        public function get number_aliquots():int
        {
            return LabIsoRequestMember(_member).number_aliquots;
        }
        
        [Bindable(Event="memberChanged")]
        public function get process_job_first():Boolean
        {
            return LabIsoRequestMember(_member).process_job_first;
        }
        
        [Bindable(Event="memberChanged")]
        public function get ticket_number():uint
        {
            return LabIsoRequestMember(_member).ticket_number;
        }

        [Bindable(Event="memberChanged")]
        public function get experiment_metadata_type():ExperimentMetaDataTypeMember
        {
            return LabIsoRequestMember(_member).experiment_metadata_type;
        }

        [Bindable(Event="memberChanged")]
        public function set experiment_metadata_type(
                new_experiment_metadata_type:ExperimentMetaDataTypeMember):void
        {
            LabIsoRequestMember(_member).experiment_metadata_type = new_experiment_metadata_type;
        }

        [Bindable(Event="memberChanged")]
        public function get experiment_metadata():ExperimentMetaDataMember
        {
            return LabIsoRequestMember(_member).experiment_metadata;
        }
        
        [Bindable(Event="memberChanged")]
        public function get tagPredicates():ArrayCollection
        {
            return LabIsoRequestMember(_member).rack_layout.tagPredicates;
        }

        [Bindable(Event="memberChanged")]
        public function get isosLink():INavigationLink
        {
            return LabIsoRequestMember(_member).isos;
        }
        
        [Bindable]
        public function get selectedIsoIndex():int
        {
            return _selectedIsoIndex;
        }

        public function set selectedIsoIndex(value:int):void
        {
            if (value > -1)
            {
                _selectedIsoIndex = value;
                // Store in shared object and flush (save).
                so.data.selectedIso = isos[value].title;
                so.flush();
            }
        }

        [Bindable(Event="memberChanged")]
        private function updatePossibleActions():void
        {
            this.acceptEnabled = false;
            this.generateEnabled = false;
            this.reopenEnabled = false;
            if ((owner != '') && 
                (FlexGlobals.topLevelApplication.currentUser != null))
            {
                // Determine the actions that are possible.
                var currentUser:String = 
                    FlexGlobals.topLevelApplication.currentUser.directory_user_id;
                if (owner.indexOf(IsoRequestMember.STOCKMANAGEMENT_USER) > -1)
                {
                    if (iso_type == 'LAB' 
                        && owner.indexOf(currentUser) < 0)
                    {
                        this.acceptEnabled = true;
                    } else
                    {
                        this.generateEnabled = true;
                    }

                } else if (owner.indexOf(requester.directory_user_id) > -1) {
                    this.reopenEnabled = true;
                }
            }
        }        
        
        private function cleanBarcodes(barcodes:String):String
        {
            if (barcodes.length < 1)
            {
                return barcodes;
            }
            
            barcodes = barcodes.replace(/ /g, '');
            if (barcodes.charAt(barcodes.length -1) == ',')
            {
                barcodes = barcodes.substr(0, barcodes.length - 1);
            }
            return barcodes;
        }

        private function getSelfLink(isoOrIsoJob:*):String 
        {
            var url:String = '';
            if (isoOrIsoJob is IsoJobMember) {
                // FIXME: Can we use the selfLink here?
                url += "/iso-jobs/" + IsoJobMember(isoOrIsoJob).id;
            } else {
                url += IsoMember(isoOrIsoJob).selfLink;
            }
            return url;
        }

    }
}
