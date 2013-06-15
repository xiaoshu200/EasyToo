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

    [self initTopBar];
    
    [self initTableView];
}

- (void)initTopBar
{
    UIImageView *topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [DeviceUtil getScreenWidth], 60)];
    
    [topImage setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:topImage];
    
//    UILabel* topicLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 12, [DeviceUtil getScreenWidth], 40)];
//    [topicLabel setText:@"购物商城"];
//    [topicLabel setTextAlignment:NSTextAlignmentCenter];
//    [topicLabel setBackgroundColor:[UIColor clearColor]];
//    [topicLabel setTextColor:[UIColor whiteColor]];
//    [topicLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:35]];
//    
//    [self.view addSubview:topicLabel];
    
    UIImageView *searchBgImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 20, [DeviceUtil getScreenWidth] - 50, 30)];
    
    [searchBgImage setImage:[UIImage imageNamed:@"shop_search"]];
    [self.view addSubview:searchBgImage];
    
    UIButton *searchBtn = [[UIButton alloc] initWithFrame:CGRectMake([DeviceUtil getScreenWidth] - 82, 2, 25, 25)];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"shop_search_button"] forState:UIControlStateNormal];
    [searchBgImage addSubview:searchBtn];
    
    _SearchTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 25, [DeviceUtil getScreenWidth] - 55, 22)];
    [_SearchTextField setText:@"请输入商品名称"];
//    [_SearchTextField setBackgroundColor:[UIColor greenColor]];
    [_SearchTextField setDelegate:self];
    
    [self.view addSubview:_SearchTextField];
    
//    self.navigationController navigationbar
//    UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 30, 30, 30)];
//    [backButton setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
//    backButton addTarget:self action:@selector(navi) forControlEvents:<#(UIControlEvents)#>
//    [self.view addSubview:backButton];
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
    
    
    [_tabCtrl.view setFrame:CGRectMake(0, 420, [DeviceUtil getScreenWidth], 40)];
    [self.view addSubview:_tabCtrl.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTableView
{
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, [DeviceUtil getScreenWidth], 420 - 60 - 40) style:UITableViewStylePlain];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [self.view addSubview:tableView];
}

- (void)navigationBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* dequeueBgIdentifer = @"cellview";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:dequeueBgIdentifer];
    
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dequeueBgIdentifer] autorelease];
    }
    
    
    
/*    cell.frame = CGRectMake(0, 0, [DeviceUtil getScreenWidth], 80);
    UITextView* textview = [UITextView alloc] initWithFrame:CGRectMake(60, 30, <#CGFloat width#>, <#CGFloat height#>)
    
    cell addSubview:<#(UIView *)#>
    
    if(!_headerButton)
    {
        _headerButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        _headerButton.frame = CGRectMake(0, 0, 320, SOD_HEADER_HEIGHT);
        _headerButton.backgroundColor = [UIColor clearColor];
        [_headerButton addTarget:self action:@selector(clickHeader:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:_headerButton];
    }
    
    if (!_headImageView) {
        _headImageView = [[ImgUtilCachedUIImageView alloc] init];
        _headImageView.frame = CGRectMake(0, 0, 320, SOD_HEADER_HEIGHT);
        _headImageView.clipsToBounds = YES;
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        [cell addSubview:_headImageView];
    }
    
    _SODHeaderInfo  = [[[TMLogicService shareService] SODGetHeader] retain];
    NSString* headurl = _SODHeaderInfo.headerImage;
    
    [_headImageView setImageWithURL:headurl defaultImage:TCImage(@"xodCellDefaultImage") useAnimation:NO];*/
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //IBGImage(@"sod_test");
    return cell;
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




@end
