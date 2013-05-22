package com.cenix.louice.modules.isorequestcollection.ui.presenter
{
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    import flash.events.IEventDispatcher;

    public class IsoRequestCollectionPresentationModel extends CollectionPresentationModel
    {
        public function IsoRequestCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['experiment_metadata'] = 'experiment_metadata.label';
            sortFieldNames['requester'] = 'requester.username';
        }
    }
}