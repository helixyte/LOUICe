package org.helixyte.louice.shared.ui.components.validators
{
    import mx.validators.ValidationResult;
    import mx.validators.Validator;

    /**
     *  The BarcodeInputValidator class is the base on the Flex Validator class.
     *  It will check the contents of an input field to be numeric 8 diget barcodes
     *  with a leading 0.
     *  The validator also allows (per default) a comma separated list of codes.
     *
     */
    public class RackBarcodeValidator extends Validator
    {
        // 7 digit code with a leading zero e.g.003962897
        protected static const REG_EXP_FOR_BARCODE:RegExp = /[0]{1}[0-9]{7}$/;

        public var allowMultipleBarcodes:Boolean = true;

        public function RackBarcodeValidator()
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
                if ( !REG_EXP_FOR_BARCODE.test(text) ){
                    results.push(new ValidationResult(true, null, "", "Invalid barcode."));
                }
            } else {

                for each (var barcode:String in text.split(",")){
                    if ( !REG_EXP_FOR_BARCODE.test(barcode) ){
                        results.push(new ValidationResult(true, null, "", "Invalid barcode."));
                        return results;
                    }
                }
            }

            return results;
        }
    }
}