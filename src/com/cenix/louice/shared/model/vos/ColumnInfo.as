package com.cenix.louice.shared.model.vos
{
    public class ColumnInfo
    {
        public var headerText:String;
        private var _dataField:String;
        private var _labelFunction:Function;

        public function ColumnInfo(headerText:String, dataField:String,
                                   labelFunction:Function)
        {
            this.headerText = headerText;
            _dataField = dataField;
            _labelFunction = labelFunction;
        }

        public function getStringValue(item:Object):String
        {
            var value:String;

            if (_labelFunction != null) {
                value = _labelFunction(item);
            }
            else {
                value = item[_dataField];
            }
            return value;
        }
    }
}