package org.helixyte.louice.modules.menu.model.vos
{
    [Bindable]
    public class MenuItem
    {
        public var uid:int;
        public var title:String;
        public var description:String;
        public var url:String;
        public var imageUrl:String;
        public var contentType:String;
        public var prefetch:Boolean=true;

        public function MenuItem()
        {
        }

        public function toString() : String
        {
            return String(uid);
        }

    }
}