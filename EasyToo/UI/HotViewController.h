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
    DropDownList *_Category;
    DropDownList *_moveType;
    
    UITextField* _SearchTextField;
    NSString* _searchString;
}
@end
