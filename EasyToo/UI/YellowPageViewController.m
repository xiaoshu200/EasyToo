//
//  YellowPageViewController.m
//  EasyToo
//
//  Created by linshengqin on 13-6-12.
//
//

#import "YellowPageViewController.h"
#import "DeviceUtil.h"
@interface YellowPageViewController ()

@end

@implementation YellowPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) init
{
    self = [super init];
    if(self)
    {
        _firstView = [[YellowpageFirstPageViewController alloc] init];
        _aroundView = [[YellowpageAroundViewController alloc] init];
        _favoriteView = [[YellowpageFavoriteViewController alloc] init];
        _moreView = [[YellowpageMoreViewController alloc] init];
        
        _firstView.fatherView = self;
        _aroundView.fatherView = self;
        _favoriteView.fatherView = self;
        _moreView.fatherView = self;
    }
    return self;
}

-(void) dealloc
{
    [_firstView release];
    [_aroundView release];
    [_favoriteView release];
    [super dealloc];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setTintColor:[UIColor orangeColor]];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"城市黄页"];
    [self initTabBar];
}




- (void)initTabBar
{
    NSArray *controllerArray =[[[NSArray alloc]initWithObjects:_firstView, _aroundView, _favoriteView,_moreView,nil]autorelease];
    _tabCtrl = [[UITabBarController alloc] init];
    
    _tabCtrl.viewControllers = controllerArray;
    
    _tabCtrl.delegate = self;
    
    _tabCtrl.selectedIndex = 0;
    
    [[_tabCtrl.tabBar.items objectAtIndex:0] setTitle:@"首页"];
    [[_tabCtrl.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"home"]];
    
    [[_tabCtrl.tabBar.items objectAtIndex:1] setTitle:@"周边"];
    [[_tabCtrl.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"nearby"]];
    
    [[_tabCtrl.tabBar.items objectAtIndex:2] setTitle:@"收藏"];
    [[_tabCtrl.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"collect"]];
    [[_tabCtrl.tabBar.items objectAtIndex:2] setTag:1];
    
    [[_tabCtrl.tabBar.items objectAtIndex:3] setTitle:@"更多"];
    [[_tabCtrl.tabBar.items objectAtIndex:3] setImage:[UIImage imageNamed:@"more"]];
    [_tabCtrl.tabBar setFrame:CGRectMake(0, 400, [DeviceUtil getScreenWidth], 60)];
    [self.view addSubview:_tabCtrl.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField setText:@""];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *) viewController
{
    
}

-(void)selectRightAction:(UIButton*)button
{
    printf("handle select rightaction here\n");
}
@end
