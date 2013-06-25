//
//  CouponViewController.m
//  EasyToo
//
//  Created by linshengqin on 13-6-11.
//
//

#import "CouponViewController.h"
#import "DeviceUtil.h"
@interface CouponViewController ()

@end

@implementation CouponViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self = [super init];
    if( self )
    {
        _hotView = [[HotViewController alloc] init];
        _aroundView = [[AroundViewController alloc] init];
        _searchView = [[SearchViewController alloc] init];
        _mineView   = [[MineViewController alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [_hotView release];
    [_aroundView release];
    [_searchView release];
    [_mineView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    
    [self.navigationItem setTitle:@"优惠劵"];
    
    [self initTabBar];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)initTabBar
{
    
    NSArray *controllerArray =[[[NSArray alloc]initWithObjects:_hotView, _aroundView, _searchView,_mineView,nil]autorelease];
    _tabCtrl = [[UITabBarController alloc] init];
    
    _tabCtrl.viewControllers = controllerArray;
    
    _tabCtrl.selectedIndex = 0;
    
    [[_tabCtrl.tabBar.items objectAtIndex:0] setTitle:@"热门"];
    [[_tabCtrl.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"coupon_category"]];
    
    [[_tabCtrl.tabBar.items objectAtIndex:1] setTitle:@"周边"];
    [[_tabCtrl.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"coupon_hot"]];
    
    [[_tabCtrl.tabBar.items objectAtIndex:2] setTitle:@"搜索"];
    [[_tabCtrl.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"coupon_nearby"]];
    
    [[_tabCtrl.tabBar.items objectAtIndex:3] setTitle:@"我的"];
    [[_tabCtrl.tabBar.items objectAtIndex:3] setImage:[UIImage imageNamed:@"coupon_life"]];
    
    [_tabCtrl.tabBar setFrame:CGRectMake(0, 400, [DeviceUtil getScreenWidth], 60)];
    [self.view addSubview:_tabCtrl.view];
    
}




@end
