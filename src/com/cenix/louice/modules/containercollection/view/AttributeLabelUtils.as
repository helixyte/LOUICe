package com.cenix.louice.modules.containercollection.view
{
    import com.adobe.utils.StringUtil;
    import com.cenix.louice.shared.model.vos.ContainerMember;
    import com.cenix.louice.shared.utils.UnitConvUtils;

    import mx.collections.ArrayCollection;

    public class AttributeLabelUtils
    {
        public function AttributeLabelUtils()
        {
        }


        public static function sampleMoleculeAttributeList(member:ContainerMember, attr:String):String {
            var concatenated:String = "";
            switch (attr) {
                case "concentration":
                    concatenated = concatenateOnAttribute(
                        member.sample_molecules, function(attrName:String):Function
                        {
                            return function(o:*):*
                            {
                                if (o.concentration)
                                {
                                    return UnitConvUtils.concentrationLabelFunction(Number(o.concentration));
                                } else {
                                    return "";
                                }

                            }
                        }(attr)
                    );
                    break;
                case "freeze_thaw_cycles":
                case "insert_date":
                case "molecule_design_id":
                    concatenated = concatenateOnAttribute(
                        member.sample_molecules, function(attrName:String):Function
                        {
                            return function(o:*):*
                            {
                                return o[attrName];
                            }
                        }(attr)
                    );
                    break;
                case "supplier":
                    concatenated = concatenateOnAttribute(
                        member.sample_molecules, function(attrName:String):Function
                        {
                            return function(o:*):*
                            {
                                if (o.supplier)
                                {
                                    return o.supplier.title;
                                } else {
                                    return "";
                                }

                            }
                        }(attr)
                    );
                    break;
                case "product_id":
                    concatenated = concatenateOnAttribute(
                        member.sample_molecules, function(attrName:String):Function
                        {
                            return function(o:*):*
                            {
                                return o.product_id;
                            }
                        }(attr)
                    );
                    break;
                default:
                    concatenated = "Unknown attribute: " + attr;
                    break;
            }
            return concatenated;
        }

        private static function concatenateOnAttribute(objects:ArrayCollection, attrGetter:Function):String
        {
            var values:Array = [];
            var attrValue:* = null;
            var attrStringValue:String = "";
            for each (var o:* in objects) {
                attrValue = attrGetter(o);
                if (attrValue != null) {
                    if (attrValue is Date) {
                        attrStringValue = (attrValue as Date).toLocaleString();
                    }
                    else {
                        attrStringValue = StringUtil.trim(attrValue);
                    }
                    if (attrStringValue.length > 0) {
                        values.push(attrStringValue);
                    }
                }
            }
            return values.join("\n");
        }
    }
}