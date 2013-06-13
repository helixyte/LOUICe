package com.cenix.louice.modules.moleculedesignpoolcollection.ui.presenter
{    
    import flash.events.IEventDispatcher;
    
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    public class MoleculeDesignPoolCollectionPresentationModel extends CollectionPresentationModel
    {
        public function MoleculeDesignPoolCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['molecule_type'] = 'molecule-type.name';
        }		
    }
}