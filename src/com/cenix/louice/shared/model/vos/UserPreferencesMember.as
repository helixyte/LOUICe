package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;

    public class UserPreferencesMember extends Member
    {
        public static const FILTERED_MENU_ITMES:String = "filteredMenuItems";
        public static const APP_ID:String = "louice";

        public var user:UserMember;
        public var app_name:String;
        public var preferences:String;



        public function UserPreferencesMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
            app_name = APP_ID;
        }

        public function setPreferences(id:String, data:*):void
        {
            var o:Object = new Object();
                o[id] = data;
           preferences = JSON.stringify(o);
        }

        public function getPreferences(id:String):Array
        {
            var o:* = JSON.parse(preferences);
            if (o != null)
            {
                return o[id] as Array;
            }

            return null;
        }

        public function getPreference(id:String):String
        {
            //TODO currently not needed
            return null;
        }

    }
}