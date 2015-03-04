package org.helixyte.louice.modules.platecollection.ui.presenter
{
    import flash.events.IEventDispatcher;
    
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    public class PlateCollectionPresentationModel extends CollectionPresentationModel
    {
        public function PlateCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['specs'] = 'specs.label';
            sortFieldNames['location'] = 'location.name';
            sortFieldNames['status'] = 'status.name';
        }
		
    }
}