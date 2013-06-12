package com.cenix.louice.shared.model.vos
{
    import org.everest.flex.model.Member;
    
    public class ExperimentMetaDataTypeMember extends Member
    {
        public var display_name:String;

        public function ExperimentMetaDataTypeMember(title:String=null, selfLink:String=null)
        {    
            super(title, selfLink);
        }
    }
}