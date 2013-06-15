//
//  DeviceUtil.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-10.
//
//

#import "DeviceUtil.h"

@implementation DeviceUtil

+ (CGFloat)getScreenWidth
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)getScreenHeight
{
    return [[UIScreen mainScreen] bounds].size.height;
}

@end
