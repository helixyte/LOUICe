package com.cenix.louice.shared.model.vos
{
    import mx.collections.ArrayCollection;

    import org.as3commons.lang.StringUtils;
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    [Bindable]
    public class BarcodePrintJobMember extends Member
    {
        public var barcode_label_pairs:MembersCollection;
        public var printer:String;
        public var type:String;

        public function BarcodePrintJobMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }


        public function addBarcodeLabelPair(barcode:String, label:String):void
        {
            if (barcode_label_pairs == null)
            {
                barcode_label_pairs = new MembersCollection();
            }
            var pair:BarcodeLabelPairMember = new BarcodeLabelPairMember();
                pair.label = StringUtils.trim(label);
                pair.barcode = barcode;

            barcode_label_pairs.addItem(pair);
        }

        public function get barcodes():String
        {
            var res:String = "";
            for each (var pair:BarcodeLabelPairMember in barcode_label_pairs)
            {
                    res += pair.barcode + ",";
            }

            if (res.length > 0)
            {
                res = res.substr(0, res.length-1);
            }

            return res;

        }

        public function get labels():String
        {
            var res:String = "";
            for each (var pair:BarcodeLabelPairMember in barcode_label_pairs)
            {
                res += pair.label.replace(",","") + ",";
            }

            if (res.length > 0)
            {
                res = res.substr(0, res.length-1);
            }

            return res;
        }

    }
}