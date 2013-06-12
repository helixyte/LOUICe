package com.cenix.louice.modules.isorequestmember.ui.presenters
{
    import com.cenix.louice.shared.model.vos.ExperimentMetaDataMember;
    import com.cenix.louice.shared.model.vos.ExperimentMetaDataTypeMember;
    import com.cenix.louice.shared.model.vos.IsoJobMember;
    import com.cenix.louice.shared.model.vos.IsoMember;
    import com.cenix.louice.shared.model.vos.IsoRequestMember;
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

        private var _selectedIsoIndex:int;
        private var _isos:MembersCollection;

        //we need this to remember after reload which iso was selected
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
                var shape:RackShapeMember = IsoRequestMember(_member).rack_layout.rack_shape;
                rackShape = shape.number_columns * shape.number_rows;
                // Trigger async load of the isos.
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

                } else if (member is IsoMember){
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
            owner = newOwner;
            IsoRequestMember(_member).isos = null;
            IsoRequestMember(_member).rack_layout = null; // We do not need to send all that again.
            submit();
        }

        public function generateNewIsos(numberOfIsos:int, 
                                        optimizer_excluded_racks:String, 
                                        optimizer_required_racks:String):void
        {
            var newIsos:MembersCollection = new MembersCollection();

            for (var i:int = 0; i < numberOfIsos; i++)
            {
                var iso:IsoMember = new IsoMember();
                    iso.label = "new iso";
                    iso.status = "NEW";
                    iso.optimizer_excluded_racks = optimizer_excluded_racks;
                    iso.optimizer_required_racks = optimizer_required_racks;
                newIsos.addItem(iso);
            }

            IsoRequestMember(_member).isos = newIsos;
            IsoRequestMember(_member).rack_layout = null; //We do not need to send all that again.
            submit();
        }

//        public function verifyStockRacks(iso:IsoMember):void
//        {
//            iso.iso_request = null;
//            iso.status = "VERIFY";
//            var iso_request:IsoRequestMember = IsoRequestMember(_member);
//                iso_request.isos = new MembersCollection();
//                iso_request.isos.addItem(iso);
//
//            submit();
//        }

        public function updateControlStockRack(isoJob:IsoJobMember, barcode:String):void
        {
            //need to find one parent iso
            for each (var iso:* in isos)
            {
                if ((iso is IsoMember) && (iso.iso_job.id == isoJob.id))
                {
                    submitIsoChange(iso, "UPDATE_CONTROL_STOCK_RACK"+barcode);
                    break;
                }
            }
        }

        public function transferControlStockInDB(isoJob:IsoJobMember):void
        {
            //need to find one parent iso
            for each (var iso:* in isos)
            {
                if ((iso is IsoMember) && (iso.iso_job.id == isoJob.id))
                {
                    // transfer the stock in the database
                    submitIsoChange(iso,"TRANSFER_CONTROL_STOCK");
                    break;
                }
            }
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

        public function transferStockInDB(iso:IsoMember):void
        {
            submitIsoChange(iso, "TRANSFER_STOCK");
        }
        

        public function transferToIsoInDB(iso:IsoMember):void
        {
            // verify and save the stock rack
            submitIsoChange(iso, "TRANSFER_TO_ISO");
        }

        public function transferToAliquotInDB(iso:IsoMember, barcode:String):void
        {
            submitIsoChange(iso, "TRANSFER_TO_ADD_ALIQUOT"+barcode);
        }

        public function cancelIso(iso:IsoMember):void
        {
            submitIsoChange(iso, "CANCEL_ISO");
        }

        public function closeIso(iso:IsoMember):void
        {
            submitIsoChange(iso, "CLOSE_ISO");
        }

        public function reopenIso(iso:IsoMember):void
        {
            submitIsoChange(iso, "REOPEN_ISO");
        }

        public function addAliquotePlate(iso:IsoMember):void
        {
            submitIsoChange(iso, "ADD_ALIQUOT");
        }

        public function copyIso(iso:IsoMember, withOptimization:Boolean):void
        {
            submitIsoChange(iso, withOptimization ? 
                "COPY_ISO_WITH_OPTIMIZATION" : "COPY_ISO_WITHOUT_OPTIMIZATION");
        }

        private function submitIsoChange(iso:IsoMember, status:String):void
        {
            // We only need to send a lightweight clone to the server.
            var isoClone:IsoMember = new IsoMember();
            isoClone.id = iso.id;
            isoClone.label = iso.label;
            isoClone.status = status;
            var isoReqClone:IsoRequestMember = new IsoRequestMember();
            isoReqClone.id = _member.id;
            isoReqClone.selfLink = IsoRequestMember(_member).selfLink;
            isoReqClone.iso_type = IsoRequestMember(_member).iso_type;
            isoReqClone.plate_set_label = IsoRequestMember(_member).plate_set_label;
            isoReqClone.requester = IsoRequestMember(_member).requester;
            isoReqClone.isos = new MembersCollection();
			isoReqClone.ticket_number = IsoRequestMember(_member).ticket_number
			isoReqClone.owner = IsoRequestMember(_member).owner
            isoReqClone.isos.addItem(isoClone);
            submit(isoReqClone);
        }
        
        [Bindable(Event="memberChanged")]
        public function get iso_type():String
        {
            return IsoRequestMember(_member).iso_type;
        }

        [Bindable(Event="memberChanged")]
        public function get plate_set_label():String
        {
            return IsoRequestMember(_member).plate_set_label;
        }

        [Bindable(Event="memberChanged")]
        public function get rack_layout():RackLayoutMember
        {
            return IsoRequestMember(_member).rack_layout;
        }

        [Bindable(Event="memberChanged")]
        public function set rack_layout(rl:RackLayoutMember):void
        {
            IsoRequestMember(_member).rack_layout = rl;
        }

        [Bindable(Event="memberChanged")]
        public function get delivery_date():Date
        {
            return IsoRequestMember(_member).delivery_date;
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
                    if (iso is IsoMember)
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
            return IsoRequestMember(_member).requester;
        }
        
        [Bindable(Event="memberChanged")]
        public function get owner():String
        {
            return IsoRequestMember(_member).owner;
        }
        
        [Bindable(Event="memberChanged")]
        public function set owner(newOwner:String):void
        {
            IsoRequestMember(_member).owner = newOwner;
        }
        
        [Bindable(Event="memberChanged")]
        public function get number_plates():int
        {
            return IsoRequestMember(_member).number_plates;
        }
        
        [Bindable(Event="memberChanged")]
        public function get number_aliquots():int
        {
            return IsoRequestMember(_member).number_aliquots;
        }
        
        [Bindable(Event="memberChanged")]
        public function get ticket_number():uint
        {
            return IsoRequestMember(_member).ticket_number;
        }

        [Bindable(Event="memberChanged")]
        public function get experiment_metadata_type():ExperimentMetaDataTypeMember
        {
            return IsoRequestMember(_member).experiment_metadata_type;
        }

        [Bindable(Event="memberChanged")]
        public function set experiment_metadata_type(new_experiment_metadata_type:ExperimentMetaDataTypeMember):void
        {
            IsoRequestMember(_member).experiment_metadata_type = new_experiment_metadata_type;
        }

        [Bindable(Event="memberChanged")]
        public function get experiment_metadata():ExperimentMetaDataMember
        {
            return IsoRequestMember(_member).experiment_metadata;
        }
        
        [Bindable(Event="memberChanged")]
        public function get tagPredicates():ArrayCollection
        {
            return IsoRequestMember(_member).rack_layout.tagPredicates;
        }

        [Bindable(Event="memberChanged")]
        public function get isosLink():INavigationLink
        {
            return IsoRequestMember(_member).isos;
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

                so.data.selectedIso = isos[value].title;
                so.flush(); // flush saves the data
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
                //determine the actions that are possible
                var currentUser:String = 
                    FlexGlobals.topLevelApplication.currentUser.directory_user_id;

                if (owner.indexOf(IsoRequestMember.STOCKMANAGEMENT_USER) > -1)
                {
                    if (iso_type == 'STANDARD' 
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
    }
}