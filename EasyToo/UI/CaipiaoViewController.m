//
//  CaipiaoViewController.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-11.
//
//

#import "CaipiaoViewController.h"

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
//    goupiaoView.title =@"选择彩种";
    
    self.dating_nav = [[[DatingViewController alloc] initWithStyle:UITableViewStyleGrouped]autorelease];
//    datingView.title = @"开奖大厅";
    
    self.zhongxin_nav = [[[ZhongXinViewController alloc]initWithStyle:UITableViewStyleGrouped] autorelease];
//    zhongxinView.title = @"个人中心";
    
    [self.navigationController pushViewController:self.goupiao_nav animated:NO];
        
    /*使用图片设置导航栏
     float version = [[[UIDevice currentDevice] systemVersion] floatValue];
     UIImage *backgroundImage = [UIImage imageNamed:@"cp_top_bg.png"];
     if (version >= 5.0) {
     [self.goupiao_nav.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
     }
     else
     {
     [self.goupiao_nav.navigationBar insertSubview:[[UIImageView alloc] initWithImage:backgroundImage] atIndex:1];
     }
     */
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
    [self.view addSubview:self.tbc.view];
}

@end
