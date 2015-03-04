package org.helixyte.louice.shared.model.vos
{
    
    import org.everest.flex.model.Member;
    
    public class SupplierMoleculeDesignMember extends Member
    {
        public var product_id:String;
        public var supplier:OrganizationMember;
        public var _is_current:int = -1;
        
        public function SupplierMoleculeDesignMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
        
        public function get productIdLabel():String
        {
            return supplier.title + " : " + product_id;
        }
        
        public function get is_current():* {
            if (_is_current == -1) {
                return undefined;
            }
            else {
                return _is_current == 1;
            }
        }
        
        public function set is_current(flag:Boolean):void {
            _is_current = flag ? 1 : 0;
        }
        
        
    }
}