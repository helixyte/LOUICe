package org.helixyte.louice.modules.containerspecscollection.ui.presenter
{
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    import flash.events.IEventDispatcher;

    public class ContainerSpecsCollectionPresentationModel extends CollectionPresentationModel
    {
        public function ContainerSpecsCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['manufacturer'] = 'manufacturer.name';
        }
    }
}