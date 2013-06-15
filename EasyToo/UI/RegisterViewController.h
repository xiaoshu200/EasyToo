//
//  RegisterViewController.h
//  EasyToo
//
//  Created by hydb on 13-6-11.
//
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *nameTF;
@property (nonatomic, strong) UITextField *passwordTF;
@property (nonatomic, strong) UITextField *mobileTF;

@end
