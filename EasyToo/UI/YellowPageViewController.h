//
//  YellowPageViewController.h
//  EasyToo
//
//  Created by linshengqin on 13-6-12.
//
//

#import <UIKit/UIKit.h>
#import "YellowpageFirstPageViewController.h"
#import "YellowpageAroundViewController.h"
#import "YellowpageFavoriteViewController.h"
#import "NIDropDown.h"
@interface YellowPageViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate,UIActionSheetDelegate,UITabBarControllerDelegate>
{
    YellowpageFirstPageViewController *_firstView;
    YellowpageAroundViewController *_aroundView;
    YellowpageFavoriteViewController  *_favoriteView;
    YellowpageFavoriteViewController  *_unuseView;
    UIActionSheet *_actionSheet;


    UITabBarController* _tabCtrl;
}



@end
