//
//  HotViewController.m
//  EasyToo
//
//  Created by linshengqin on 13-6-11.
//
//

#import "HotViewController.h"
#import "DropDownList.h"
#import "DeviceUtil.h"
#import "BrandView.h"
@interface HotViewController ()

@end

@implementation HotViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init
{
    return [super init];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initTopBar];
    [self initTableView];
	// Do any additional setup after loading the view.
}

- (void)initTopBar
{
    UIImageView *topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [DeviceUtil getScreenWidth], 60)];
    
    [topImage setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:topImage];
    
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
}

- (void)initTableView
{
    BrandView* houseView = [[BrandView alloc] initWithFrame:CGRectMake(0, 60, [DeviceUtil getScreenWidth], 300)];
    [self.view addSubview:houseView];
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



@end
