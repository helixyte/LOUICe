package com.cenix.louice.modules.speciesmember.ui.presenters
{
    import org.everest.flex.interfaces.INavigationLink;
    import org.everest.flex.model.Link;
    import com.cenix.louice.shared.model.vos.SpeciesMember;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    import flash.events.IEventDispatcher;

    public class SpeciesMemberPresentationModel extends MemberPresentationModel
    {
        public function SpeciesMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get genus_name():String
        {
            return SpeciesMember(_member).genus_name;
        }

        [Bindable(Event="memberChanged")]
        public function get species_name():String
        {
            return SpeciesMember(_member).species_name;
        }

        [Bindable(Event="memberChanged")]
        public function get common_name():String
        {
            return SpeciesMember(_member).common_name;
        }

        [Bindable(Event="memberChanged")]
        public function get acronym():String
        {
            return SpeciesMember(_member).acronym;
        }

        [Bindable(Event="memberChanged")]
        public function get ncbi_tax_id():String
        {
            return SpeciesMember(_member).ncbi_tax_id;
        }

        [Bindable(Event="memberChanged")]
        public function get genes():INavigationLink
        {
            return new Link('Genes','/genes/?q=species:equal-to:' + _member.selfLink);
        }

    }
}