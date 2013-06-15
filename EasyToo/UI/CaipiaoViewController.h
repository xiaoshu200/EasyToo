//
//  CaipiaoViewController.h
//  EasyToo
//
//  Created by zhengzhe on 13-6-11.
//
//

#import <UIKit/UIKit.h>
#import "GouPiaoViewController.h"
#import "DatingViewController.h"
#import "ZhongXinViewController.h"

@interface CaipiaoViewController : UIViewController

@property (strong,nonatomic) GouPiaoViewController *goupiao_nav;
@property (strong,nonatomic) DatingViewController *dating_nav;
@property (strong,nonatomic) ZhongXinViewController *zhongxin_nav;
@property  (strong,nonatomic) UITabBarController *tbc;

@end
