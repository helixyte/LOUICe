package com.cenix.louice.shared.model.vos
{
    import org.everest.flex.model.MembersCollection;
	
    public class MoleculeDesignPoolMember extends MoleculeDesignSetMember
    {
        public var molecule_type:MoleculeTypeMember;
        public var genes:MembersCollection;
        public var supplier_molecule_designs:MembersCollection;

        private var _number_designs:uint = 0;

        public function MoleculeDesignPoolMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }
        
        public function get number_designs():* {
            if (_number_designs == 0) {
                return undefined;
            } else {
                return _number_designs;
            }
        }
        
        public function set number_designs(number_designs:uint):void {
            _number_designs = number_designs;
        }
        
        public function get productIdsLabel():String
        {
            var labels:Array = new Array();
            for each (var smd:SupplierMoleculeDesignMember in supplier_molecule_designs)
            {
                labels.push(smd.productIdLabel);
            }
            return labels.join('\n');
        }
        
        public function get targetsLabel():String
        {
            var label:String = "";
            var labels:Array = new Array();
            for each (var gene:GeneMember in genes)
            {
                labels.push(gene.geneIdLabel);
            }
            if (labels.length > 5) 
            {
                label = labels.slice(0, 5).join(', ') + ", [..." + (labels.length-5) + " more...]";
            }
            else
            {
                label = labels.join(', ');
            }
            return label
        }
		
    }
}