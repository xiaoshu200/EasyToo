//
//  PlainViewController.h
//  EasyToo
//
//  Created by hydb on 13-6-10.
//
//

#import <UIKit/UIKit.h>
#import "TicketDetailViewController.h"

@interface PlainViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *startTF;
@property (nonatomic, strong) UITextField *arriveTF;
@property (nonatomic, strong) UITextField *companyTF;
@property (nonatomic, strong) UITextField *dateTF;

@end
