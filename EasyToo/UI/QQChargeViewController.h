//
//  QQChargeViewController.h
//  QQCharge
//
//  Created by linshengqin on 13-6-10.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//
@class DropDownList;
#import <UIKit/UIKit.h>

@interface QQChargeViewController : UIViewController <UITextFieldDelegate>
@property (strong,nonatomic) UITextField *qqNumber;
@property (strong,nonatomic) UITextField *qqNumber2;
@property (strong,nonatomic) DropDownList *label_num ;
@end
