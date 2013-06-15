//
//  NetGameViewController.h
//  QQCharge
//
//  Created by linshengqin on 13-6-11.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DropDownList;

@interface NetGameViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

{
    NSArray *pickerArray;
    UIPickerView *selectPicker;
}
@property (strong,nonatomic) UITextField *gameType;
@property (strong,nonatomic) UITextField *cardType;
@property (strong,nonatomic) UITextField *label_num ;
@property (strong,nonatomic) UITextField *cardNum;
@property (strong,nonatomic) UITextField *account;
@property (strong,nonatomic) UITextField *account2;
@end
