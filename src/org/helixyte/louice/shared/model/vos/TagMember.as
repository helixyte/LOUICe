package org.helixyte.louice.shared.model.vos
{
    import org.as3commons.lang.StringUtils;
    import org.everest.flex.model.Member;

    public class TagMember extends Member
    {
        public var domain:String;
        public var predicate:String;
        private var _value:String;
        private var _label:String;

        public function TagMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public override function toString():String
        {
            return predicate;
        }

        public function get label():String
        {
            if (_label == null)
            {
                //beautify this a bit
                this._label = this.predicate.split("_").join(" ");
                this._label = StringUtils.capitalize(this._label);

				//FIXME: This is horrible.
                //add nano molar unit if this is a concentration
                if (this._label.indexOf('concentration') > -1)
                {
                    this._label += " (nM)";
                }
            }
            return _label;
        }

        public function set label(value:String):void
        {
            _label = value;
        }

        public function get value():String
        {
            return _value;
        }

        public function set value(value:String):void
        {
			//FIXME: This is horrible.
            if (StringUtils.startsWith(value, 'md_'))
            {
                value = 'Sample';
            }

            _value = value;
        }


    }
}