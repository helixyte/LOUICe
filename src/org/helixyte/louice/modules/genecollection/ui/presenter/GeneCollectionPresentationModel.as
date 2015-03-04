package org.helixyte.louice.modules.genecollection.ui.presenter
{
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    import flash.events.IEventDispatcher;

    public class GeneCollectionPresentationModel extends CollectionPresentationModel
    {
        public function GeneCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['species'] = 'species.common-name';
        }
    }
}