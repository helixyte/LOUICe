package flexUnitTests.query
{
    import org.everest.flex.query.QueryParser;
    import org.everest.flex.query.Criterion;

    import flexunit.framework.Assert;

    public class QueryParserTest
    {

        [Test]
        public function testOneCriterionQuery():void{

            var expr:String = 'name:equal-to:"Nikos"';
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();

            Assert.assertNotNull(result);;
            Assert.assertEquals(result.length, 1);

            var crit:Criterion = result[0];
            Assert.assertEquals(crit.name, 'name');;
            Assert.assertEquals(crit.operator, 'equal-to');;
            Assert.assertEquals(crit.value[0], 'Nikos');

        }


        [Test]
        public function testOneCriterionQueryWithManyValues():void{
            var expr:String = 'name:equal-to:"Nikos","Oliver","Andrew"';
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            Assert.assertEquals(result.length, 1);
            var crit:Criterion = result[0];
            Assert.assertEquals(crit.name, 'name');
            Assert.assertEquals(crit.operator, 'equal-to');
            Assert.assertEquals(crit.value[0], 'Nikos');
            Assert.assertEquals(crit.value[1], 'Oliver');
            Assert.assertEquals(crit.value[2], 'Andrew');
        }

        [Test]
        public function testMultipleCriterionQuery():void{
            var expr:String = 'name:starts-with:"Ni"~name:ends-with:"kos"';
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            Assert.assertEquals(result.length, 2);



            for each (var criterion:Criterion in result){

                Assert.assertEquals(criterion.name, 'name');
                var operator:String = criterion.operator;
                switch (operator) {
                    case 'starts-with':
                        Assert.assertEquals(criterion.value[0], 'Ni');
                    break;
                    case 'ends-with':
                        Assert.assertEquals(criterion.value[0], 'kos');
                    break;
                }
            }


        }


        [Test]
        public function testOneCriterionQueryWithIntegers():void{
            var expr:String = 'age:equal-to:34,44'
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            Assert.assertEquals(result.length, 1);
            var crit:Criterion = result[0];
            Assert.assertEquals(crit.name, 'age');
            Assert.assertEquals(crit.operator, 'equal-to');
            Assert.assertEquals(crit.value[0], 34);
            Assert.assertEquals(crit.value[1], 44);
        }

        [Test]
        public function testOneCriterionQueryWithIntegerScientificFormat():void{
            var expr:String = 'volume:greater-than:5e+05'
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            Assert.assertEquals(result.length, 1);
            var crit:Criterion = result[0];
            Assert.assertEquals(crit.name, 'volume');
            Assert.assertEquals(crit.operator, 'greater-than');
            Assert.assertEquals(crit.value[0], 500000);
        }

        [Test]
        public function testOneCriterionQueryWithFloats():void{
            var expr:String = 'cost:greater-than:3.14'
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            Assert.assertEquals(result.length, 1);
            var crit:Criterion = result[0];
            Assert.assertEquals(crit.name, 'cost');
            Assert.assertEquals(crit.operator, 'greater-than');
            Assert.assertEquals(crit.value[0], 3.14);
        }


        [Test]
        public function testOneCriterionQueryWithFloatsScientificFormat():void{
            var expr:String = 'volume:greater-than:5.5e-05'
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            Assert.assertEquals(result.length, 1);
            var crit:Criterion = result[0];
            Assert.assertEquals(crit.name, 'volume');
            Assert.assertEquals(crit.operator, 'greater-than');
            Assert.assertEquals(crit.value[0], 5.5e-05);
        }

        [Test]
        public function testOneCriterionQueryWith_floats_scientific_format_negative():void{
            var expr:String = 'volume:greater-than:5e-05'
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            Assert.assertEquals(result.length, 1);
            var crit:Criterion = result[0];
            Assert.assertEquals(crit.name, 'volume');
            Assert.assertEquals(crit.operator, 'greater-than');
            Assert.assertEquals(crit.value[0], 5e-05);
        }

        [Test]
        public function testOneCriterionQueryWithUrl():void{
<<<<<<< HEAD
            var expr:String = 'species:equal-to:http://thelma/species/human';
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            var crit:Criterion = result[0];
            Assert.assertEquals(crit.value[0], 'http://thelma/species/human');
=======
            var expr:String = 'species:equal-to:http://thelma.com/species/human';
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            var crit:Criterion = result[0];
            Assert.assertEquals(crit.value[0], 'http://thelma.com/species/human');
>>>>>>> master
        }

        [Test]
        public function testMultipleCriterionQueryWithUrl():void{

<<<<<<< HEAD
            var expr:String = 'species:equal-to:http://thelma/species/human,http://thelma/species/rat';
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            var crit:Criterion = result[0];
            Assert.assertEquals(crit.value[0], 'http://thelma/species/human');
            Assert.assertEquals(crit.value[1], 'http://thelma/species/rat');
=======
            var expr:String = 'species:equal-to:http://thelma.com/species/human,http://thelma.com/species/rat';
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            var crit:Criterion = result[0];
            Assert.assertEquals(crit.value[0], 'http://thelma.com/species/human');
            Assert.assertEquals(crit.value[1], 'http://thelma.com/species/rat');
>>>>>>> master
        }

        [Test]
        public function testMultipleCriterionQueryWithDifferentValueTypes():void{
            var expr:String = 	'name:starts-with:"Ni","Ol","An"~' +
                                'age:equal-to:34,44,54~' +
                                'phone-number:starts-with:1,2,3~' +
                                'discount:equal-to:-20,-30'

            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            Assert.assertEquals(result.length, 4);

            for each (var criterion:Criterion in result){

                var name:String = criterion.name;
                switch (name) {
                    case 'name':
                            Assert.assertEquals(criterion.operator, 'starts-with');
                            Assert.assertEquals(criterion.value[0], 'Ni');
                            Assert.assertEquals(criterion.value[1], 'Ol');
                            Assert.assertEquals(criterion.value[2], 'An');
                        break;
                    case 'age':
                            Assert.assertEquals(criterion.operator, 'equal-to');
                            Assert.assertEquals(criterion.value[0], 34);
                            Assert.assertEquals(criterion.value[1], 44);
                            Assert.assertEquals(criterion.value[2], 54);
                        break;
                    case 'phone-number':
                            Assert.assertEquals(criterion.operator, 'starts-with');
                            Assert.assertEquals(criterion.value[0], 1);
                            Assert.assertEquals(criterion.value[1], 2);
                            Assert.assertEquals(criterion.value[2], 3);
                        break;
                    case 'discount':
                            Assert.assertEquals(criterion.operator, 'equal-to');
                            Assert.assertEquals(criterion.value[0], -20);
                            Assert.assertEquals(criterion.value[1], -30);
                        break;

                    default:
                        Assert.assertTrue(false);

                }
            }

        }

        [Test]
        public function testOne_textCriterionQueryWithSpaces():void{
            var expr:String = 'name:equal-to:"Nikos Papagrigoriou"'
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            var crit:Criterion = result[0];
            Assert.assertEquals(crit.value[0], 'Nikos Papagrigoriou');
        }

        [Test]
        public function testOneCriterionWithOnlyComma():void{
            var expr:String = 'name:equal-to:,'
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();
            var crit:Criterion = result[0];
            Assert.assertEquals(crit.value.length, 0);
        }

        [Test]
        public function testMultipleCriterionQueryWithMisplacedCommas():void{
            var expr:String = 'name:starts-with:"Ni","Ol", ,"An"~' +
            'age:equal-to:34, 44, 54,~' +
            'phone-number:starts-with:,1,2,3~' +
            'discount:equal-to:,-20,,-30,'
            var result:Vector.<Criterion> = QueryParser.parse(expr).list();

            Assert.assertEquals(result.length, 4);


            for each (var criterion:Criterion in result){

                var name:String = criterion.name;
                switch (name) {
                    case 'name':
                        Assert.assertEquals(criterion.operator, 'starts-with');
                        Assert.assertEquals(criterion.value[0], 'Ni');
                        Assert.assertEquals(criterion.value[1], 'Ol');
                        Assert.assertEquals(criterion.value[2], 'An');
                        break;
                    case 'age':
                        Assert.assertEquals(criterion.operator, 'equal-to');
                        Assert.assertEquals(criterion.value[0], 34);
                        Assert.assertEquals(criterion.value[1], 44);
                        Assert.assertEquals(criterion.value[2], 54);
                        break;
                    case 'phone-number':
                        Assert.assertEquals(criterion.operator, 'starts-with');
                        Assert.assertEquals(criterion.value[0], 1);
                        Assert.assertEquals(criterion.value[1], 2);
                        Assert.assertEquals(criterion.value[2], 3);
                        break;
                    case 'discount':
                        Assert.assertEquals(criterion.operator, 'equal-to');
                        Assert.assertEquals(criterion.value[0], -20);
                        Assert.assertEquals(criterion.value[1], -30);
                        break;

                    default:
                        Assert.assertTrue(false);

                }
            }

        }
    }
}