package com.cenix.louice.shared.model.vos
{
	import org.everest.flex.model.Member;
	
	[Bindable]
	public class LibraryPlateMember extends Member
	{
		public var rack:RackMember;
		public var has_been_used:Boolean;
		public var lab_iso:LabIsoMember;
		
		private var _layout_number:uint = 0;
		
		public function LibraryPlateMember(title:String=null, selfLink:String=null)
		{
			super(title, selfLink);
		}
		
		public function get layout_number():* {
			if (_layout_number == 0) {
				return undefined;
			} else {
				return _layout_number;
			}
		}
		
		public function set layout_number(layout_number:uint):void {
			_layout_number = layout_number;
		}

	}
}