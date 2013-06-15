//
//  NSDictionary+GetterExt.h
//  WeSmile
//
//  Created by Rolf Zhang on 13-3-18.
//  Copyright (c) 2013年 Rolf Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (GetterExt)

//解析字符串
-(NSString *)stringForKey:(id)key;
-(NSString *)stringForKey:(id)key defaultValue:(NSString*)fallback;
-(NSString *)stringForKeyPath:(NSString *)keyPath;
-(NSString *)stringForKeyPath:(NSString *)keyPath defaultValue:(NSString*)fallback;

//解析nsnumber
-(NSNumber *)numberForKey:(id)key;
-(NSNumber *)numberForKey:(id)key defaultValue:(NSNumber*)fallback;
-(NSNumber *)numberForKeyPath:(NSString *)keyPath;
-(NSNumber *)numberForKeyPath:(NSString *)keyPath defaultValue:(NSNumber*)fallback;

//解析nsdictionary
-(NSDictionary *)dictionaryForKey:(id)key;
-(NSDictionary *)dictionaryForKey:(id)key defaultValue:(NSDictionary*)fallback;
-(NSDictionary *)dictionaryForKeyPath:(NSString *)keyPath;
-(NSDictionary *)dictionaryForKeyPath:(NSString *)keyPath defaultValue:(NSDictionary*)fallback;

//解析nsarray
-(NSArray *)arrayForKey:(id)key;
-(NSArray *)arrayForKey:(id)key defaultValue:(NSArray*)fallback;
-(NSArray *)arrayForKeyPath:(NSString *)keyPath;
-(NSArray *)arrayForKeyPath:(NSString *)keyPath defaultValue:(NSArray*)fallback;

#pragma mark - Base methods

-(id)objectForKey:(id)key defaultValue:(id)fallback objectClass:(Class)objectClass;
-(id)valueForKeyPath:(NSString *)keyPath defaultValue:(id)fallback objectClass:(Class)objectClass;

@end
