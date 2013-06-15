//
//  ShoppingViewController.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-10.
//
//

#import "ShoppingViewController.h"
#import "DeviceUtil.h"

@interface ShoppingViewController ()

@end

@implementation ShoppingViewController

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
    _shoppingMallView = [[ShoppingMallViewController alloc] init];
    _shoppingCartView = [[ShoppingCartViewController alloc] init];
    _shoppingUserView = [[ShoppingUserViewController alloc] init];
    
    return [super init];
}

- (void)dealloc
{
    [_shoppingMallView release];
    [_shoppingCartView release];
    [_shoppingUserView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    
    [self.navigationItem setTitle:@"购物商城"];
    
    [self initTabBar];
}

- (void)initTabBar
{
    NSArray *controllerArray =[[NSArray alloc]initWithObjects:_shoppingMallView, _shoppingCartView, _shoppingUserView,nil];
    _tabCtrl = [[UITabBarController alloc] init];
    
    _tabCtrl.viewControllers = controllerArray;
    
    _tabCtrl.selectedIndex = 0;
    
    [[_tabCtrl.tabBar.items objectAtIndex:0] setTitle:@"商城"];
    [[_tabCtrl.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"shop_mall"]];
    
    [[_tabCtrl.tabBar.items objectAtIndex:1] setTitle:@"购物车"];
    [[_tabCtrl.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"shop_car"]];
    
    [[_tabCtrl.tabBar.items objectAtIndex:2] setTitle:@"个人中心"];
    [[_tabCtrl.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"shop_zhongxin"]];
    
    [_tabCtrl.tabBar setFrame:CGRectMake(0, 400, [DeviceUtil getScreenWidth], 60)];
    
    [self.view addSubview:_tabCtrl.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
