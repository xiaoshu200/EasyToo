//
//  NSArray+FilterExtension.m
//  WeChat Smile
//
//  Created by Rolf Zhang on 13-2-28.
//  Copyright (c) 2013年 Rolf Zhang. All rights reserved.
//

#import "NSArray+FilterExtension.h"

@implementation NSArray (FilterExtension)

-(NSArray *) filteredArrayUsingBlock:(BOOL (^)(id obj))block
{
    NSMutableArray * result = [NSMutableArray arrayWithCapacity:8];
    for (id obj in self) {
        if (block(obj)) {
            [result addObject:obj];
        }
    }
    return result;
}

@end