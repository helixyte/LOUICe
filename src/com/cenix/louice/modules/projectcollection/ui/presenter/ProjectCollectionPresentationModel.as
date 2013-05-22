package com.cenix.louice.modules.projectcollection.ui.presenter
{
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    import flash.events.IEventDispatcher;

    import mx.collections.ArrayCollection;

    public class ProjectCollectionPresentationModel extends CollectionPresentationModel
    {
        public function ProjectCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
            sortFieldNames['leader'] = 'leader.username';
            sortFieldNames['customer'] = 'customer.name';
        }

        public var hideInactive:Boolean = true;

        [Bindable(CollectionEvent="membersChanged")]
        public override function get members():ArrayCollection
        {
            var result:ArrayCollection = super.members;
            result.filterFunction=inactiveProjectFilterFunction;
            result.refresh();
            return result;
        }

        public function inactiveProjectFilterFunction(item:Object):Boolean
        {

            if ((!item.active) && (hideInactive))
            {
                return false;
            }

            return true;
        }

    }
}