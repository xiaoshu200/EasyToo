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
    _firstView = [[[YellowpageFirstPageViewController alloc] init]autorelease];
    _aroundView = [[[YellowpageAroundViewController alloc] init]autorelease];
    _favoriteView = [[[YellowpageFavoriteViewController alloc] init]autorelease];
    _unuseView = [[[YellowpageFavoriteViewController alloc] init]autorelease];
    
    return [super init];
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
    NSArray *controllerArray =[[[NSArray alloc]initWithObjects:_firstView, _aroundView, _favoriteView,_unuseView,nil]autorelease];
    _tabCtrl = [[[UITabBarController alloc] init]autorelease];
    
    _tabCtrl.viewControllers = controllerArray;
    
    _tabCtrl.delegate = self;
    
    _tabCtrl.selectedIndex = 0;
    
    [[_tabCtrl.tabBar.items objectAtIndex:0] setTitle:@"首页"];
    [[_tabCtrl.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"home"]];
    
    [[_tabCtrl.tabBar.items objectAtIndex:1] setTitle:@"周边"];
    [[_tabCtrl.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"nearby"]];
    
    [[_tabCtrl.tabBar.items objectAtIndex:2] setTitle:@"收藏"];
    [[_tabCtrl.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"collect"]];
    
    [[_tabCtrl.tabBar.items objectAtIndex:3] setTitle:@"更多"];
    [[_tabCtrl.tabBar.items objectAtIndex:3] setTag:1];
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
    if( viewController.tabBarItem.tag == 1 )
    {
        _actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                  delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil
                                         otherButtonTitles:@"设置", @"分享", @"反馈",@"关于",nil];
        _actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
//        _actionSheet.destructiveButtonIndex = 1;	// make the second button red (destructive)
        [_actionSheet showInView:self.view]; // show from our table view (pops up in the middle of the table)
        [_actionSheet release];
    }
}
@end
