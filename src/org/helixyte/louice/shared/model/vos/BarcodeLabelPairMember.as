package org.helixyte.louice.shared.model.vos
{
    import mx.collections.ArrayCollection;
    import org.everest.flex.model.Member;

    [Bindable]
    public class BarcodeLabelPairMember extends Member
    {
        public var label:String;
        public var barcode:String;

        public function BarcodeLabelPairMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

    }
}