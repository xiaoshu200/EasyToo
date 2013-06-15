//
//  AESEncipherer.h
//  WeSmile
//
//  Created by Rolf Zhang on 13-4-1.
//  Copyright (c) 2013年 Rolf Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AESEncipherer : NSObject

+(NSString *)encode:(NSString *)text;
+(NSString *)decode:(NSString *)cipher;
@end
