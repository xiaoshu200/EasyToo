//
//  NSDictionary+GetterExt.m
//  WeSmile
//
//  Created by Rolf Zhang on 13-3-18.
//  Copyright (c) 2013年 Rolf Zhang. All rights reserved.
//

#import "NSDictionary+GetterExt.h"

@implementation NSDictionary (GetterExt)

//解析字符串
-(NSString *)stringForKey:(id)key
{
    return [self stringForKey:key defaultValue:nil];
}

-(NSString *)stringForKey:(id)key defaultValue:(NSString*)fallback
{
    return [self objectForKey:key defaultValue:fallback objectClass:[NSString class]];
}

-(NSString *)stringForKeyPath:(NSString *)keyPath
{
    return [self stringForKeyPath:keyPath defaultValue:nil];
}

-(NSString *)stringForKeyPath:(NSString *)keyPath defaultValue:(NSString*)fallback
{
    return [self valueForKeyPath:keyPath defaultValue:fallback objectClass:[NSString class]];
}

//解析nsnumber
-(NSNumber *)numberForKey:(id)key
{
    return [self numberForKey:key defaultValue:nil];
}

-(NSNumber *)numberForKey:(id)key defaultValue:(NSNumber*)fallback
{
    return [self objectForKey:key defaultValue:fallback objectClass:[NSNumber class]];
}

-(NSNumber *)numberForKeyPath:(NSString *)keyPath
{
    return [self numberForKeyPath:keyPath defaultValue:@0];
}

-(NSNumber *)numberForKeyPath:(NSString *)keyPath defaultValue:(NSNumber*)fallback
{
    return [self valueForKeyPath:keyPath defaultValue:fallback objectClass:[NSNumber class]];
}

//解析nsdictionary
-(NSDictionary *)dictionaryForKey:(id)key
{
    return [self dictionaryForKey:key defaultValue:nil];
}
-(NSDictionary *)dictionaryForKey:(id)key defaultValue:(NSDictionary*)fallback
{
    return [self objectForKey:key
                              defaultValue:fallback
                               objectClass:[NSDictionary class]];
}

-(NSDictionary *)dictionaryForKeyPath:(NSString *)keyPath
{
    return [self dictionaryForKeyPath:keyPath defaultValue:nil];
}

-(NSDictionary *)dictionaryForKeyPath:(NSString *)keyPath defaultValue:(NSDictionary*)fallback
{
    return [self valueForKeyPath:keyPath defaultValue:fallback objectClass:[NSDictionary class]];
}

//解析nsarray
-(NSArray*)arrayForKey:(id)key
{
    return [self arrayForKey:key defaultValue:nil];
}

-(NSArray *)arrayForKey:(id)key defaultValue:(NSArray*)fallback
{
    return [self objectForKey:key defaultValue:fallback objectClass:[NSArray class]];
}

-(NSArray *)arrayForKeyPath:(NSString *)keyPath
{
    return [self arrayForKeyPath:keyPath defaultValue:nil];
}

-(NSArray *)arrayForKeyPath:(NSString *)keyPath defaultValue:(NSArray*)fallback
{
    return [self valueForKeyPath:keyPath defaultValue:fallback objectClass:[NSArray class]];
}

#pragma mark - Base methods

-(id)objectForKey:(id)key defaultValue:(id)fallback objectClass:(Class)objectClass
{
    id result = [self objectForKey:key];
    
    if (!result || ![result isKindOfClass:objectClass])
    {
        result = fallback;
    }
    return result;
}

-(id)valueForKeyPath:(NSString *)keyPath defaultValue:(id)fallback objectClass:(Class)objectClass
{
    id result = [self valueForKeyPath:keyPath];
    
    if (!result || ![result isKindOfClass:objectClass])
    {
        result = fallback;
    }
    return result;
}

@end
