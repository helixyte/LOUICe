package org.helixyte.louice.modules.tubecollection.ui.presenter
{
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    import flash.events.IEventDispatcher;

    public class TubeCollectionPresentationModel extends CollectionPresentationModel
    {
        public function TubeCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['tube_rack'] = 'rack.barcode';
            sortFieldNames['location'] = 'rack.location.name';
            sortFieldNames['concentration'] = 'sample_molecules.concentration';
            sortFieldNames['itemstatus'] = 'status.name';
//            sortFieldNames['position'] = 'location.row AND location.col';
        }
    }
}