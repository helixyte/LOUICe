package com.cenix.louice.modules.experimentmetadatamember.ui.model
{
    public class Tag
    {
        public var domain:String;
        public var predicate:String;
        public var value:String;
        public var editable:Boolean = false;

        public function Tag(predicate:String, value:String, editable:Boolean=false)
        {
            this.predicate = predicate;
            this.value  = value;
            this.editable = editable;
        }

    }
}