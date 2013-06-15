//
//  FirstViewController.h
//  MYUICatalog
//
//  Created by linshengqin on 13-6-1.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GouPiaoViewController : UITableViewController

@property (nonatomic, assign) UIViewController* fatherView;

@property (nonatomic,retain) NSMutableArray *menuList;

@end
