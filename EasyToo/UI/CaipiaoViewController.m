//
//  CaipiaoViewController.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-11.
//
//

#import "CaipiaoViewController.h"
#import "DeviceUtil.h"

@interface CaipiaoViewController ()

@end

@implementation CaipiaoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView
{
    self.goupiao_nav = [[[GouPiaoViewController alloc] initWithStyle:UITableViewStyleGrouped ] autorelease];
    self.goupiao_nav.fatherView = self;
//    goupiaoView.title =@"选择彩种";
    
    self.dating_nav = [[[DatingViewController alloc] initWithStyle:UITableViewStyleGrouped]autorelease];
    self.dating_nav.fatherView = self;
//    datingView.title = @"开奖大厅";
    
    self.zhongxin_nav = [[[ZhongXinViewController alloc]initWithStyle:UITableViewStyleGrouped] autorelease];
    self.zhongxin_nav.fatherView = self;
//    zhongxinView.title = @"个人中心";
//    
    NSArray *controllerArray =[[NSArray alloc]initWithObjects:self.goupiao_nav,self.dating_nav,self.zhongxin_nav,nil];
    self.tbc = [[[UITabBarController alloc]init] autorelease];
    
    // self.tbc.delegate = self;
    self.tbc.viewControllers = controllerArray;
    
    _tbc.selectedIndex = 0;
    
    [[self.tbc.tabBar.items objectAtIndex:0] setTitle:@"购买彩票"];
    [[self.tbc.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"cp_goupiao.png"]];
    
    [[self.tbc.tabBar.items objectAtIndex:1] setTitle:@"开奖大厅"];
    [[self.tbc.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"cp_dating.png"]];
    
    [[self.tbc.tabBar.items objectAtIndex:2] setTitle:@"个人中心"];
    [[self.tbc.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"cp_zhongxin.png"]];
    
    [self.tbc.tabBar setFrame:CGRectMake(0, 400, [DeviceUtil getScreenWidth], 60)];
    [self.view addSubview:self.tbc.view];
}

@end
