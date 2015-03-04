package org.helixyte.louice.modules.locationcollection.ui.presenters
{
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    import flash.events.IEventDispatcher;

    public class LocationCollectionPresentationModel extends CollectionPresentationModel
    {

        public function LocationCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['device'] = 'device.label';
            sortFieldNames['rack'] = 'rack.label';
        }
    }
}