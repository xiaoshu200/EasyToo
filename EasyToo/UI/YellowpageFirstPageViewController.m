//
//  FirstPageViewController.m
//  EasyToo
//
//  Created by linshengqin on 13-6-12.
//
//

#import "YellowpageFirstPageViewController.h"
#import "DeviceUtil.h"
@interface YellowpageFirstPageViewController ()

@end

@implementation YellowpageFirstPageViewController

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
	// Do any additional setup after loading the view.
  
    
    [self initTopBar];

    [self initButton];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.fatherView.navigationItem setTitle:@"城市黄页"];

}

-(void)viewWillDisappear:(BOOL)animated{
    printf("firstpage disappear\n");
}

-(void) initButton
{
    _btnDish = [[[UIButton alloc] initWithFrame:CGRectMake(50, 90, 100, 40)] autorelease];
    [_btnDish setBackgroundImage:[UIImage imageNamed:@"buttonup"] forState:UIControlStateNormal];
    [self.view addSubview:_btnDish];
    UILabel *label_dish = [[[UILabel alloc]initWithFrame:CGRectMake(40,0,60,40)] autorelease];
    label_dish.text = @"餐饮美食";
    label_dish.font = [UIFont boldSystemFontOfSize:13];
    [label_dish setBackgroundColor:[UIColor clearColor]];
    label_dish.textAlignment = NSTextAlignmentCenter;
    label_dish.adjustsFontSizeToFitWidth = YES;
    [_btnDish addSubview:label_dish];
    UIImageView *image_dish = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)] autorelease];
    image_dish.image = [UIImage imageNamed:@"meishi"];
    [image_dish setBackgroundColor:[UIColor clearColor]];
    [_btnDish addSubview:image_dish];
    
        
    _btnRelex = [[[UIButton alloc] initWithFrame:CGRectMake(180, 90, 100, 40)] autorelease];
    [_btnRelex setBackgroundImage:[UIImage imageNamed:@"buttonup"] forState:UIControlStateNormal];
    [self.view addSubview:_btnRelex];
    UILabel *label_relex = [[[UILabel alloc]initWithFrame:CGRectMake(40,0,60,40)]autorelease];
    label_relex.text = @"休闲娱乐";
    label_relex.font = [UIFont boldSystemFontOfSize:20];
    [label_relex setBackgroundColor:[UIColor clearColor]];
    label_relex.textAlignment = NSTextAlignmentCenter;
    label_relex.adjustsFontSizeToFitWidth = YES;
    [_btnRelex addSubview:label_relex];
    UIImageView *image_relex = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)] autorelease];
    image_relex.image = [UIImage imageNamed:@"sport"];
    [image_relex setBackgroundColor:[UIColor clearColor]];
    [_btnRelex addSubview:image_relex];
    
    _btnService = [[[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 40)] autorelease];
    [_btnService setBackgroundImage:[UIImage imageNamed:@"buttonup"] forState:UIControlStateNormal];
    [self.view addSubview:_btnService];
    UILabel *label_service = [[[UILabel alloc]initWithFrame:CGRectMake(40,0,60,40)]autorelease];
    label_service.text = @"生活服务";
    label_service.font = [UIFont boldSystemFontOfSize:20];
    [label_service setBackgroundColor:[UIColor clearColor]];
    label_service.textAlignment = NSTextAlignmentCenter;
    label_service.adjustsFontSizeToFitWidth = YES;
    [_btnService addSubview:label_service];
    UIImageView *image_service = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)] autorelease];
    image_service.image = [UIImage imageNamed:@"lifeservice"];
    [image_service setBackgroundColor:[UIColor clearColor]];
    [_btnService addSubview:image_service];
    
    _btnShopping = [[[UIButton alloc] initWithFrame:CGRectMake(180, 150, 100, 40)] autorelease];
    [_btnShopping setBackgroundImage:[UIImage imageNamed:@"buttonup"] forState:UIControlStateNormal];
    [self.view addSubview:_btnShopping];
    UILabel *label_shopping = [[[UILabel alloc]initWithFrame:CGRectMake(40,0,60,40)]autorelease];
    label_shopping.text = @"逛街购物";
    label_shopping.font = [UIFont boldSystemFontOfSize:20];
    [label_shopping setBackgroundColor:[UIColor clearColor]];
    label_shopping.textAlignment = NSTextAlignmentCenter;
    label_shopping.adjustsFontSizeToFitWidth = YES;
    [_btnShopping addSubview:label_shopping];    
    UIImageView *image_shopping = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)] autorelease];
    image_shopping.image = [UIImage imageNamed:@"shopping"];
    [image_shopping setBackgroundColor:[UIColor clearColor]];
    [_btnShopping addSubview:image_shopping];
    
    _btnRest = [[[UIButton alloc] initWithFrame:CGRectMake(50, 210, 100, 40)] autorelease];
    [_btnRest setBackgroundImage:[UIImage imageNamed:@"buttonup"] forState:UIControlStateNormal];
    [self.view addSubview:_btnRest];
    UILabel *label_rest = [[[UILabel alloc]initWithFrame:CGRectMake(40,0,60,40)]autorelease];
    label_rest.text = @"酒店住宿";
    label_rest.font = [UIFont boldSystemFontOfSize:20];
    [label_rest setBackgroundColor:[UIColor clearColor]];
    label_rest.textAlignment = NSTextAlignmentCenter;
    label_rest.adjustsFontSizeToFitWidth = YES;
    [_btnRest addSubview:label_rest];    
    UIImageView *image_rest = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)] autorelease];
    image_rest.image = [UIImage imageNamed:@"hotel"];
    [image_rest setBackgroundColor:[UIColor clearColor]];
    [_btnRest addSubview:image_rest];
    
    _btnBeauty = [[[UIButton alloc] initWithFrame:CGRectMake(180, 210, 100, 40)] autorelease];
    [_btnBeauty setBackgroundImage:[UIImage imageNamed:@"buttonup"] forState:UIControlStateNormal];
    [self.view addSubview:_btnBeauty];
    UILabel *label_beauty = [[[UILabel alloc]initWithFrame:CGRectMake(40,0,60,40)]autorelease];
    label_beauty.text = @"美容护肤";
    label_beauty.font = [UIFont boldSystemFontOfSize:20];
    [label_beauty setBackgroundColor:[UIColor clearColor]];
    label_beauty.textAlignment = NSTextAlignmentCenter;
    label_beauty.adjustsFontSizeToFitWidth = YES;
    [_btnBeauty addSubview:label_beauty];
    UIImageView *image_beauty = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)] autorelease];
    image_beauty.image = [UIImage imageNamed:@"meirong"];
    [image_beauty setBackgroundColor:[UIColor clearColor]];
    [_btnBeauty addSubview:image_beauty];
    
    _btnSport = [[[UIButton alloc] initWithFrame:CGRectMake(50, 270, 100, 40)] autorelease];
    [_btnSport setBackgroundImage:[UIImage imageNamed:@"buttonup"] forState:UIControlStateNormal];
    [self.view addSubview:_btnSport];
    UILabel *label_sport = [[[UILabel alloc]initWithFrame:CGRectMake(40,0,60,40)]autorelease];
    label_sport.text = @"运动健身";
    label_sport.font = [UIFont boldSystemFontOfSize:20];
    [label_sport setBackgroundColor:[UIColor clearColor]];
    label_sport.textAlignment = NSTextAlignmentCenter;
    label_sport.adjustsFontSizeToFitWidth = YES;
    [_btnSport addSubview:label_sport];
    UIImageView *image_sport = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)] autorelease];
    image_sport.image = [UIImage imageNamed:@"sport"];
    [image_sport setBackgroundColor:[UIColor clearColor]];
    [_btnSport addSubview:image_sport];
    
    _btnMarry = [[[UIButton alloc] initWithFrame:CGRectMake(180, 270, 100, 40)] autorelease];
    [_btnMarry setBackgroundImage:[UIImage imageNamed:@"buttonup"] forState:UIControlStateNormal];
    [self.view addSubview:_btnMarry];
    UILabel *label_marry = [[[UILabel alloc]initWithFrame:CGRectMake(40,0,60,40)]autorelease];
    label_marry.text = @"婚嫁服务";
    label_marry.font = [UIFont boldSystemFontOfSize:20];
    [label_marry setBackgroundColor:[UIColor clearColor]];
    label_marry.textAlignment = NSTextAlignmentCenter;
    label_marry.adjustsFontSizeToFitWidth = YES;
    [_btnMarry addSubview:label_marry];
    
    UIImageView *image_marry = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)] autorelease];
    image_marry.image = [UIImage imageNamed:@"marry"];
    [image_marry setBackgroundColor:[UIColor clearColor]];
    [_btnMarry addSubview:image_marry];
}

- (void)initTopBar
{
    UIImageView *topImage = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [DeviceUtil getScreenWidth], 60)] autorelease];
    
    [topImage setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:topImage];
    
    UIImageView *searchBgImage = [[[UIImageView alloc] initWithFrame:CGRectMake(25, 20, [DeviceUtil getScreenWidth] - 50, 30)] autorelease];
    
    [searchBgImage setImage:[UIImage imageNamed:@"shop_search"]];
    [self.view addSubview:searchBgImage];
    
    UIButton *searchBtn = [[[UIButton alloc] initWithFrame:CGRectMake([DeviceUtil getScreenWidth] - 82, 2, 25, 25)]autorelease];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"shop_search_button"] forState:UIControlStateNormal];
    [searchBgImage addSubview:searchBtn];
    
    _SearchTextField = [[[UITextField alloc] initWithFrame:CGRectMake(40, 25, [DeviceUtil getScreenWidth] - 55, 22)] autorelease];
    [_SearchTextField setText:@"请输入关键字"];
    [_SearchTextField setDelegate:self];
    
    [self.view addSubview:_SearchTextField];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
