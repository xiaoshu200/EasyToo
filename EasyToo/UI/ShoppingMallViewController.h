//
//  ShoppingMallViewController.h
//  EasyToo
//
//  Created by zhengzhe on 13-6-10.
//
//

#import <UIKit/UIKit.h>

@interface ShoppingMallViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    UITextField* _SearchTextField;
    NSString* _searchString;
    
    NSArray *_titleDetail;
    NSArray *_timeDetail;
    NSArray *_contentDetail;
    NSArray *_pictureDetail;
}
@end
