package com.cenix.louice.shared.utils
{
    public class UnitConvUtils
    {
        public static const VOLUME_DISPLAY_UNIT:String = "μl";

        public static const CONCENTRATION_DISPLAY_UNIT:String = "μM";

        public static const QUANTITY_DISPLAY_UNIT:String = "nmol";

        public static const VOLUME_FACTOR:Number = 1e6;

        public static const CONCENTRATION_FACTOR:Number = 1e6;

        private static const _QUANTITY_FACTOR:Number = 1e9;

        private static const ROUNDING_FACTOR:uint = 1000;

        public static function storedVolumeToDisplayed(volume:Number):Number
        {
            return volume * VOLUME_FACTOR;
        }

        public static function displayedVolumeToStored(volume:Number):Number
        {
            return volume / VOLUME_FACTOR;
        }

        public static function storedConcentrationToDisplayed(concentration:Number):Number
        {
            return concentration * CONCENTRATION_FACTOR;
        }

        public static function displayedConcentrationToStored(concentration:Number):Number
        {
            return concentration / CONCENTRATION_FACTOR;
        }

        public static function storedQuantityToDisplayed(quantity:Number):Number
        {
            return quantity * _QUANTITY_FACTOR;
        }

        public static function displayedAuantityToStored(quantity:Number):Number
        {
            return quantity / _QUANTITY_FACTOR;
        }

        public static function volumeLabelFunction(value:Number):String
        {

            if (isNaN(value))
            {
                return "";
            }


            return String(Math.round(value * UnitConvUtils.VOLUME_FACTOR * ROUNDING_FACTOR)/ROUNDING_FACTOR);
        }

        public static function dataGridVolumeLabelFunction(item:Object, column:*):String
        {

            return volumeLabelFunction(item[column.dataField] as Number);
        }

        public static function concentrationLabelFunction(value:Number):String
        {

            if (isNaN(value))
            {
                return "";
            }

            return String(Math.round(value * UnitConvUtils.CONCENTRATION_FACTOR * ROUNDING_FACTOR)/ROUNDING_FACTOR);
        }

        public static function dataGridConcentrationLabelFunction(item:Object, column:*):String
        {
            return concentrationLabelFunction(item[column.dataField] as Number);
        }
    }
}