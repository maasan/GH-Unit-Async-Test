//
//  HelloWorld3ViewController.m
//  HelloWorld3
//
//  Created by  on 11/07/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HelloWorld3ViewController.h"
#import "ModelObject.h"

//--------------------------------------------------------------//
#pragma mark -- プライベートインスタンス変数の宣言 --
//--------------------------------------------------------------//
@interface HelloWorld3ViewController ()

@property (nonatomic, retain) ModelObject* _model01;

@end

@implementation HelloWorld3ViewController

//--------------------------------------------------------------//
#pragma mark -- プロパティ --
//--------------------------------------------------------------//
//パブリック

//プライベート
@synthesize _model01;

//--------------------------------------------------------------//
#pragma mark -- 初期化 --
//--------------------------------------------------------------//

//--------------------------------------------------------------//
#pragma mark -- ビュー --
//--------------------------------------------------------------//
- (void)viewDidLoad {
	// 親クラスのメソッドを呼び出す
    [super viewDidLoad];

	ModelObject* model01 = [[ModelObject alloc] init];
	self._model01 = model01;
	[model01 release];
}

- (void)viewDidUnload {
	[_model01 release], _model01 = nil;
	
	// 親クラスのメソッドを呼び出す
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//--------------------------------------------------------------//
#pragma mark -- アクション --
//--------------------------------------------------------------//
- (IBAction)buttonPressed:(id)sender {
	[_model01 sendRequest];
}

@end
