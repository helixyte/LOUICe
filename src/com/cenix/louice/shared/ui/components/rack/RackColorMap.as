package com.cenix.louice.shared.ui.components.rack
{
    public class RackColorMap
    {
        public static const COLORS:Array=
            [0xFFFFFF, 16765184, 3700955, 12294618, 6020421, 16725125, 
             7915499, 16752384, 14054656, 14803968,8483348, 16740864, 
             16502941, 16744844, 11543338, 15973588, 10599914, 1223979, 
             13428130, 11380125, 16771077, 15521455, 8679028, 8613420, 
             14427167, 7310777, 10013897, 12014354, 4212246, 4446663, 
             7217312, 13044652, 44695, 16307587, 11381980, 13158851, 
             6370583, 15953, 0xFFFFFF,0x00FF7F,0x426F42, 0xFF6EC7,
             0xCCEEFF,0xFFFF00,0x00FF00,0x15953,0x15257275,0x11724767];

        public function RackColorMap()
        {
        }

        public static function getColor(index:int):uint
        {
            return COLORS[index];
        }
    }
}
