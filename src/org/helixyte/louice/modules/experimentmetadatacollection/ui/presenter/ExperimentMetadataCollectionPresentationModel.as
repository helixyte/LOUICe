package org.helixyte.louice.modules.experimentmetadatacollection.ui.presenter
{
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    import flash.events.IEventDispatcher;

    public class ExperimentMetadataCollectionPresentationModel extends CollectionPresentationModel
    {
        public function ExperimentMetadataCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['subproject'] = 'subproject.label';
            sortFieldNames['molecule_design_pool_set'] = 'molecule-design-pool-set.id';
            sortFieldNames['experiment_design'] = 'experiment-design.label';
            sortFieldNames['iso_request'] = 'iso_request.id';
        }
    }
}