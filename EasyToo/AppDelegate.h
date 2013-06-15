//
//  AppDelegate.h
//  EasyToo
//
//  Created by 郑 哲 on 6/9/13.
//
//

#import <UIKit/UIKit.h>
#import "HomePageViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) HomePageViewController *homePageCtrl;
@property (strong, nonatomic) UINavigationController *navigationCtrl;

@end
