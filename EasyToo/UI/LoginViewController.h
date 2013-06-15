//
//  LoginViewController.h
//  EasyToo
//
//  Created by hydb on 13-6-11.
//
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *nameTF;
@property (nonatomic, strong) UITextField *passwordTF;

@end
