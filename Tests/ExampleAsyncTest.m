#import <GHUnitIOS/GHUnit.h>
#import "ModelObject.h"

@interface ExampleAsyncTest : GHAsyncTestCase { }

@property (nonatomic, retain) ModelObject* _model1;
@property (nonatomic, retain) ModelObject* _model2;

@end

@implementation ExampleAsyncTest

@synthesize _model1;
@synthesize _model2;

- (void)setUp {
	// Run before each test method
	ModelObject* model1 = [[ModelObject alloc] init];
	model1.delegate = self;
	self._model1 = model1;
	[model1 release];
	
	ModelObject* model2 = [[ModelObject alloc] init];
	model2.delegate = self;
	self._model2 = model2;
	[model2 release];
}

- (void)tearDown {
	// Run after each test method
	[_model1 release], _model1 = nil;
	[_model2 release], _model2 = nil;
}

- (void)testAsync1 {
	//非同期試験の前準備
	[self prepare];

	//非同期通信の実行
	[_model1 sendRequest];
	
	//非同期通信の応答の待機
	[self waitForStatus:kGHUnitWaitStatusSuccess timeout:60.0];
}

//--------------------------------------------------------------//
#pragma mark -- ModelObjectDelegate --
//--------------------------------------------------------------//
- (void)modelObjectDidFinishLoading:(ModelObject *)modelObject {
	//非同期通信の応答の確認
	[self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testAsync1)];
}

@end
