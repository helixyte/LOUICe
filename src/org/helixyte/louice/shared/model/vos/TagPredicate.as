package org.helixyte.louice.shared.model.vos
{
    import org.everest.flex.utils.HashSet;

    import mx.collections.ArrayCollection;

    import org.as3commons.lang.StringUtils;

    import spark.collections.Sort;
    import spark.collections.SortField;

    /**
     * An helper entity that represents a tag predicate and contains
     * a unique list of the associated values (no duplicates).
     *
     * @author rothe
     */
    public class TagPredicate
    {
        public var name:String;
        public var label:String;
        private var _valueSet:HashSet;

        public function TagPredicate(tag:TagMember = null)
        {
            if (tag != null)
            {
                if (tag.predicate != null)
                {
                    this.name = tag.predicate;

                    //beautify this a bit
                    this.label = this.name.split("_").join(" ");
                    this.label = StringUtils.capitalize(this.label);

                    //add nano molar unit if this is a concentration
                    if (this.label.indexOf('concentration') > -1)
                    {
                        this.label += " (nM)";
                    }
                }

                addValue(tag.value);
            }
        }

        public function addValue(value:String):void
        {
            if (_valueSet == null)
            {
                _valueSet = new HashSet();
            }

            _valueSet.add(value);
        }

        public function get values():Array
        {
            if (_valueSet != null)
            {
                var coll:ArrayCollection = _valueSet.toArrayCollection();
                var sortfield:SortField = new SortField();
                    sortfield.numeric = false;
                    sortfield.descending = false;

                var sort:Sort = new Sort();
                    sort.fields = [sortfield];
                    coll.sort = sort;
                    coll.refresh();

                return coll.toArray();
            }

            return null;
        }
    }
}