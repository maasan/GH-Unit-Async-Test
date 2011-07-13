//
//  ModelObject.m
//  HelloWorld3
//
//  Created by  on 11/07/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ModelObject.h"

@implementation ModelObject

//--------------------------------------------------------------//
#pragma mark -- プロパティ --
//--------------------------------------------------------------//
//パブリック
@synthesize delegate = _delegate;
@synthesize string1 = _string1;

//プライベート

//--------------------------------------------------------------//
#pragma mark -- 初期化 --
//--------------------------------------------------------------//
- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
}

- (void)dealloc {
	//インスタンス変数を解放する
	_delegate = nil; //Assign
	[_string1 release], _string1 = nil;

	//親クラスのメソッドを呼び出す
	[super dealloc];
}

//--------------------------------------------------------------//
#pragma mark -- URLリクエストを送信する --
//--------------------------------------------------------------//
- (void)sendRequest {
	// リクエストの作成
	NSString* urlString = @"http://www.yahoo.co.jp/";
	NSURLRequest* urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString] 
												cachePolicy:NSURLRequestUseProtocolCachePolicy 
											timeoutInterval:60.0];

	// NSURLConnectionオブジェクトの作成
	_urlConnection = [[NSURLConnection connectionWithRequest:urlRequest delegate:self] retain];
	NSLog(@"hogehoge");
}

//--------------------------------------------------------------//
#pragma mark -- NSURLConnectionDelegate --
//--------------------------------------------------------------//
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	// データバッファの作成
	[_receivedData release], _receivedData = nil;
	_receivedData = [[NSMutableData data] retain];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // ダウンロード済みデータを追加
	[_receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSLog(@"Succeeded! Received %d bytes of data", [_receivedData length]);
	
	//デリゲートに通知
	if ([_delegate respondsToSelector:@selector(modelObjectDidFinishLoading:)]) {
		[_delegate modelObjectDidFinishLoading:self];
	}
	
	// NSURLConnectionオブジェクトを解放
	[_urlConnection release], _urlConnection = nil;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	NSLog(@"Connection failed! Error - %@ %@", 
		  [error localizedDescription], 
		  [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
	
    // ダウンロード済みデータを解放
	[_receivedData release], _receivedData = nil;

	// NSURLConnectionオブジェクトを解放
	[_urlConnection release], _urlConnection = nil;
}

@end
