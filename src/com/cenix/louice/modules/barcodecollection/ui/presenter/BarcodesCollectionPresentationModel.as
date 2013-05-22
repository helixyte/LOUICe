package com.cenix.louice.modules.barcodecollection.ui.presenter
{
    import org.everest.flex.events.MemberEvent;
    import com.cenix.louice.shared.model.vos.BarcodePrintJobMember;
    import org.everest.flex.ui.presenters.CollectionPresentationModel;

    import flash.events.IEventDispatcher;

    public class BarcodesCollectionPresentationModel extends CollectionPresentationModel
    {

        public var barcodePrintJob:BarcodePrintJobMember;

        public function BarcodesCollectionPresentationModel(dispatcher:IEventDispatcher)
        {
            super(dispatcher);
        }



        public function printBarcodes(printer:String):void
        {

            barcodePrintJob.printer = printer;

            var e:MemberEvent = new MemberEvent(MemberEvent.CREATE_MEMBER_IN_BACKGROUND);
                e.member = barcodePrintJob;
                e.pageUrl = "/barcodes"

            dispatcher.dispatchEvent(e);

        }
    }
}