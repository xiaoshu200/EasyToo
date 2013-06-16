//
//  HotViewController.h
//  EasyToo
//
//  Created by linshengqin on 13-6-11.
//
//

#import <UIKit/UIKit.h>
#import "DropDownList.h"
@interface HotViewController : UIViewController <UITextFieldDelegate>
{
    UITextField* _SearchTextField;
    NSString* _searchString;
}
@end
