package
{
    import com.cenix.louice.shared.model.constants.ContentType;
    import com.cenix.louice.shared.model.vos.BarcodeLabelPairMember;
    import com.cenix.louice.shared.model.vos.BarcodePrintJobMember;
    import com.cenix.louice.shared.model.vos.ChemicalStructureMember;
    import com.cenix.louice.shared.model.vos.ChemicalStructureTypeMember;
    import com.cenix.louice.shared.model.vos.ContainerMember;
    import com.cenix.louice.shared.model.vos.ContainerSpecsMember;
    import com.cenix.louice.shared.model.vos.DeviceMember;
    import com.cenix.louice.shared.model.vos.DeviceTypeMember;
    import com.cenix.louice.shared.model.vos.ExperimentDesignMember;
    import com.cenix.louice.shared.model.vos.ExperimentDesignRackMember;
    import com.cenix.louice.shared.model.vos.ExperimentJobMember;
    import com.cenix.louice.shared.model.vos.ExperimentMember;
    import com.cenix.louice.shared.model.vos.ExperimentMetaDataMember;
    import com.cenix.louice.shared.model.vos.ExperimentMetaDataTypeMember;
    import com.cenix.louice.shared.model.vos.ExperimentRackMember;
    import com.cenix.louice.shared.model.vos.GeneMember;
    import com.cenix.louice.shared.model.vos.IsoJobMember;
    import com.cenix.louice.shared.model.vos.IsoMember;
    import com.cenix.louice.shared.model.vos.IsoRequestMember;
    import com.cenix.louice.shared.model.vos.IsoSampleStockRackMember;
    import com.cenix.louice.shared.model.vos.ItemStatusMember;
    import com.cenix.louice.shared.model.vos.JobMember;
    import com.cenix.louice.shared.model.vos.JobTypeMember;
    import com.cenix.louice.shared.model.vos.LocationMember;
    import com.cenix.louice.shared.model.vos.LocationTypeMember;
    import com.cenix.louice.shared.model.vos.MoleculeDesignMember;
    import com.cenix.louice.shared.model.vos.MoleculeDesignPoolMember;
    import com.cenix.louice.shared.model.vos.MoleculeDesignPoolSetMember;
    import com.cenix.louice.shared.model.vos.MoleculeDesignSetMember;
    import com.cenix.louice.shared.model.vos.MoleculeTypeMember;
    import com.cenix.louice.shared.model.vos.OrganizationMember;
    import com.cenix.louice.shared.model.vos.PlateMember;
    import com.cenix.louice.shared.model.vos.PlateSpecsMember;
    import com.cenix.louice.shared.model.vos.ProjectMember;
    import com.cenix.louice.shared.model.vos.RackLayoutMember;
    import com.cenix.louice.shared.model.vos.RackMember;
    import com.cenix.louice.shared.model.vos.RackPositionMember;
    import com.cenix.louice.shared.model.vos.RackPositionSetMember;
    import com.cenix.louice.shared.model.vos.RackShapeMember;
    import com.cenix.louice.shared.model.vos.RackSpecsMember;
    import com.cenix.louice.shared.model.vos.SampleMoleculeMember;
    import com.cenix.louice.shared.model.vos.SpeciesMember;
    import com.cenix.louice.shared.model.vos.StockInfoMember;
    import com.cenix.louice.shared.model.vos.SubprojectMember;
    import com.cenix.louice.shared.model.vos.TagMember;
    import com.cenix.louice.shared.model.vos.TaggedRackPositionSetMember;
    import com.cenix.louice.shared.model.vos.TubeMember;
    import com.cenix.louice.shared.model.vos.TubeRackMember;
    import com.cenix.louice.shared.model.vos.TubeRackSpecsMember;
    import com.cenix.louice.shared.model.vos.TubeSpecsMember;
    import com.cenix.louice.shared.model.vos.UserMember;
    import com.cenix.louice.shared.model.vos.UserPreferencesMember;
    import com.cenix.louice.shared.model.vos.WellMember;
    import com.cenix.louice.shared.model.vos.WellSpecsMember;
    
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
                res.push( new Module(org.everest.flex.model.ContentType.APP_SERVICE, 'com/cenix/louice/modules/menu/Menu.swf') );
                res.push( new Module(ContentType.BARCODE_PRINT_JOB_COLLECTION, 'com/cenix/louice/modules/barcodecollection/BarcodeCollection.swf') );
                res.push( new Module(ContentType.CONTAINER_SPECS_COLLECTION, 'com/cenix/louice/modules/containerspecscollection/ContainerSpecsCollection.swf') );
                res.push( new Module(ContentType.DEVICE_COLLECTION, 'com/cenix/louice/modules/devicecollection/DeviceCollection.swf') );
                res.push( new Module(ContentType.DEVICE_MEMBER, 'com/cenix/louice/modules/devicemember/DeviceMember.swf') );
                res.push( new Module(ContentType.DEVICE_TYPE_COLLECTION, 'com/cenix/louice/modules/devicetypecollection/DeviceTypeCollection.swf') );
                res.push( new Module(ContentType.DEVICE_TYPE_MEMBER, 'com/cenix/louice/modules/devicetypemember/DeviceTypeMember.swf') );
                res.push( new Module(ContentType.GENE_COLLECTION, 'com/cenix/louice/modules/genecollection/GeneCollection.swf') );
                res.push( new Module(ContentType.GENE_MEMBER, 'com/cenix/louice/modules/genemember/GeneMember.swf') );
                res.push( new Module(ContentType.EXPERIMENT_DESIGN_RACK_MEMBER, 'com/cenix/louice/modules/experimentdesignrackmember/ExperimentDesignRackMember.swf') );
                res.push( new Module(ContentType.EXPERIMENT_JOB_MEMBER, 'com/cenix/louice/modules/experimentjobmember/ExperimentJobMember.swf') );
                res.push( new Module(ContentType.EXPERIMENT_METADATA_COLLECTION, 'com/cenix/louice/modules/experimentmetadatacollection/ExperimentMetaDataCollection.swf') );
                res.push( new Module(ContentType.EXPERIMENT_METADATA_MEMBER, 'com/cenix/louice/modules/experimentmetadatamember/ExperimentMetaDataMember.swf') );
                res.push( new Module(ContentType.ISO_REQUEST_COLLECTION, 'com/cenix/louice/modules/isorequestcollection/IsoRequestCollection.swf') );
                res.push( new Module(ContentType.ISO_REQUEST_MEMBER, 'com/cenix/louice/modules/isorequestmember/IsoRequestMember.swf') );
                res.push( new Module(ContentType.ITEM_STATUS_COLLECTION, 'com/cenix/louice/modules/itemstatuscollection/ItemStatusCollection.swf') );
                res.push( new Module(ContentType.ITEM_STATUS_MEMBER, 'com/cenix/louice/modules/itemstatusmember/ItemStatusMember.swf') );
                res.push( new Module(ContentType.LOCATION_TYPE_COLLECTION, 'com/cenix/louice/modules/locationtypecollection/LocationTypeCollection.swf') );
                res.push( new Module(ContentType.LOCATION_TYPE_MEMBER, 'com/cenix/louice/modules/locationtypemember/LocationTypeMember.swf') );
                res.push( new Module(ContentType.LOCATION_COLLECTION, 'com/cenix/louice/modules/locationcollection/LocationCollection.swf') );
                res.push( new Module(ContentType.LOCATION_MEMBER, 'com/cenix/louice/modules/locationmember/LocationMember.swf') );
                res.push( new Module(ContentType.MOLECULE_DESIGN_COLLECTION, 'com/cenix/louice/modules/moleculedesigncollection/MoleculeDesignCollection.swf') );
                res.push( new Module(ContentType.MOLECULE_DESIGN_MEMBER, 'com/cenix/louice/modules/moleculedesignmember/MoleculeDesignMember.swf') );
				res.push( new Module(ContentType.MOLECULE_DESIGN_POOL_COLLECTION, 'com/cenix/louice/modules/moleculedesignpoolcollection/MoleculeDesignPoolCollection.swf') );
				res.push( new Module(ContentType.MOLECULE_DESIGN_POOL_MEMBER, 'com/cenix/louice/modules/moleculedesignpoolmember/MoleculeDesignPoolMember.swf') );
                res.push( new Module(ContentType.MOLECULE_TYPE_COLLECTION, 'com/cenix/louice/modules/moleculetypecollection/MoleculeTypeCollection.swf') );
                res.push( new Module(ContentType.MOLECULE_TYPE_MEMBER, 'com/cenix/louice/modules/moleculetypemember/MoleculeTypeMember.swf') );
                res.push( new Module(ContentType.ORGANIZATION_COLLECTION, 'com/cenix/louice/modules/organizationcollection/OrganizationCollection.swf') );
                res.push( new Module(ContentType.ORGANIZATION_MEMBER, 'com/cenix/louice/modules/organizationmember/OrganizationMember.swf') );
                res.push( new Module(ContentType.PLATE_MEMBER, 'com/cenix/louice/modules/platemember/PlateMember.swf') );
                res.push( new Module(ContentType.PLATE_SPECS_MEMBER, 'com/cenix/louice/modules/platespecsmember/PlateSpecsMember.swf') );
                res.push( new Module(ContentType.PROJECT_COLLECTION, 'com/cenix/louice/modules/projectcollection/ProjectCollection.swf') );
                res.push( new Module(ContentType.PROJECT_MEMBER, 'com/cenix/louice/modules/projectmember/ProjectMember.swf') );
                res.push( new Module(ContentType.RACK_COLLECTION, 'com/cenix/louice/modules/rackcollection/RackCollection.swf') );
                res.push( new Module(ContentType.RACK_SPECS_COLLECTION, 'com/cenix/louice/modules/rackspecscollection/RackSpecsCollection.swf') );
                res.push( new Module(ContentType.RACK_SHAPE_COLLECTION, 'com/cenix/louice/modules/rackshapecollection/RackShapeCollection.swf') );
                res.push( new Module(ContentType.RACK_SHAPE_MEMBER, 'com/cenix/louice/modules/rackshapemember/RackShapeMember.swf') );
                res.push( new Module(ContentType.SPECIES_COLLECTION, 'com/cenix/louice/modules/speciescollection/SpeciesCollection.swf') );
                res.push( new Module(ContentType.SPECIES_MEMBER, 'com/cenix/louice/modules/speciesmember/SpeciesMember.swf') );
                res.push( new Module(ContentType.STOCK_INFO_COLLECTION, 'com/cenix/louice/modules/stockinfocollection/StockInfoCollection.swf') );
                res.push( new Module(ContentType.STOCK_INFO_MEMBER, 'com/cenix/louice/modules/stockinfomember/StockInfoMember.swf') );
                res.push( new Module(ContentType.TUBE_COLLECTION, 'com/cenix/louice/modules/tubecollection/TubeCollection.swf') );
                res.push( new Module(ContentType.TUBE_MEMBER, 'com/cenix/louice/modules/tubemember/TubeMember.swf') );
                res.push( new Module(ContentType.TUBE_RACK_MEMBER, 'com/cenix/louice/modules/tuberackmember/TubeRackMember.swf') );
                res.push( new Module(ContentType.TUBE_RACK_SPECS_MEMBER, 'com/cenix/louice/modules/tuberackspecsmember/TubeRackSpecsMember.swf') );
                res.push( new Module(ContentType.TUBE_SPECS_MEMBER, 'com/cenix/louice/modules/tubespecsmember/TubeSpecsMember.swf') );
                res.push( new Module(ContentType.WELL_SPECS_MEMBER, 'com/cenix/louice/modules/wellspecsmember/WellSpecsMember.swf') );
                res.push( new Module(ContentType.USER_MEMBER, 'com/cenix/louice/modules/usermember/UserMember.swf') );
            return res;
        }


        public override function get schemaMappings():Vector.<SchemaModelEntry>
        {
            var res:Vector.<SchemaModelEntry> = new Vector.<SchemaModelEntry>();
            //            res.push( new SchemaModelEntry("http://schemata.cenix-bioscience.com/shared", "Link",Link, "/schemata/Shared.xsd") );
                res.push( new SchemaModelEntry("barcode_label_pair", "http://schemata.cenix-bioscience.com/barcodeprintjob", "BarcodeLabelPair",BarcodeLabelPairMember) );
                res.push( new SchemaModelEntry("barcode_print_job", "http://schemata.cenix-bioscience.com/barcodeprintjob", "BarcodePrintJob",BarcodePrintJobMember, "/schemata/BarcodePrintJob.xsd") );
                res.push( new SchemaModelEntry("chemical_structure", "http://schemata.cenix-bioscience.com/chemicalstructure", "ChemicalStructure",ChemicalStructureMember, "/schemata/ChemicalStructure.xsd") );
                res.push( new SchemaModelEntry("chemical_structure_type", "http://schemata.cenix-bioscience.com/chemicalstructuretype", "ChemicalStructureType",ChemicalStructureTypeMember, "/schemata/ChemicalStructureType.xsd") );
                res.push( new SchemaModelEntry("container", "http://schemata.cenix-bioscience.com/container", "Container",ContainerMember, "/schemata/Container.xsd") );
                res.push( new SchemaModelEntry("container_specs", "http://schemata.cenix-bioscience.com/containerspecs", "ContainerSpecs",ContainerSpecsMember, "/schemata/ContainerSpecs.xsd") );
                res.push( new SchemaModelEntry("device", "http://schemata.cenix-bioscience.com/device", "Device",DeviceMember, "/schemata/Device.xsd") );
                res.push( new SchemaModelEntry("devicetype", "http://schemata.cenix-bioscience.com/devicetype", "DeviceType",DeviceTypeMember, "/schemata/DeviceType.xsd") );
                res.push( new SchemaModelEntry("experiment_job", "http://schemata.cenix-bioscience.com/job", "ExperimentJob",ExperimentJobMember) );
                res.push( new SchemaModelEntry("experiment", "http://schemata.cenix-bioscience.com/experiment", "Experiment",ExperimentMember, "/schemata/Experiment.xsd") );
                res.push( new SchemaModelEntry("experiment_metadata", "http://schemata.cenix-bioscience.com/experimentmetadata", "ExperimentMetaData",ExperimentMetaDataMember, "/schemata/ExperimentMetaData.xsd") );
                res.push( new SchemaModelEntry("experiment_metadata_type", "http://schemata.cenix-bioscience.com/experimentmetadatatype", "ExperimentMetaDataType",ExperimentMetaDataTypeMember, "/schemata/ExperimentMetaDataType.xsd") );
                res.push( new SchemaModelEntry("experimentdesign", "http://schemata.cenix-bioscience.com/experimentdesign", "ExperimentDesign",ExperimentDesignMember, "/schemata/ExperimentDesign.xsd") );
                res.push( new SchemaModelEntry("experimentdesignrack", "http://schemata.cenix-bioscience.com/experimentdesignrack", "ExperimentDesignRack",ExperimentDesignRackMember, "/schemata/ExperimentDesignRack.xsd") );
                res.push( new SchemaModelEntry("experiment_rack", "http://schemata.cenix-bioscience.com/experimentrack", "ExperimentRack",ExperimentRackMember, "/schemata/ExperimentRack.xsd") );
                res.push( new SchemaModelEntry("gene", "http://schemata.cenix-bioscience.com/gene", "Gene",GeneMember, "/schemata/Gene.xsd") );
                res.push( new SchemaModelEntry("iso", "http://schemata.cenix-bioscience.com/iso", "Iso",IsoMember, "/schemata/Iso.xsd") );
                res.push( new SchemaModelEntry("iso_job", "http://schemata.cenix-bioscience.com/job", "IsoJob",IsoJobMember) );
                res.push( new SchemaModelEntry("iso_request", "http://schemata.cenix-bioscience.com/isorequest", "IsoRequest",IsoRequestMember, "/schemata/IsoRequest.xsd") );
                res.push( new SchemaModelEntry("iso_sample_stock_rack", "http://schemata.cenix-bioscience.com/isosamplestockrack", "IsoSampleStockRack",IsoSampleStockRackMember, "/schemata/IsoSampleStockRack.xsd") );
                res.push( new SchemaModelEntry("itemstatus", "http://schemata.cenix-bioscience.com/itemstatus", "ItemStatus",ItemStatusMember, "/schemata/ItemStatus.xsd") );
                res.push( new SchemaModelEntry("job", "http://schemata.cenix-bioscience.com/job", "Job",JobMember, "/schemata/Job.xsd") );
                res.push( new SchemaModelEntry("job_type", "http://schemata.cenix-bioscience.com/jobtype", "JobType",JobTypeMember, "/schemata/JobType.xsd") );
                res.push( new SchemaModelEntry("location", "http://schemata.cenix-bioscience.com/location", "Location",LocationMember, "/schemata/Location.xsd" ) );
                res.push( new SchemaModelEntry("location_type", "http://schemata.cenix-bioscience.com/locationtype", "LocationType",LocationTypeMember, "/schemata/LocationType.xsd") );
                res.push( new SchemaModelEntry("molecule_design", "http://schemata.cenix-bioscience.com/moleculedesign", "MoleculeDesign",MoleculeDesignMember, "/schemata/MoleculeDesign.xsd") );
                res.push( new SchemaModelEntry("molecule_design_pool", "http://schemata.cenix-bioscience.com/moleculedesignset", "MoleculeDesignPool",MoleculeDesignPoolMember) );
                res.push( new SchemaModelEntry("molecule_design_pool_set", "http://schemata.cenix-bioscience.com/moleculedesignpoolset", "MoleculeDesignPoolSet",MoleculeDesignPoolSetMember, "/schemata/MoleculeDesignPoolSet.xsd") );
                res.push( new SchemaModelEntry("molecule_design_set", "http://schemata.cenix-bioscience.com/moleculedesignset", "MoleculeDesignSet",MoleculeDesignSetMember, "/schemata/MoleculeDesignSet.xsd") );
                res.push( new SchemaModelEntry("molecule_type", "http://schemata.cenix-bioscience.com/moleculetype", "MoleculeType",MoleculeTypeMember, "/schemata/MoleculeType.xsd") );
                res.push( new SchemaModelEntry("organization", "http://schemata.cenix-bioscience.com/organization", "Organization",OrganizationMember, "/schemata/Organization.xsd") );
                res.push( new SchemaModelEntry("project", "http://schemata.cenix-bioscience.com/project", "Project",ProjectMember, "/schemata/Project.xsd") );
                res.push( new SchemaModelEntry("plate", "http://schemata.cenix-bioscience.com/rack", "Plate",PlateMember) );
                res.push( new SchemaModelEntry("plate_specs", "http://schemata.cenix-bioscience.com/rackspecs", "PlateSpecs",PlateSpecsMember) );
                res.push( new SchemaModelEntry("rack", "http://schemata.cenix-bioscience.com/rack", "Rack",RackMember, "/schemata/Rack.xsd") );
                res.push( new SchemaModelEntry("rack_layout", "http://schemata.cenix-bioscience.com/racklayout", "RackLayout",RackLayoutMember, "/schemata/RackLayout.xsd") );
                res.push( new SchemaModelEntry("rack_position", "http://schemata.cenix-bioscience.com/rackposition", "RackPosition",RackPositionMember, "/schemata/RackPosition.xsd") );
                res.push( new SchemaModelEntry("rack_position_set", "http://schemata.cenix-bioscience.com/rackpositionset", "RackPositionSet",RackPositionSetMember, "/schemata/RackPositionSet.xsd") );
                res.push( new SchemaModelEntry("rack_shape", "http://schemata.cenix-bioscience.com/rackshape", "RackShape",RackShapeMember, "/schemata/RackShape.xsd") );
                res.push( new SchemaModelEntry("rack_specs", "http://schemata.cenix-bioscience.com/rackspecs", "RackSpecs",RackSpecsMember, "/schemata/RackSpecs.xsd") );
                res.push( new SchemaModelEntry("sample_molecule", "http://schemata.cenix-bioscience.com/samplemolecule", "SampleMolecule",SampleMoleculeMember, "/schemata/SampleMolecule.xsd") );
                res.push( new SchemaModelEntry("species", "http://schemata.cenix-bioscience.com/species", "Species",SpeciesMember, "/schemata/Species.xsd") );
                res.push( new SchemaModelEntry("stockinfo", "http://schemata.cenix-bioscience.com/stockinfo", "StockInfo",StockInfoMember, "/schemata/StockInfo.xsd") );
                res.push( new SchemaModelEntry("subproject", "http://schemata.cenix-bioscience.com/subproject", "Subproject",SubprojectMember, "/schemata/Subproject.xsd") );
                res.push( new SchemaModelEntry("tag", "http://schemata.cenix-bioscience.com/tag", "Tag",TagMember, "/schemata/Tag.xsd") );
                res.push( new SchemaModelEntry("tagged_rack_position_set", "http://schemata.cenix-bioscience.com/taggedrackpositionset", "TaggedRackPositionSet",TaggedRackPositionSetMember, "/schemata/TaggedRackPositionSet.xsd") );
                res.push( new SchemaModelEntry("tube-rack", "http://schemata.cenix-bioscience.com/rack", "TubeRack",TubeRackMember) );
                res.push( new SchemaModelEntry("tube_rack_specs", "http://schemata.cenix-bioscience.com/rackspecs", "TubeRackSpecs",TubeRackSpecsMember) );
                res.push( new SchemaModelEntry("user", "http://schemata.cenix-bioscience.com/user", "User",UserMember, "/schemata/User.xsd") );
                res.push( new SchemaModelEntry("user_preferences", "http://schemata.cenix-bioscience.com/userpreferences", "UserPreferences",UserPreferencesMember, "/schemata/UserPreferences.xsd") );
                res.push( new SchemaModelEntry("tube", "http://schemata.cenix-bioscience.com/container", "Tube",TubeMember) );
                res.push( new SchemaModelEntry("tube_specs", "http://schemata.cenix-bioscience.com/containerspecs", "TubeSpecs",TubeSpecsMember) );
                res.push( new SchemaModelEntry("well_specs", "http://schemata.cenix-bioscience.com/containerspecs", "WellSpecs",WellSpecsMember) );
                res.push( new SchemaModelEntry("well", "http://schemata.cenix-bioscience.com/container", "Well",WellMember) );

            return res;
        }
    }
}