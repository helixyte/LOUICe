package org.helixyte.louice.shared.model.vos
{    
    import mx.collections.ArrayCollection;
    
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    [Bindable]
    public class IsoRequestMember extends Member
    {

        public static const STOCKMANAGEMENT_USER:String = 'stockmanagement';
        
        public var iso_type:String;
        public var label:String;
        public var owner:String;
        public var isos:MembersCollection;
        public var jobs:MembersCollection;

        private var _number_aliquots:uint = 0;
        private var _expected_number_isos:uint = 0;
        private var _tagPredicates:ArrayCollection;
        
        public function IsoRequestMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get number_aliquots():* {
            if (_number_aliquots == 0) {
                return undefined;
            } else {
                return _number_aliquots;
            }
        }
        
        public function set number_aliquots(number_aliquots:uint):void {
            _number_aliquots = number_aliquots;
        }
        
        public function get expected_number_isos():* {
            if (_expected_number_isos == 0) {
                return undefined;
            } else {
                return _expected_number_isos;
            }
        }
        
        public function set expected_number_isos(expected_number_isos:uint):void {
            _expected_number_isos = expected_number_isos;
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
