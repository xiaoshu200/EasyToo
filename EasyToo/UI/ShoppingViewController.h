//
//  ShoppingViewController.h
//  EasyToo
//
//  Created by zhengzhe on 13-6-10.
//
//

#import <UIKit/UIKit.h>
#import "ShoppingMallViewController.h"
#import "ShoppingCartViewController.h"
#import "ShoppingUserViewController.h"

@interface ShoppingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    ShoppingMallViewController* _shoppingMallView;
    ShoppingCartViewController* _shoppingCartView;
    ShoppingUserViewController* _shoppingUserView;
    
    UITextField* _SearchTextField;
    NSString* _searchString;
    UITabBarController* _tabCtrl;
}
@end
