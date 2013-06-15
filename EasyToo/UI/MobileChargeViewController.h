//
//  MobileChargeViewController.h
//  EasyToo
//
//  Created by hydb on 13-6-11.
//
//

#import <UIKit/UIKit.h>
#import "DropDownList.h"
#import "MobileChargeConfirmViewController.h"

@interface MobileChargeViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *mobileTF;
@property (nonatomic, strong) DropDownList *cashTF;

@end
