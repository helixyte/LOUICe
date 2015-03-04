package org.helixyte.louice.modules.rackshapemember.ui.presenters
{
    import org.helixyte.louice.shared.model.vos.RackShapeMember;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    import mx.collections.ArrayCollection;

    public class RackShapeMemberPresentationModel extends MemberPresentationModel
    {
        public function RackShapeMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get label():String
        {
            return RackShapeMember(_member).label;
        }

        [Bindable(Event="memberChanged")]
        public function get number_rows():Number
        {
            return RackShapeMember(_member).number_rows;
        }

        [Bindable(Event="memberChanged")]
        public function get number_columns():Number
        {
            return RackShapeMember(_member).number_columns;
        }
    }
}