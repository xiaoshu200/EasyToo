//
//  MovieViewController.h
//  EasyToo
//
//  Created by hydb on 13-6-11.
//
//

#import <UIKit/UIKit.h>
#import "MovieListViewController.h"
#import "TheatreViewController.h"
#import "PersonViewController.h"

@interface MovieViewController : UIViewController

@property  (strong,nonatomic) UITabBarController *tbc;
@property  (strong,nonatomic) MovieListViewController *movie_nav;
@property  (strong,nonatomic) TheatreViewController *theatre_nav;
@property  (strong,nonatomic) PersonViewController *person_nav;

@end
