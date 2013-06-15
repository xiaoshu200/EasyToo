//
//  NSArray+FilterExtension.h
//  WeChat Smile
//
//  Created by Rolf Zhang on 13-2-28.
//  Copyright (c) 2013年 Rolf Zhang. All rights reserved.
//



@interface NSArray (FilterExtension)

-(NSArray *) filteredArrayUsingBlock:(BOOL (^)(id obj))block;
@end
