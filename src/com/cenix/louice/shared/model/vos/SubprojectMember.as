package com.cenix.louice.shared.model.vos
{
    import org.everest.flex.model.Member;
    import org.everest.flex.model.SelectionChoice;

    public class SubprojectMember extends Member
    {
        public var label:String;
        public var creation_date:Date;
        public var project:ProjectMember;
        public var active:*;

        public function SubprojectMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get fullTitle():String
        {
            if (project != null)
            {
               return project.link.title + " - " + this.label;
            } else if (this.link != null) {
                return this.link.title;
            } else {
               return this.label;
            }
        }

        public static function choiceLabelFunction(choice:SelectionChoice):String{
            if(choice != null){
                if((choice.value != null)&&(choice.value.subproject != null)){
                    var subproject:* = choice.value.subproject;
                    return subproject.project.link.title + "  " + subproject.label;
                }
                return choice.label;
            }

            return "";
        }

        public static function dataGridLabelFunction(item:Object, column:*):String
        {

            var subproject:SubprojectMember = item[column.dataField];

            if (subproject != null)
            {
                return subproject.fullTitle;
            }

            return "";
        }

    }
}