package com.cenix.louice.shared.model.vos
{    
    import mx.collections.ArrayCollection;
    
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    [Bindable]
    public class IsoRequestMember extends Member
    {

        public static const STOCKMANAGEMENT_USER:String = 'stockmanagement';
        
        public var iso_type:String;
        public var plate_set_label:String;
        public var owner:String;
        public var isos:MembersCollection;
        public var expected_number_isos:Number;
        public var number_aliquots:Number;
                
        private var _tagPredicates:ArrayCollection;
        
        public function IsoRequestMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
        
        
        public function get isosCount():Number{
            
            if(isos == null){
                return 0;
            } else {
                return isos.length;
            }
        }

    }
}