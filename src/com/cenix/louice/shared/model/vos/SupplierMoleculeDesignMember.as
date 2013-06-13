package com.cenix.louice.shared.model.vos
{
    
    import org.everest.flex.model.Member;
    
    public class SupplierMoleculeDesignMember extends Member
    {
        public var product_id:String;
        public var supplier:OrganizationMember;
        public var is_current:Boolean;
        
        public function SupplierMoleculeDesignMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
        
        public function get productIdLabel():String
        {
            return supplier.title + " : " + product_id;
        }
    }
}