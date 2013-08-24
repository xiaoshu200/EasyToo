//
//  HomePageViewController.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-10.
//
//

#import "HomePageViewController.h"
#import "MMGridView.h"
#import "MMGridViewDefaultCell.h"
#import "DeviceUtil.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

#define PAGE_NUM  3

#define TOP_BAR_FRAME CGRectMake(0, 0, [DeviceUtil getScreenWidth], 50)
#define TOP_BAR_TEXT_FRAME CGRectMake(0, 6, [DeviceUtil getScreenWidth], 30)
#define TITLE_BAR_FRAME CGRectMake(0, 0, [DeviceUtil getScreenWidth], 20)
#define GRID_VIEW_FRAME CGRectMake(0, 20, [DeviceUtil getScreenWidth], 320)
#define PAGE_CTRL_FRAME CGRectMake(0, 340, [DeviceUtil getScreenWidth], 40)

#define BOTTOM_BAR_FRAME CGRectMake(0, 380, [DeviceUtil getScreenWidth], 40)

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
    
    [self initGridView];
    [self initPageCtrl];
    [self initTopBar];
    [self initTitleBar];
    [self initBottomBar];
    
    [self setupPageControl];
}

- (id)init
{
    [self initIconArray];
    return [super init];
    printf("test github\n");
}

- (void)dealloc
{
    [_iconNameArray release];
    _iconNameArray = nil;
    [_iconImageNameArray release];
    _iconImageNameArray = nil;
    [_iconViewCtrlArray release];
    _iconViewCtrlArray = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initIconArray
{
    _iconNameArray = [[NSArray alloc] initWithObjects:@"优惠券下载", @"彩票投注", @"城市黄页", @"Q币充值", @"网络游戏直充", @"最新咨询", @"购物商城", @"电费代缴", @"车务代缴", @"景点票购买", @"演艺票购买", @"机票预定", @"手机话费充值", @"电影票", @"个人中心", nil];
    
    _iconImageNameArray = [[NSArray alloc] initWithObjects:@"coupon_logo", @"lottery_logo", @"cityyellow_logo", @"qq", @"geme", @"news_100", @"shop_logo", @"shuidianfei", @"car_logo", @"traveltickets_logo", @"concerttickets_logo", @"airline_line", @"concerttickets_logo", @"user_center", @"user_center", nil];
    
    _iconViewCtrlArray = [[NSArray alloc] initWithObjects:@"CouponViewController", @"CaipiaoViewController", @"YellowPageViewController", @"QQChargeViewController", @"NetGameViewController", @"NewsViewController", @"ShoppingViewController", @"ElectrolysisViewController", @"CarBusinessViewController", @"ToristTicketViewController", @"ConcertViewController", @"PlainViewController", @"MobileChargeViewController", @"MovieViewController", @"LoginViewController", nil];
}

- (void)initPageCtrl
{
    _pageCtrl = [[UIPageControl alloc] initWithFrame:PAGE_CTRL_FRAME];
    _pageCtrl.numberOfPages = PAGE_NUM;
    [_pageCtrl setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:_pageCtrl];
}

- (void)initGridView
{
    _gridView = [[MMGridView alloc] initWithFrame:GRID_VIEW_FRAME];
    [_gridView setDelegate:self];
    [_gridView setDataSource:self];
    [self.view addSubview:_gridView];
}

- (void)initTopBar
{
    //    self.navigationBarHidden = YES;
    
    //    UIImageView* topBar = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroud_title"]] autorelease];
    //    [topBar setContentMode:UIViewContentModeScaleToFill];
    //    [topBar setFrame:TOP_BAR_FRAME];
    //    [self.view addSubview:topBar];
    //
    //    UILabel* title = [[[UILabel alloc] initWithFrame:TOP_BAR_TEXT_FRAME] autorelease];
    //    [title setText:@"一指通便利生活站"];
    //    [title setBackgroundColor:[UIColor clearColor]];
    //    [title setTextAlignment:NSTextAlignmentCenter];
    //    [title setTextColor:[UIColor whiteColor]];
    //    [title setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    //    [self.view addSubview:title];
    
    [self.navigationItem setTitle:@"一指通便利生活站"];
}

- (void)initTitleBar
{
    UIImageView* titleBar = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_title"]] autorelease];
    [titleBar setContentMode:UIViewContentModeScaleToFill];
    [titleBar setFrame:TITLE_BAR_FRAME];
    [self.view addSubview:titleBar];
    
    UILabel* label = [[UILabel alloc] initWithFrame:TITLE_BAR_FRAME];
    [label setText:@"共15款应用"];
    [label setTextColor:[UIColor redColor]];
    [label setTextAlignment:UITextAlignmentCenter];
    [label setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:label];
    
    
}

- (void)initBottomBar
{
    UIImageView* bottomBar = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_bottom"]] autorelease];
    [bottomBar setContentMode:UIViewContentModeScaleToFill];
    [bottomBar setFrame:BOTTOM_BAR_FRAME];
    [self.view addSubview:bottomBar];
    
}

- (void)setupPageControl
{
    _pageCtrl.numberOfPages = _gridView.numberOfPages;
    _pageCtrl.currentPage = _gridView.currentPageIndex;
}

#pragma - MMGridViewDataSource

- (NSInteger)numberOfCellsInGridView:(MMGridView *)gridView
{
    return [_iconNameArray count];
}


- (MMGridViewCell *)gridView:(MMGridView *)gridView cellAtIndex:(NSUInteger)index
{
    MMGridViewDefaultCell *cell = [[[MMGridViewDefaultCell alloc] initWithFrame:CGRectNull] autorelease];
    cell.textLabel.text = [_iconNameArray objectAtIndex:index];
    cell.imageView.image = [UIImage imageNamed:[_iconImageNameArray objectAtIndex:index]];
    
    return cell;
}

#pragma - MMGridViewDelegate

- (void)gridView:(MMGridView *)gridView didSelectCell:(MMGridViewCell *)cell atIndex:(NSUInteger)index
{
    UIViewController* subView = nil;
    if (index >= [_iconViewCtrlArray count])
    {
        return;
    }
    
    NSString* subViewClassName = [_iconViewCtrlArray objectAtIndex:index] ;
    if (subViewClassName && ![subViewClassName isEqualToString:@""])
    {
        subView = [[NSClassFromString(subViewClassName) alloc] init];
        [self.navigationController pushViewController:subView animated:YES];
    }
}


- (void)gridView:(MMGridView *)gridView didDoubleTapCell:(MMGridViewCell *)cell atIndex:(NSUInteger)index
{
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
    //                                                    message:[NSString stringWithFormat:@"Cell at index %d was double tapped.", index]
    //                                                   delegate:nil
    //                                          cancelButtonTitle:@"Cool!"
    //                                          otherButtonTitles:nil];
    //    [alert show];
}


- (void)gridView:(MMGridView *)theGridView changedPageToIndex:(NSUInteger)index
{
    [self setupPageControl];
}

@end
