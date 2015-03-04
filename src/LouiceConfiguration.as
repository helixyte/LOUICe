package
{
    import org.helixyte.louice.shared.model.constants.ContentType;
    import org.helixyte.louice.shared.model.vos.BarcodeLabelPairMember;
    import org.helixyte.louice.shared.model.vos.BarcodePrintJobMember;
    import org.helixyte.louice.shared.model.vos.ChemicalStructureMember;
    import org.helixyte.louice.shared.model.vos.ChemicalStructureTypeMember;
    import org.helixyte.louice.shared.model.vos.ContainerMember;
    import org.helixyte.louice.shared.model.vos.ContainerSpecsMember;
    import org.helixyte.louice.shared.model.vos.DeviceMember;
    import org.helixyte.louice.shared.model.vos.DeviceTypeMember;
    import org.helixyte.louice.shared.model.vos.ExperimentDesignMember;
    import org.helixyte.louice.shared.model.vos.ExperimentDesignRackMember;
    import org.helixyte.louice.shared.model.vos.ExperimentJobMember;
    import org.helixyte.louice.shared.model.vos.ExperimentMember;
    import org.helixyte.louice.shared.model.vos.ExperimentMetaDataMember;
    import org.helixyte.louice.shared.model.vos.ExperimentMetaDataTypeMember;
    import org.helixyte.louice.shared.model.vos.ExperimentRackMember;
    import org.helixyte.louice.shared.model.vos.GeneMember;
    import org.helixyte.louice.shared.model.vos.IsoJobMember;
    import org.helixyte.louice.shared.model.vos.IsoJobStockRackMember;
    import org.helixyte.louice.shared.model.vos.IsoMember;
    import org.helixyte.louice.shared.model.vos.IsoRequestMember;
    import org.helixyte.louice.shared.model.vos.IsoSectorStockRackMember;
    import org.helixyte.louice.shared.model.vos.IsoStockRackMember;
    import org.helixyte.louice.shared.model.vos.ItemStatusMember;
    import org.helixyte.louice.shared.model.vos.JobMember;
    import org.helixyte.louice.shared.model.vos.LabIsoMember;
    import org.helixyte.louice.shared.model.vos.LabIsoRequestMember;
    import org.helixyte.louice.shared.model.vos.LibraryPlateMember;
    import org.helixyte.louice.shared.model.vos.LocationMember;
    import org.helixyte.louice.shared.model.vos.LocationTypeMember;
    import org.helixyte.louice.shared.model.vos.MoleculeDesignMember;
    import org.helixyte.louice.shared.model.vos.MoleculeDesignPoolMember;
    import org.helixyte.louice.shared.model.vos.MoleculeDesignPoolSetMember;
    import org.helixyte.louice.shared.model.vos.MoleculeDesignSetMember;
    import org.helixyte.louice.shared.model.vos.MoleculeTypeMember;
    import org.helixyte.louice.shared.model.vos.OrganizationMember;
    import org.helixyte.louice.shared.model.vos.PlateMember;
    import org.helixyte.louice.shared.model.vos.PlateSpecsMember;
    import org.helixyte.louice.shared.model.vos.ProjectMember;
    import org.helixyte.louice.shared.model.vos.RackLayoutMember;
    import org.helixyte.louice.shared.model.vos.RackMember;
    import org.helixyte.louice.shared.model.vos.RackPositionMember;
    import org.helixyte.louice.shared.model.vos.RackPositionSetMember;
    import org.helixyte.louice.shared.model.vos.RackShapeMember;
    import org.helixyte.louice.shared.model.vos.RackSpecsMember;
    import org.helixyte.louice.shared.model.vos.SampleMoleculeMember;
    import org.helixyte.louice.shared.model.vos.SpeciesMember;
    import org.helixyte.louice.shared.model.vos.StockInfoMember;
    import org.helixyte.louice.shared.model.vos.StockRackMember;
    import org.helixyte.louice.shared.model.vos.SubprojectMember;
    import org.helixyte.louice.shared.model.vos.SupplierMoleculeDesignMember;
    import org.helixyte.louice.shared.model.vos.TagMember;
    import org.helixyte.louice.shared.model.vos.TaggedRackPositionSetMember;
    import org.helixyte.louice.shared.model.vos.TubeMember;
    import org.helixyte.louice.shared.model.vos.TubeRackMember;
    import org.helixyte.louice.shared.model.vos.TubeRackSpecsMember;
    import org.helixyte.louice.shared.model.vos.TubeSpecsMember;
    import org.helixyte.louice.shared.model.vos.UserMember;
    import org.helixyte.louice.shared.model.vos.UserPreferencesMember;
    import org.helixyte.louice.shared.model.vos.WellMember;
    import org.helixyte.louice.shared.model.vos.WellSpecsMember;
    
    import org.everest.flex.model.EverestConfiguration;
    import org.everest.flex.model.Module;
    import org.everest.flex.model.SchemaModelEntry;
    
    public class LouiceConfiguration extends EverestConfiguration
    {
        public function LouiceConfiguration()
        {
            super();
        }
        
        public override function get modules():Vector.<Module>
        {
            var res:Vector.<Module> = new Vector.<Module>();
            res.push( new Module(org.everest.flex.model.ContentType.APP_SERVICE, 'org/helixyte/louice/modules/menu/Menu.swf') );
            res.push( new Module(ContentType.BARCODE_PRINT_JOB_COLLECTION, 'org/helixyte/louice/modules/barcodecollection/BarcodeCollection.swf') );
            res.push( new Module(ContentType.CONTAINER_SPECS_COLLECTION, 'org/helixyte/louice/modules/containerspecscollection/ContainerSpecsCollection.swf') );
            res.push( new Module(ContentType.DEVICE_COLLECTION, 'org/helixyte/louice/modules/devicecollection/DeviceCollection.swf') );
            res.push( new Module(ContentType.DEVICE_MEMBER, 'org/helixyte/louice/modules/devicemember/DeviceMember.swf') );
            res.push( new Module(ContentType.DEVICE_TYPE_COLLECTION, 'org/helixyte/louice/modules/devicetypecollection/DeviceTypeCollection.swf') );
            res.push( new Module(ContentType.DEVICE_TYPE_MEMBER, 'org/helixyte/louice/modules/devicetypemember/DeviceTypeMember.swf') );
            res.push( new Module(ContentType.GENE_COLLECTION, 'org/helixyte/louice/modules/genecollection/GeneCollection.swf') );
            res.push( new Module(ContentType.GENE_MEMBER, 'org/helixyte/louice/modules/genemember/GeneMember.swf') );
            res.push( new Module(ContentType.EXPERIMENT_DESIGN_RACK_MEMBER, 'org/helixyte/louice/modules/experimentdesignrackmember/ExperimentDesignRackMember.swf') );
            res.push( new Module(ContentType.EXPERIMENT_JOB_MEMBER, 'org/helixyte/louice/modules/experimentjobmember/ExperimentJobMember.swf') );
            res.push( new Module(ContentType.EXPERIMENT_METADATA_COLLECTION, 'org/helixyte/louice/modules/experimentmetadatacollection/ExperimentMetaDataCollection.swf') );
            res.push( new Module(ContentType.EXPERIMENT_METADATA_MEMBER, 'org/helixyte/louice/modules/experimentmetadatamember/ExperimentMetaDataMember.swf') );
            res.push( new Module(ContentType.ISO_REQUEST_COLLECTION, 'org/helixyte/louice/modules/isorequestcollection/IsoRequestCollection.swf') );
            res.push( new Module(ContentType.ISO_REQUEST_MEMBER, 'org/helixyte/louice/modules/isorequestmember/IsoRequestMember.swf') );
            res.push( new Module(ContentType.ITEM_STATUS_COLLECTION, 'org/helixyte/louice/modules/itemstatuscollection/ItemStatusCollection.swf') );
            res.push( new Module(ContentType.ITEM_STATUS_MEMBER, 'org/helixyte/louice/modules/itemstatusmember/ItemStatusMember.swf') );
            res.push( new Module(ContentType.LOCATION_TYPE_COLLECTION, 'org/helixyte/louice/modules/locationtypecollection/LocationTypeCollection.swf') );
            res.push( new Module(ContentType.LOCATION_TYPE_MEMBER, 'org/helixyte/louice/modules/locationtypemember/LocationTypeMember.swf') );
            res.push( new Module(ContentType.LOCATION_COLLECTION, 'org/helixyte/louice/modules/locationcollection/LocationCollection.swf') );
            res.push( new Module(ContentType.LOCATION_MEMBER, 'org/helixyte/louice/modules/locationmember/LocationMember.swf') );
            res.push( new Module(ContentType.MOLECULE_DESIGN_COLLECTION, 'org/helixyte/louice/modules/moleculedesigncollection/MoleculeDesignCollection.swf') );
            res.push( new Module(ContentType.MOLECULE_DESIGN_MEMBER, 'org/helixyte/louice/modules/moleculedesignmember/MoleculeDesignMember.swf') );
            res.push( new Module(ContentType.MOLECULE_DESIGN_POOL_COLLECTION, 'org/helixyte/louice/modules/moleculedesignpoolcollection/MoleculeDesignPoolCollection.swf') );
            res.push( new Module(ContentType.MOLECULE_DESIGN_POOL_MEMBER, 'org/helixyte/louice/modules/moleculedesignpoolmember/MoleculeDesignPoolMember.swf') );
            res.push( new Module(ContentType.MOLECULE_TYPE_COLLECTION, 'org/helixyte/louice/modules/moleculetypecollection/MoleculeTypeCollection.swf') );
            res.push( new Module(ContentType.MOLECULE_TYPE_MEMBER, 'org/helixyte/louice/modules/moleculetypemember/MoleculeTypeMember.swf') );
            res.push( new Module(ContentType.ORGANIZATION_COLLECTION, 'org/helixyte/louice/modules/organizationcollection/OrganizationCollection.swf') );
            res.push( new Module(ContentType.ORGANIZATION_MEMBER, 'org/helixyte/louice/modules/organizationmember/OrganizationMember.swf') );
            res.push( new Module(ContentType.PLATE_MEMBER, 'org/helixyte/louice/modules/platemember/PlateMember.swf') );
            res.push( new Module(ContentType.PLATE_SPECS_MEMBER, 'org/helixyte/louice/modules/platespecsmember/PlateSpecsMember.swf') );
            res.push( new Module(ContentType.PROJECT_COLLECTION, 'org/helixyte/louice/modules/projectcollection/ProjectCollection.swf') );
            res.push( new Module(ContentType.PROJECT_MEMBER, 'org/helixyte/louice/modules/projectmember/ProjectMember.swf') );
            res.push( new Module(ContentType.TUBERACK_COLLECTION, 'org/helixyte/louice/modules/tuberackcollection/TubeRackCollection.swf') );
			res.push( new Module(ContentType.PLATE_COLLECTION, 'org/helixyte/louice/modules/platecollection/PlateCollection.swf') );
            res.push( new Module(ContentType.RACK_SPECS_COLLECTION, 'org/helixyte/louice/modules/rackspecscollection/RackSpecsCollection.swf') );
            res.push( new Module(ContentType.RACK_SHAPE_COLLECTION, 'org/helixyte/louice/modules/rackshapecollection/RackShapeCollection.swf') );
            res.push( new Module(ContentType.RACK_SHAPE_MEMBER, 'org/helixyte/louice/modules/rackshapemember/RackShapeMember.swf') );
            res.push( new Module(ContentType.SPECIES_COLLECTION, 'org/helixyte/louice/modules/speciescollection/SpeciesCollection.swf') );
            res.push( new Module(ContentType.SPECIES_MEMBER, 'org/helixyte/louice/modules/speciesmember/SpeciesMember.swf') );
            res.push( new Module(ContentType.STOCK_INFO_COLLECTION, 'org/helixyte/louice/modules/stockinfocollection/StockInfoCollection.swf') );
            res.push( new Module(ContentType.STOCK_INFO_MEMBER, 'org/helixyte/louice/modules/stockinfomember/StockInfoMember.swf') );
            res.push( new Module(ContentType.TUBE_COLLECTION, 'org/helixyte/louice/modules/tubecollection/TubeCollection.swf') );
            res.push( new Module(ContentType.TUBE_MEMBER, 'org/helixyte/louice/modules/tubemember/TubeMember.swf') );
            res.push( new Module(ContentType.TUBE_RACK_MEMBER, 'org/helixyte/louice/modules/tuberackmember/TubeRackMember.swf') );
            res.push( new Module(ContentType.TUBE_RACK_SPECS_MEMBER, 'org/helixyte/louice/modules/tuberackspecsmember/TubeRackSpecsMember.swf') );
            res.push( new Module(ContentType.TUBE_SPECS_MEMBER, 'org/helixyte/louice/modules/tubespecsmember/TubeSpecsMember.swf') );
            res.push( new Module(ContentType.WELL_SPECS_MEMBER, 'org/helixyte/louice/modules/wellspecsmember/WellSpecsMember.swf') );
            res.push( new Module(ContentType.USER_MEMBER, 'org/helixyte/louice/modules/usermember/UserMember.swf') );
            return res;
        }
        
        
        public override function get schemaMappings():Vector.<SchemaModelEntry>
        {
            var res:Vector.<SchemaModelEntry> = new Vector.<SchemaModelEntry>();
            //            res.push( new SchemaModelEntry("http://schemata.thelma.org/shared", "Link",Link, "/schemata/Shared.xsd") );
            res.push( new SchemaModelEntry("barcode_label_pair", "http://schemata.thelma.org/barcodeprintjob", "BarcodeLabelPair", BarcodeLabelPairMember) );
            res.push( new SchemaModelEntry("barcode_print_job", "http://schemata.thelma.org/barcodeprintjob", "BarcodePrintJob", BarcodePrintJobMember, "/schemata/BarcodePrintJob.xsd") );
            res.push( new SchemaModelEntry("chemical_structure", "http://schemata.thelma.org/chemicalstructure", "ChemicalStructure", ChemicalStructureMember, "/schemata/ChemicalStructure.xsd") );
            res.push( new SchemaModelEntry("chemical_structure_type", "http://schemata.thelma.org/chemicalstructuretype", "ChemicalStructureType", ChemicalStructureTypeMember, "/schemata/ChemicalStructureType.xsd") );
            res.push( new SchemaModelEntry("container", "http://schemata.thelma.org/container", "Container", ContainerMember, "/schemata/Container.xsd") );
            res.push( new SchemaModelEntry("container_specs", "http://schemata.thelma.org/containerspecs", "ContainerSpecs", ContainerSpecsMember, "/schemata/ContainerSpecs.xsd") );
            res.push( new SchemaModelEntry("device", "http://schemata.thelma.org/device", "Device", DeviceMember, "/schemata/Device.xsd") );
            res.push( new SchemaModelEntry("devicetype", "http://schemata.thelma.org/devicetype", "DeviceType", DeviceTypeMember, "/schemata/DeviceType.xsd") );
            res.push( new SchemaModelEntry("experiment_job", "http://schemata.thelma.org/job", "ExperimentJob", ExperimentJobMember) );
            res.push( new SchemaModelEntry("experiment", "http://schemata.thelma.org/experiment", "Experiment", ExperimentMember, "/schemata/Experiment.xsd") );
            res.push( new SchemaModelEntry("experiment_metadata", "http://schemata.thelma.org/experimentmetadata", "ExperimentMetaData", ExperimentMetaDataMember, "/schemata/ExperimentMetaData.xsd") );
            res.push( new SchemaModelEntry("experiment_metadata_type", "http://schemata.thelma.org/experimentmetadatatype", "ExperimentMetaDataType", ExperimentMetaDataTypeMember, "/schemata/ExperimentMetaDataType.xsd") );
            res.push( new SchemaModelEntry("experimentdesign", "http://schemata.thelma.org/experimentdesign", "ExperimentDesign", ExperimentDesignMember, "/schemata/ExperimentDesign.xsd") );
            res.push( new SchemaModelEntry("experimentdesignrack", "http://schemata.thelma.org/experimentdesignrack", "ExperimentDesignRack", ExperimentDesignRackMember, "/schemata/ExperimentDesignRack.xsd") );
            res.push( new SchemaModelEntry("experiment_rack", "http://schemata.thelma.org/experimentrack", "ExperimentRack", ExperimentRackMember, "/schemata/ExperimentRack.xsd") );
            res.push( new SchemaModelEntry("gene", "http://schemata.thelma.org/gene", "Gene", GeneMember, "/schemata/Gene.xsd") );
            res.push( new SchemaModelEntry("iso", "http://schemata.thelma.org/iso", "Iso", IsoMember, "/schemata/Iso.xsd") );
            res.push( new SchemaModelEntry("iso_job", "http://schemata.thelma.org/job", "IsoJob", IsoJobMember) );
            res.push( new SchemaModelEntry("iso_request", "http://schemata.thelma.org/isorequest", "IsoRequest", IsoRequestMember, "/schemata/IsoRequest.xsd") );
            res.push( new SchemaModelEntry("stock_rack", "http://schemata.thelma.org/isostockrack", "StockRack", StockRackMember, "/schemata/IsoStockRack.xsd") );
            res.push( new SchemaModelEntry("iso_job_stock_rack", "http://schemata.thelma.org/isostockrack", "IsoJobStockRack", IsoJobStockRackMember) );
            res.push( new SchemaModelEntry("iso_stock_rack", "http://schemata.thelma.org/isostockrack", "IsoStockRack", IsoStockRackMember) );
            res.push( new SchemaModelEntry("iso_sector_stock_rack", "http://schemata.thelma.org/isostockrack", "IsoSectorStockRack", IsoSectorStockRackMember) );
            res.push( new SchemaModelEntry("itemstatus", "http://schemata.thelma.org/itemstatus", "ItemStatus", ItemStatusMember, "/schemata/ItemStatus.xsd") );
            res.push( new SchemaModelEntry("job", "http://schemata.thelma.org/job", "Job", JobMember, "/schemata/Job.xsd") );
            res.push( new SchemaModelEntry("lab_iso", "http://schemata.thelma.org/iso", "LabIso", LabIsoMember) );
            res.push( new SchemaModelEntry("lab_iso_request", "http://schemata.thelma.org/isorequest", "LabIsoRequest", LabIsoRequestMember) );
			res.push( new SchemaModelEntry("library_plate", "http://schemata.thelma.org/libraryplate", "LibraryPlate", LibraryPlateMember) );
            res.push( new SchemaModelEntry("location", "http://schemata.thelma.org/location", "Location", LocationMember, "/schemata/Location.xsd" ) );
            res.push( new SchemaModelEntry("location_type", "http://schemata.thelma.org/locationtype", "LocationType", LocationTypeMember, "/schemata/LocationType.xsd") );
            res.push( new SchemaModelEntry("molecule_design", "http://schemata.thelma.org/moleculedesign", "MoleculeDesign", MoleculeDesignMember, "/schemata/MoleculeDesign.xsd") );
            res.push( new SchemaModelEntry("molecule_design_pool", "http://schemata.thelma.org/moleculedesignset", "MoleculeDesignPool", MoleculeDesignPoolMember, "/schemata/MoleculeDesignSet.xsd") );
            res.push( new SchemaModelEntry("molecule_design_pool_set", "http://schemata.thelma.org/moleculedesignpoolset", "MoleculeDesignPoolSet", MoleculeDesignPoolSetMember, "/schemata/MoleculeDesignPoolSet.xsd") );
            res.push( new SchemaModelEntry("molecule_design_set", "http://schemata.thelma.org/moleculedesignset", "MoleculeDesignSet", MoleculeDesignSetMember, "/schemata/MoleculeDesignSet.xsd") );
            res.push( new SchemaModelEntry("molecule_type", "http://schemata.thelma.org/moleculetype", "MoleculeType", MoleculeTypeMember, "/schemata/MoleculeType.xsd") );
            res.push( new SchemaModelEntry("organization", "http://schemata.thelma.org/organization", "Organization", OrganizationMember, "/schemata/Organization.xsd") );
            res.push( new SchemaModelEntry("project", "http://schemata.thelma.org/project", "Project", ProjectMember, "/schemata/Project.xsd") );
            res.push( new SchemaModelEntry("plate", "http://schemata.thelma.org/rack", "Plate", PlateMember) );
            res.push( new SchemaModelEntry("plate_specs", "http://schemata.thelma.org/rackspecs", "PlateSpecs", PlateSpecsMember) );
            res.push( new SchemaModelEntry("rack", "http://schemata.thelma.org/rack", "Rack", RackMember, "/schemata/Rack.xsd") );
            res.push( new SchemaModelEntry("rack_layout", "http://schemata.thelma.org/racklayout", "RackLayout", RackLayoutMember, "/schemata/RackLayout.xsd") );
            res.push( new SchemaModelEntry("rack_position", "http://schemata.thelma.org/rackposition", "RackPosition", RackPositionMember, "/schemata/RackPosition.xsd") );
            res.push( new SchemaModelEntry("rack_position_set", "http://schemata.thelma.org/rackpositionset", "RackPositionSet", RackPositionSetMember, "/schemata/RackPositionSet.xsd") );
            res.push( new SchemaModelEntry("rack_shape", "http://schemata.thelma.org/rackshape", "RackShape", RackShapeMember, "/schemata/RackShape.xsd") );
            res.push( new SchemaModelEntry("rack_specs", "http://schemata.thelma.org/rackspecs", "RackSpecs", RackSpecsMember, "/schemata/RackSpecs.xsd") );
            res.push( new SchemaModelEntry("sample_molecule", "http://schemata.thelma.org/samplemolecule", "SampleMolecule", SampleMoleculeMember, "/schemata/SampleMolecule.xsd") );
            res.push( new SchemaModelEntry("species", "http://schemata.thelma.org/species", "Species", SpeciesMember, "/schemata/Species.xsd") );
            res.push( new SchemaModelEntry("stockinfo", "http://schemata.thelma.org/stockinfo", "StockInfo", StockInfoMember, "/schemata/StockInfo.xsd") );
            res.push( new SchemaModelEntry("subproject", "http://schemata.thelma.org/subproject", "Subproject", SubprojectMember, "/schemata/Subproject.xsd") );
            res.push( new SchemaModelEntry("supplier_molecule_design", "http://schemata.thelma.org/suppliermoleculedesign", "SupplierMoleculeDesign", SupplierMoleculeDesignMember, "/schemata/SupplierMoleculeDesign.xsd") );
            res.push( new SchemaModelEntry("tag", "http://schemata.thelma.org/tag", "Tag", TagMember, "/schemata/Tag.xsd") );
            res.push( new SchemaModelEntry("tagged_rack_position_set", "http://schemata.thelma.org/taggedrackpositionset", "TaggedRackPositionSet", TaggedRackPositionSetMember, "/schemata/TaggedRackPositionSet.xsd") );
            res.push( new SchemaModelEntry("tube_rack", "http://schemata.thelma.org/rack", "TubeRack", TubeRackMember) );
            res.push( new SchemaModelEntry("tube_rack_specs", "http://schemata.thelma.org/rackspecs", "TubeRackSpecs", TubeRackSpecsMember) );
            res.push( new SchemaModelEntry("user", "http://schemata.thelma.org/user", "User", UserMember, "/schemata/User.xsd") );
            res.push( new SchemaModelEntry("user_preferences", "http://schemata.thelma.org/userpreferences", "UserPreferences", UserPreferencesMember, "/schemata/UserPreferences.xsd") );
            res.push( new SchemaModelEntry("tube", "http://schemata.thelma.org/container", "Tube", TubeMember) );
            res.push( new SchemaModelEntry("tube_specs", "http://schemata.thelma.org/containerspecs", "TubeSpecs", TubeSpecsMember) );
            res.push( new SchemaModelEntry("well_specs", "http://schemata.thelma.org/containerspecs", "WellSpecs", WellSpecsMember) );
            res.push( new SchemaModelEntry("well", "http://schemata.thelma.org/container", "Well", WellMember) );
            return res;
        }
    }
}
