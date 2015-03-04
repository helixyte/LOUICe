package org.helixyte.louice.shared.model.vos
{
    import mx.collections.ArrayCollection;

    public class BarcodeType
    {
        public static const UNIRACK:String = "UNIRACK";
        public static const LOCATION:String = "LOCATION";
//        public static const EMPTY:String = "EMPTY";

        public function BarcodeType()
        {
        }

        public static function get types():ArrayCollection
        {
            return new ArrayCollection([UNIRACK,LOCATION]);
        }
    }
}