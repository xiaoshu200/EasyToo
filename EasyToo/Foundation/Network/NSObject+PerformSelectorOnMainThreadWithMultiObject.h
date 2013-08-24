//
//  NSObject+PerformSelectorOnMainThreadWithMultiObject.h
//  HKWeibo
//
//  Created by grayson on 12-6-29.
//  Copyright (c) 2012年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PerformSelectorOnMainThreadWithMultiObject)
- (void) performSelectorOnMainThread:(SEL)selector withObject:(id)arg1 withObject:(id)arg2 waitUntilDone:(BOOL)wait;
- (void) performSelectorOnMainThread:(SEL)selector withObject:(id)arg1 withObject:(id)arg2 withObject:(id)arg3 waitUntilDone:(BOOL)wait;
@end
