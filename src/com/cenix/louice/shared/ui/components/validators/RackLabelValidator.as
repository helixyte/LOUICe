package com.cenix.louice.shared.ui.components.validators
{
    import mx.validators.ValidationResult;
    import mx.validators.Validator;

    /**
     *  The Barcode Label InputValidator class is the base on the Flex Validator class.
     *  It will check the contents of an input field to be no longer than 20 characters.
     *  The validator also allows (per default) a comma separated list of labels.
     *
     */
    public class RackLabelValidator extends Validator
    {

        public var allowMultipleBarcodes:Boolean = true;

        [Bindable]
        public var maximumCharacters:int = 22;

        public function RackLabelValidator()
        {
            super();
        }


        override protected function doValidation(value:Object):Array
        {
            var results:Array = super.doValidation(value);
            if (results.length > 0) return results;

            var text:String =  String(value);

            if (!value && !required)
            {
                return results;
            }

            if (!allowMultipleBarcodes)
            {
                if ( text.length > maximumCharacters ){
                    results.push(new ValidationResult(true, null, "", "Label too long. Maximum is " + maximumCharacters + "."));
                }
            } else {
                var msg:Array =[];
                var i:int = 1;
                for each (var label:String in text.split(",")){
                    if ( label.length > maximumCharacters ){
                        msg.push(i);
                    }
                    i++;
                }
                if(msg.length > 0){
                    results.push(new ValidationResult(true, null, "", "Label " + msg.join(", ") + " is too long.\n Maximum is " + maximumCharacters + "." ));
                }
            }

            return results;
        }
    }
}