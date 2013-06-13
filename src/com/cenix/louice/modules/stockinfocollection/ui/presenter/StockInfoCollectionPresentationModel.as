package com.cenix.louice.modules.stockinfocollection.ui.presenter
{
    import flash.events.IEventDispatcher;
    
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    public class StockInfoCollectionPresentationModel extends CollectionPresentationModel
    {
        public function StockInfoCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['molecule_design_pool'] = 'molecule-design-pool.id';
            sortFieldNames['molecule_type'] = 'molecule-type.name';
        }
    }
}