//
//  ShoppingMallViewController.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-10.
//
//

#import "ShoppingMallViewController.h"
#import "DeviceUtil.h"

@interface ShoppingMallViewController ()

@end

@implementation ShoppingMallViewController

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
    [self initTopBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTopBar
{
    UIImageView *topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [DeviceUtil getScreenWidth], 100)];
    
    [topImage setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:topImage];
    
    UILabel* topicLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 12, [DeviceUtil getScreenWidth], 40)];
    [topicLabel setText:@"购物商城"];
    [topicLabel setTextAlignment:NSTextAlignmentCenter];
    [topicLabel setBackgroundColor:[UIColor clearColor]];
    [topicLabel setTextColor:[UIColor whiteColor]];
    [topicLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:35]];
    
    [self.view addSubview:topicLabel];
    
    UIImageView *searchBgImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 60, [DeviceUtil getScreenWidth] - 50, 30)];
    
    [searchBgImage setImage:[UIImage imageNamed:@"shop_search"]];
    [self.view addSubview:searchBgImage];
    
    UIButton *searchBtn = [[UIButton alloc] initWithFrame:CGRectMake([DeviceUtil getScreenWidth] - 82, 2, 25, 25)];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"shop_search_button"] forState:UIControlStateNormal];
    [searchBgImage addSubview:searchBtn];
    
}

@end
