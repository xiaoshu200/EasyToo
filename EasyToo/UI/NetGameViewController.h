//
//  NetGameViewController.h
//  QQCharge
//
//  Created by linshengqin on 13-6-11.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DropDownList;

@interface NetGameViewController : UIViewController<UITextFieldDelegate>

@property (strong,nonatomic) DropDownList *gameType;
@property (strong,nonatomic) DropDownList *cardType;
@property (strong,nonatomic) DropDownList *label_num ;
@property (strong,nonatomic) DropDownList *cardNum;
@property (strong,nonatomic) UITextField *account;
@property (strong,nonatomic) UITextField *account2;
@end
