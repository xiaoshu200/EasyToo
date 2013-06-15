//
//  HomePageViewController.h
//  EasyToo
//
//  Created by zhengzhe on 13-6-10.
//
//

#import <UIKit/UIKit.h>
#import "MMGridView.h"

@interface HomePageViewController : UIViewController <MMGridViewDataSource, MMGridViewDelegate>
{
    MMGridView* _gridView;
    UIPageControl* _pageCtrl;
    
    NSArray* _iconNameArray;
    NSArray* _iconImageNameArray;
    NSArray* _iconViewCtrlArray;
}

@end
