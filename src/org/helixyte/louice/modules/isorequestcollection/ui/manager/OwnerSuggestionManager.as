package org.helixyte.louice.modules.isorequestcollection.ui.manager
{
    import org.everest.flex.model.managers.SuggestionManager;
    import org.everest.flex.namespaces.atom;

    public class OwnerSuggestionManager extends SuggestionManager
    {
        public function OwnerSuggestionManager()
        {
            super();
        }


        protected override function loadMember(entry:XML):Object{
            use namespace atom;

            var result:Object = super.loadMember(entry);
                result.title = result.directory_user_id;

            return result;

        }
    }
}