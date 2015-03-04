package org.helixyte.louice.shared.model.vos
{
	import org.everest.flex.model.Member;
	import org.everest.flex.model.MembersCollection;

    public class ProjectMember extends Member
    {
        public var label:String;
        public var customer:OrganizationMember;
        public var creation_date:Date;
        public var leader:UserMember;
        public var subprojects:MembersCollection;
        private var _active:int = -1;

        public function ProjectMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get active():Boolean{

            if (_active < 0){
                _active = 0;

                if (!subprojects)
                {
                    _active = 1;

                } else {
                    for each (var subproject:SubprojectMember in subprojects){

                        if (subproject.active)
                        {
                            _active = 1;
                            break;
                        }
                    }
                }
            }

            if (_active == 1){
                return true;
            } else {
                return false;
            }

        }

        public function get statusGroup():String{
            if(active){
                return "active projects";
            } else {
                return "archived projects";
            }
        }

        public function get subprojectCount():Number{

            if(subprojects == null){
                return 0;
            } else {
                return subprojects.length;
            }
        }
    }
}