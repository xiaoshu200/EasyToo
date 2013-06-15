//
//  AFHTTPClient+AESJSON.m
//  WeSmile
//
//  Created by Rolf Zhang on 13-4-1.
//  Copyright (c) 2013年 Rolf Zhang. All rights reserved.
//

#import "AFHTTPClient+AESJSON.h"
#import "AESEncipherer.h"
#import "JSONKit.h"

@implementation AFHTTPClient (AESJSON)

- (NSURLRequest *)requestPostByAESEncodedJsonWithPath:(NSString *)path
                                           parameters:(NSDictionary *)parameters
{
	return [self requestByJsonWithMethod:@"POST" path:path parameters:parameters AESEncoded:YES];
}

- (NSURLRequest *)requestPostByJsonWithPath:(NSString *)path
                                 parameters:(NSDictionary *)parameters
{
	return [self requestByJsonWithMethod:@"POST" path:path parameters:parameters AESEncoded:NO];
}

- (NSURLRequest *)requestByJsonWithPath:(NSString *)path
                               parameters:(NSDictionary *)parameters
{
    return [self requestByJsonWithMethod:@"GET" path:path parameters:parameters AESEncoded:NO];
}

- (NSURLRequest *)requestByJsonWithMethod:(NSString *)method
                                     path:(NSString *)path
                               parameters:(NSDictionary *)parameters
                               AESEncoded:(BOOL)isEncoded
{
    NSMutableURLRequest * request = [self requestWithMethod:method path:path parameters:nil];
    NSString * content = [parameters JSONString];
    if (isEncoded) {
        content = [AESEncipherer encode:content];
    }
    [request setHTTPBody:[content dataUsingEncoding:self.stringEncoding]];
	return request;
}

@end
