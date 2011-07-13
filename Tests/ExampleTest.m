#import <GHUnitIOS/GHUnit.h>
#import "ModelObject.h"

@interface ExampleTest : GHTestCase { }

@property (nonatomic, retain) ModelObject* _model1;
@property (nonatomic, retain) ModelObject* _model2;

@end

@implementation ExampleTest

@synthesize _model1;
@synthesize _model2;

- (void)setUp {
	// Run before each test method
	ModelObject* model1 = [[ModelObject alloc] init];
	self._model1 = model1;
	[model1 release];
	
	ModelObject* model2 = [[ModelObject alloc] init];
	self._model2 = model2;
	[model2 release];
}

- (void)tearDown {
	// Run after each test method
	[_model1 release], _model1 = nil;
	[_model2 release], _model2 = nil;
}

- (void)testBar1 {
	ModelObject* modelA = [[ModelObject alloc] init];
	ModelObject* modelB = [[ModelObject alloc] init];

	GHAssertNotEqualObjects(modelA, modelB, nil);

	[modelA release];
	[modelB release];
}

- (void)testBar2 {
	_model1.string1 = @"foobar";
	_model2.string1 = @"foobar";
	
	GHAssertEqualStrings(_model1.string1, _model2.string1, nil);
}

- (void)testFail1 {
	_model1.string1 = @"foobar";
	_model2.string1 = @"fooba";
	
	GHAssertEqualStrings(_model1.string1, _model2.string1, nil);
}

@end
