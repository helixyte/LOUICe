package org.helixyte.louice.modules.experimentmetadatamember.ui.renderer
{
    import org.helixyte.louice.modules.experimentmetadatamember.ui.model.StaticTag;

    import flash.events.Event;

    import spark.components.TextInput;

    public class TagPatternRenderer extends TextInput {


        private var txtSpan:uint = 10;
        private var _tag:*;

        public function set data(d:*):void{

            if (d is StaticTag)
            {
                this.setStyle("font-weight","bold");
            }

            this._tag = d;
            this.text = _tag.predicate;
        }

        [Bindable]
        public function get data():*{
            return _tag;
        }



        public function TagPatternRenderer() {
            super();
            this.addEventListener(Event.CHANGE, onTextChange);
        }

        private function onTextChange(evnt:Event):void {
            _tag.predicate = text;
            this.width = this.autoSizeWidth;
        }

        override protected function commitProperties():void {
            super.commitProperties();
            this.width = this.autoSizeWidth;
            this.validateNow();
        }

        private function get autoSizeWidth():uint {
            var w:uint = this.measureText(this.text).width;
            var retValue:uint = w + txtSpan;

            if( this.minWidth > w + txtSpan )
                retValue = this.minWidth;

            return retValue;
        }
    }
}