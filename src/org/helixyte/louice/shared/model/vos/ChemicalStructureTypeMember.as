package org.helixyte.louice.shared.model.vos
{
    import org.everest.flex.model.Member;

    public class ChemicalStructureTypeMember extends Member
    {
        public var name:String;

        public function ChemicalStructureTypeMember(title:String=null, 
                                                    selfLink:String=null)
        {
            super(title, selfLink)
        }
     
		public static function dataGridLabelFunction(item:Object, column:*):String
		{
			
			var chst:ChemicalStructureTypeMember = item[column.dataField];
			
			if (chst != null)
			{
				return chst.name;
			}
			
			return "";
		}
    }
}