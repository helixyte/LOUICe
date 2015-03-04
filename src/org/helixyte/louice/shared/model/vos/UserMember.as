package org.helixyte.louice.shared.model.vos
{
    import org.helixyte.louice.modules.usermember.UserMember;

    import mx.collections.ArrayCollection;
    import org.everest.flex.model.Member;
    import org.everest.flex.model.MembersCollection;

    [Bindable]
    public class UserMember extends Member
    {
        public var username:String;
        public var user_preferenceses:MembersCollection;
        public var directory_user_id:String;
        private var _filteredMenuIDs:Array;

        public function UserMember(title:String=null, selfLink:String=null)
        {
            super(title, selfLink);
        }

        public function get filteredMenuIdList():Array
        {

            if ((user_preferenceses != null) && (_filteredMenuIDs == null))
            {
                //look in preferences
                for each (var pref:UserPreferencesMember in user_preferenceses)
                {

                    if (pref.app_name == UserPreferencesMember.APP_ID)
                    {
                        _filteredMenuIDs = pref.getPreferences(UserPreferencesMember.FILTERED_MENU_ITMES);
                        break;
                    }
                }
            }

            return _filteredMenuIDs;


        }

        public function getLouicePreferences():UserPreferencesMember
        {
            if (user_preferenceses != null)
            {
                for each (var p:UserPreferencesMember in user_preferenceses)
                {
                    if (p.app_name == UserPreferencesMember.APP_ID)
                    {
                        return p;
                    }
                }
            }

            return new UserPreferencesMember();
        }

        public function set filteredMenuIdList(items:Array):void
        {
            _filteredMenuIDs = items;

            //update the preferences
            var pref:UserPreferencesMember = getLouicePreferences();
                pref.setPreferences(UserPreferencesMember.FILTERED_MENU_ITMES, _filteredMenuIDs);
                if (user_preferenceses == null)
                {
                    user_preferenceses = new MembersCollection();
                    user_preferenceses.addItem(pref);
                }
        }
        /**
         * Parse a user from an anonymeous object.
         *
         * @param userObject the object representing a user entity
         * @return a UserMember or null
         *
         */
        public static function fromObject(userObject:*):UserMember
        {
            var result:UserMember = null;
            try
            {
                var userLink:String = userObject.entry.link.href;
                var userName:String = userObject.entry.title;
                trace(userLink + " " + userName);
                if ((userLink != null)&&(userName != null))
                {
                    result = new UserMember();
                    result.selfLink = userLink;
                    result.id = userObject.entry.content.user.id;
                    result.username = userName;
                    result.directory_user_id = userObject.entry.content.user.directory_user_id;

                      //deserialize the preferences
                    var prefs:Object = userObject.entry.content.user.user_preferenceses;
                    if (prefs != null)
                    {
                        var user_preferenceses:MembersCollection = new MembersCollection();

                        for each (var pref:* in prefs)
                        {
                            var p:UserPreferencesMember = new UserPreferencesMember();
                            p.app_name = pref.app_name;
                            p.preferences = pref.preferences;
                            p.id = pref.id;
                            user_preferenceses.addItem(p);
                        }
                        result.user_preferenceses = user_preferenceses;

                    }
                }
            } catch(error:Error){
                trace(error.message);
            }

            return result;

        }

    }
}