//
//  ModelObject.h
//  HelloWorld3
//
//  Created by  on 11/07/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//#import <Foundation/Foundation.h>

@interface ModelObject : NSObject {
	NSURLConnection* _urlConnection;
	NSMutableData* _receivedData;
}

//プロパティ
@property (nonatomic, assign) id delegate; //Assign
@property (nonatomic, retain) NSString* string1;

//URLリクエストを送信する
- (void)sendRequest;

@end

// デリゲートメソッド
@interface NSObject (ModelObjectDelegate)

//- (void)parser:(RSSResponseParser*)parser didReceiveResponse:(NSURLResponse*)response;
//- (void)parser:(RSSResponseParser*)parser didReceiveData:(NSData*)data;
- (void)modelObjectDidFinishLoading:(ModelObject *)modelObject;
//- (void)parser:(RSSResponseParser*)parser didFailWithError:(NSError*)error;
//- (void)parserDidCancel:(RSSResponseParser*)parser;

@end
