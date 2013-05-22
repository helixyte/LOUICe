package com.cenix.louice.shared.ui.components.rack
{
    import spark.components.Label;

    public class RackViewLabel extends Label
    {

        public function RackViewLabel(id:String=null)
        {
            super();
            this.id = id;
            this.text = id;
        }

        public override function set id(id:String):void
        {
            super.id = id;
            this.text = id;
        }
    }
}