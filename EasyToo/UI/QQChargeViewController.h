//
//  QQChargeViewController.h
//  QQCharge
//
//  Created by linshengqin on 13-6-10.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface QQChargeViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate,UIPickerViewDataSource>
{
    UITextField *text_value;
    NSArray *pickerArray;
    UIPickerView *selectPicker;
}
@property (strong,nonatomic) UITextField *qqNumber;

@end
