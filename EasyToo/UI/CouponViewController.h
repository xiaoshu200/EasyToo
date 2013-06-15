//
//  CouponViewController.h
//  EasyToo
//
//  Created by linshengqin on 13-6-11.
//
//

#import <UIKit/UIKit.h>
#import "HotViewController.h"
#import "AroundViewController.h"
#import "SearchViewController.h"
#import "MineViewController.h"
@interface CouponViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    HotViewController *_hotView;
    AroundViewController *_aroundView;
    SearchViewController  *_searchView;
    MineViewController  *_mineView;
    
    UITabBarController* _tabCtrl;
    
    
}
@end
