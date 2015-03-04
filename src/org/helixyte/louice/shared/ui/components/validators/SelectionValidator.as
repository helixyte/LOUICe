package org.helixyte.louice.shared.ui.components.validators
{
    import mx.validators.ValidationResult;
    import mx.validators.Validator;

    /**
     * A simple validator to check if a value from a list is selected.
     * The validator checks if the selectedIndex > -1.
     * To be used with ComboBox or similar components.
     *
     * @author rothe
     */
    public class SelectionValidator extends Validator
    {

            [Inspectable]
            public var acceptedValues:Array = null;

            [Inspectable]
            public var rejectedValues:Array = null;

            [Inspectable]
            public var errorMessage:String = "a selection is required";

            public function SelectionValidator()
            {
                super();
                super.property = "selectedItem";
            }

            override protected function doValidation(value:Object):Array
            {
                var results:Array = super.doValidation(value);

                var invalid:Boolean = value == null;


                if (invalid)
                {
                    results.push(new ValidationResult(true, "", "", errorMessage));
                }

                return results;
            }
        }
    }