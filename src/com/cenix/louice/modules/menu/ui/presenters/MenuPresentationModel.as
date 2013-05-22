package com.cenix.louice.modules.menu.ui.presenters
{
    import com.cenix.louice.modules.menu.model.vos.MenuItem;
    import org.everest.flex.events.MemberEvent;
    import org.everest.flex.events.NavigationEvent;
    import org.everest.flex.model.ResourceState;
    import com.cenix.louice.shared.model.vos.UserMember;
    
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;
    import flash.utils.Dictionary;
    
    import mx.collections.ArrayCollection;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import mx.core.FlexGlobals;
    import mx.events.CollectionEvent;

    public class MenuPresentationModel extends EventDispatcher
    {
        [Bindable]
        public var selectedItem:MenuItem;

        [Bindable]
        public var filteredMenuItems:ArrayCollection = new ArrayCollection();

        private var _sort:Sort;

        private var _dispatcher:IEventDispatcher;
        private var _menuItems:Dictionary;
        private var _viewState:String = ResourceState.PENDING_REQUEST;

        public function MenuPresentationModel(dispatcher:IEventDispatcher)
        {
            _dispatcher = dispatcher;
        }

        public function set currentUser(currentUser:UserMember):void
        {
            if (currentUser != null)
            {
                //get the filtered items from the user preferences
                filteredMenuItems = deserializeFilteredMenuItems(currentUser);
                filteredMenuItems.sort = getSort();
                filteredMenuItems.refresh();
                filteredMenuItems.addEventListener(CollectionEvent.COLLECTION_CHANGE, serializeFilteredMenuItems);
                dispatchEvent(new Event("menuChanged"));
            }
        }

        public function loadPage(menuItem:MenuItem):void
        {
            if (menuItem != null) {

                var event:NavigationEvent

                if (menuItem.prefetch)
                {
                    event = new NavigationEvent(NavigationEvent.LOAD_PAGE);
                    event.pageUrl = menuItem.url;

                } else {
                    event = new NavigationEvent(NavigationEvent.LOAD_MODULE);
                    event.contentType = menuItem.contentType;
                    event.pageUrl = menuItem.url;
                }
                _dispatcher.dispatchEvent(event);
                selectedItem = null;
                updateViewState(ResourceState.PENDING_RESPONSE);
            }
        }

        [Bindable(event="viewStateChanged")]
        public function get viewState():String
        {
            return _viewState;
        }

        public function updateViewState(state:String):void
        {
            if (_viewState != state)
            {
                _viewState = state;
                dispatchEvent(new Event("viewStateChanged"));
            }
        }

        [Bindable(Event="menuChanged")]
        public function get menuItems():ArrayCollection
        {
            var res:ArrayCollection = new ArrayCollection();

            for each (var item:MenuItem in _menuItems)
            {
                var isFiltered:Boolean = false;
                for each (var filteredItem:MenuItem in filteredMenuItems)
                {
                    if (filteredItem.uid == item.uid)
                    {
                        isFiltered = true;
                        break;
                    }
                }

                if(!isFiltered)
                {
                    res.addItem(item);
                }
            }

            res.sort = getSort();
            res.refresh();

            return res;
        }

        private function getSort():Sort
        {
            if (_sort == null)
            {
                var sortField:SortField = new SortField();
                sortField.name = "title";

                _sort = new Sort();
                _sort.fields = [sortField];
            }

            return _sort;
        }

        public function set menuItems(items:ArrayCollection):void
        {

            if ((items != null)&&(items.length > 0))
            {
                _menuItems = new Dictionary();

                for each (var item:MenuItem in items)
                {
                    _menuItems[item.uid]=item;
                }

                dispatchEvent(new Event("menuChanged"));
                currentUser = FlexGlobals.topLevelApplication.currentUser;
            }

        }

        private function submitUser():void
        {
            var event:MemberEvent = new MemberEvent(MemberEvent.EDIT_MEMBER_IN_BACKGROUND);
                event.member = FlexGlobals.topLevelApplication.currentUser;
            _dispatcher.dispatchEvent(event);
        }

        private function serializeFilteredMenuItems(event:Event):void
        {
            //serialize and save the change in the preferences
            var itemIds:Array = new Array();

            for each (var item:MenuItem in filteredMenuItems)
            {
                itemIds.push(item.uid);
            }

            FlexGlobals.topLevelApplication.currentUser.filteredMenuIdList = itemIds;
            submitUser(); //save changes on the server

        }

        private function deserializeFilteredMenuItems(currentUser:UserMember):ArrayCollection
        {

            var itemIds:Array = currentUser.filteredMenuIdList;
            var res:ArrayCollection = new ArrayCollection();
            if ((itemIds != null)&&(_menuItems != null))
            {
                for each (var uid:String in itemIds)
                {
                   res.addItem(_menuItems[uid]);
                }
            }

            return res;
        }
    }
}