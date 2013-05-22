package com.cenix.louice.modules.stockinfomember.ui.presenters
{
    import com.cenix.louice.shared.model.vos.MoleculeDesignPoolMember;
    import com.cenix.louice.shared.model.vos.MoleculeTypeMember;
    import com.cenix.louice.shared.model.vos.StockInfoMember;
    
    import flash.events.IEventDispatcher;
    
    import org.everest.flex.model.MembersCollection;
    import org.everest.flex.ui.presenters.MemberPresentationModel;

    public class StockInfoMemberPresentationModel extends MemberPresentationModel
    {
        public function StockInfoMemberPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }

        [Bindable(Event="memberChanged")]
        public function get identifier():String
        {
            return StockInfoMember(_member).id;
        }

		[Bindable(Event="memberChanged")]
		public function get molecule_design_pool_id():int
		{
			return StockInfoMember(_member).molecule_design_pool_id;
		}
		
        [Bindable(Event="memberChanged")]
        public function get molecule_design_pool():MoleculeDesignPoolMember
        {
            return StockInfoMember(_member).molecule_design_pool;
        }

        [Bindable(Event="memberChanged")]
        public function get molecule_type():MoleculeTypeMember
        {
            return StockInfoMember(_member).molecule_type;
        }

        [Bindable(Event="memberChanged")]
        public function get total_tubes():int
        {
            return StockInfoMember(_member).total_tubes;
        }

        [Bindable(Event="memberChanged")]
        public function get totalVolume():Number
        {
            return StockInfoMember(_member).total_volume;
        }

        [Bindable(Event="memberChanged")]
        public function get minimumVolume():Number
        {
            return StockInfoMember(_member).minimum_volume;
        }

        [Bindable(Event="memberChanged")]
        public function get maximumVolume():Number
        {
            return StockInfoMember(_member).maximum_volume;
        }

        [Bindable(Event="memberChanged")]
        public function get concentration():Number
        {
            return StockInfoMember(_member).concentration;
        }

        [Bindable(Event="memberChanged")]
        public function get genes():MembersCollection{
            return StockInfoMember(_member).genes;
        }

//        [Bindable(Event="memberChanged")]
//        public function get genes():ArrayCollection
//        {
//            // FIXME: may be _member.genes should be an Array and not a string
//            var data:Array = [];
//            for each (var gene:String in StockInfoMember(_member).genes.split(",")) {
//                data.push(StringUtil.trim(gene));
//            }
//            return new ArrayCollection(data);
//        }
    }
}