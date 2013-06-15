//
//  QQChargeViewController.h
//  QQCharge
//
//  Created by linshengqin on 13-6-10.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface QQChargeViewController : UIViewController <UITextFieldDelegate, NIDropDownDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    UITextField *text_value;
    NSArray *pickerArray;
    UIPickerView *selectPicker;
}
@property (strong,nonatomic) UITextField *qqNumber;
@property (strong,nonatomic) UITextField *qqNumber2;
@property (retain, nonatomic) NIDropDown *dropDown ;

@end
