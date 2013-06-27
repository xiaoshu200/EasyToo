//
//  YellowpageMoreViewController.h
//  EasyToo
//
//  Created by linshengqin on 13-6-25.
//
//

#import <UIKit/UIKit.h>

@interface YellowpageMoreViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) NSMutableArray *menuList;
@property (nonatomic, assign) UIViewController* fatherView;


@end
