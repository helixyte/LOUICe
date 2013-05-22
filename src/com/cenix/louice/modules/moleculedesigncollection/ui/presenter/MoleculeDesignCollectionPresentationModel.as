package com.cenix.louice.modules.moleculedesigncollection.ui.presenter
{
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    import flash.events.IEventDispatcher;

    public class MoleculeDesignCollectionPresentationModel extends CollectionPresentationModel
    {
        public function MoleculeDesignCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['molecule_type'] = 'molecule-type.name';
        }
    }
}