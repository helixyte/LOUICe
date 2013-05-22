package com.cenix.louice.modules.genemember.ui.presenters
{
    import org.everest.flex.interfaces.INavigationLink;
    import com.cenix.louice.shared.model.vos.GeneMember;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    import mx.collections.ArrayCollection;

    public class GeneMemberPresentationModel extends MemberPresentationModel
    {
        public function GeneMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get accession():String
        {
            return GeneMember(_member).accession;
        }

        [Bindable(Event="memberChanged")]
        public function get name():String
        {
            return GeneMember(_member).locus_name;
        }

        [Bindable(Event="memberChanged")]
        public function get species():INavigationLink
        {
            return GeneMember(_member).species;
        }

        [Bindable(Event="memberChanged")]
        public function get moleculeDesigns():INavigationLink
        {
            return GeneMember(_member).molecule_designs;
        }
    }
}