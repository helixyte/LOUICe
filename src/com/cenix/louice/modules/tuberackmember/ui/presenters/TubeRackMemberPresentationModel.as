package com.cenix.louice.modules.tuberackmember.ui.presenters
{
    import com.cenix.louice.shared.model.vos.RackShapeMember;
    import com.cenix.louice.shared.model.vos.TubeRackMember;
    import com.cenix.louice.shared.ui.components.rack.RackPositionComperator;
    
    import flash.events.IEventDispatcher;
    
    import org.everest.flex.events.NavigationEvent;
    import org.everest.flex.interfaces.INavigationLink;
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    public class TubeRackMemberPresentationModel extends MemberPresentationModel
    {

        [Bindable]
        public var rackDimension:Array;

        public function TubeRackMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        public override function set member(member:Member):void
        {
            super.member = member;
            if (member != null)
            {
                //trigger async load of the rackshape
                var dLink:INavigationLink = new Member("shape", "/racks/" + barcode + "/shape");
                if ((dLink != null)&&(dLink.href != null)) {

                    var dEvt:NavigationEvent = new NavigationEvent(
                        NavigationEvent.LOAD_SUBORDINATE_PAGE);

                    dEvt.pageUrl = dLink.href;
                    dispatcher.dispatchEvent(dEvt);
                }

            }
        }

        public override function set subMember(member:Member):void
        {
            if (member != null)
            {
                if (member is RackShapeMember)
                {
                    rackDimension = [RackShapeMember(member).number_rows, RackShapeMember(member).number_columns];

                } else {
                    var mbs:MembersCollection = new MembersCollection();
                        mbs.addItem(member);
                    subMembers = mbs;
                }
            }
        }

        [Bindable(Event="memberChanged")]
        public function get barcode():String
        {
            return TubeRackMember(_member).barcode;
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return TubeRackMember(_member).label;
        }

        [Bindable(Event="memberChanged")]
        public function get comment():String
        {
            return TubeRackMember(_member).comment;
        }

        [Bindable(Event="memberChanged")]
        public function get creation_date():Date
        {
            return TubeRackMember(_member).creation_date;
        }

        [Bindable(Event="memberChanged")]
        public function get specs():INavigationLink
        {
            return TubeRackMember(_member).specs;
        }

        [Bindable(Event="memberChanged")]
        public function get location():INavigationLink
        {
            return TubeRackMember(_member).location;
        }

        [Bindable(Event="memberChanged")]
        public function get status():INavigationLink
        {
            return TubeRackMember(_member).status;
        }

        [Bindable(Event="memberChanged")]
        public function get containers():MembersCollection
        {
            var c:MembersCollection = TubeRackMember(_member).containers;

            if (c != null)
            {
                RackPositionComperator.sort(c);
            }

            return c;
        }
    }
}