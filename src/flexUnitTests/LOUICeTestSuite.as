package flexUnitTests
{
    import flexUnitTests.query.QueryParserTest;
    import flexUnitTests.visitors.CompositeCQLGenerationVisitorTest;
    import flexUnitTests.visitors.NegationCQLGenerationVisitorTest;
    import flexUnitTests.visitors.ValueBoundCQLGenerationVisitorTest;

    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class LOUICeTestSuite
    {

        // Visitor Test Cases
        public var valueBoundCQLGenerationVisitorTest:ValueBoundCQLGenerationVisitorTest;
        public var compositeCQLGenerationVisitorTest:CompositeCQLGenerationVisitorTest;
        public var negationCQLGenerationVisitorTest:NegationCQLGenerationVisitorTest;



        // QueryParser Test Case
        public var queryParserTest:QueryParserTest;
    }
}