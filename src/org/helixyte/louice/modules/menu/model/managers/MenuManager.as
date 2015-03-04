package org.helixyte.louice.modules.menu.model.managers
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;
    
    import mx.collections.ArrayCollection;

    public class MenuManager extends EventDispatcher
    {
        private var _menuItems:ArrayCollection = new ArrayCollection();
        private var _dispatcher:IEventDispatcher;

        public function MenuManager()
        {
        }

        public function loadMenuItems(items:Array):void
        {
            _menuItems = new ArrayCollection(items);
            dispatchEvent(new Event("menuItemsChanged"));
        }

        [Bindable(Event="menuItemsChanged")]
        public function get menuItems():ArrayCollection
        {
            return _menuItems;
        }
    }
}