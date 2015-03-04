package org.helixyte.louice.shared.ui.components.validators
{

    import mx.utils.StringUtil;
    import mx.validators.ValidationResult;
    import mx.validators.Validator;

    /**
     *  The TubeBarcodeValidator class is the base on the Flex Validator class.
     *  It will check the contents of an input field to be numeric 10 diget barcodes.
     *  The validator also allows (per default) a comma separated list of codes.
     *
     */
    public class TubeBarcodeValidator extends Validator
    {





        //10 diget code with
        private static const REG_EXP_FOR_BARCODE:RegExp = /^[0-9]{10}+$/;

        public var allowMultipleBarcodes:Boolean = true;

        public function TubeBarcodeValidator()
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
                    results.push(new ValidationResult(true, null, "", "Invalid tube barcode."));
                }
            } else {

                for each (var barcode:String in text.split(",")){
                    if ( !REG_EXP_FOR_BARCODE.test(StringUtil.trim(barcode)) ){
                        results.push(new ValidationResult(true, null, "", "Invalid barcode."));
                        return results;
                    }
                }
            }

            return results;
        }
    }
}