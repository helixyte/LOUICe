package com.cenix.louice.shared.model.vos
{
    import mx.collections.ArrayCollection;

    public class ExperimentTypes
    {
        public static const OPTI:String = 'OPTI';
        public static const SCREEN:String = 'SCREEN';
        public static const MANUAL:String = 'MANUAL';
		public static const ISO_LESS:String = 'ISO-LESS';
		public static const LIBRARY:String = 'LIBRARY';
		public static const RTPCR:String = 'RTPCR';
		
        public static const types:ArrayCollection = new ArrayCollection([OPTI,SCREEN,MANUAL,ISO_LESS,LIBRARY,RTPCR]);;

        public function ExperimentTypes()
        {
        }

        public static function labelFunction(item:Object):String
        {
            switch(item)
            {
                case OPTI:
                {
                    return 'Optimization';
                    break;
                }
                case SCREEN:
                {
                    return 'Screening';
                    break;
                }
                case MANUAL:
                {
                    return 'Manual';
                    break;
                }
				case ISO_LESS:
				{
					return 'ISO-less';
					break;
				}
				case LIBRARY:
				{
					return 'Library';
					break;
				}
                case RTPCR:
                {
                    return 'RTPCR';
                    break;
                }
                default:
                {
                    return 'Unknown';
                    break;
                }
            }
        }
    }
}