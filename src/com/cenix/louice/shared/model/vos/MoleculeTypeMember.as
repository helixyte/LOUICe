package com.cenix.louice.shared.model.vos
{
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    public class MoleculeTypeMember extends Member
    {
        public var name:String;
        public var description:String;
        private var _thaw_time:Number;
        public var modifications:MembersCollection;

        public function MoleculeTypeMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink)
        }

        public function get thaw_time():*
        {
            if(link != null || isNaN(_thaw_time)){
                return undefined;
            }
            return _thaw_time;
        }

        public function set thaw_time(value:*):void
        {
            _thaw_time = value;
        }

    }
}