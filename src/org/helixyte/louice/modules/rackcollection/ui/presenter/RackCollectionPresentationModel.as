package org.helixyte.louice.modules.rackcollection.ui.presenter
{
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    import flash.events.IEventDispatcher;

    public class RackCollectionPresentationModel extends CollectionPresentationModel
    {
        public function RackCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['specs'] = 'specs.label';
            sortFieldNames['location'] = 'location.name';
            sortFieldNames['status'] = 'status.name';
        }
    }
}