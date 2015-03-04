package org.helixyte.louice.modules.tuberackcollection.ui.presenter
{
    import flash.events.IEventDispatcher;
    
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    public class TubeRackCollectionPresentationModel extends CollectionPresentationModel
    {
        public function TubeRackCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['specs'] = 'specs.label';
            sortFieldNames['location'] = 'location.name';
            sortFieldNames['status'] = 'status.name';
        }
		
    }
}