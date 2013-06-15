//
//  AFHTTPClient+AESJSON.h
//  WeSmile
//
//  Created by Rolf Zhang on 13-4-1.
//  Copyright (c) 2013年 Rolf Zhang. All rights reserved.
//

#import "AFHTTPClient.h"

@interface AFHTTPClient (AESJSON)
- (NSURLRequest *)requestPostByAESEncodedJsonWithPath:(NSString *)path
                                           parameters:(NSDictionary *)parameters;
- (NSURLRequest *)requestPostByJsonWithPath:(NSString *)path
                                 parameters:(NSDictionary *)parameters;
- (NSURLRequest *)requestByJsonWithPath:(NSString *)path
                             parameters:(NSDictionary *)parameters;
- (NSURLRequest *)requestByJsonWithMethod:(NSString *)method
                                     path:(NSString *)path
                               parameters:(NSDictionary *)parameters
                               AESEncoded:(BOOL)isEncoded;
@end
