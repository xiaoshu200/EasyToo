//
//  MobileChargeConfirmViewController.m
//  EasyToo
//
//  Created by hydb on 13-6-11.
//
//

#import "MobileChargeConfirmViewController.h"

@interface MobileChargeConfirmViewController ()

@end

@implementation MobileChargeConfirmViewController

@synthesize mobile;
@synthesize cash;

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
    
    //定义title
    self.title = @"手机充值";
    
    //标题
    UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, 100, 30)];
    titleLbl.text = @"信息确认";
    titleLbl.font = [UIFont boldSystemFontOfSize:25];
    titleLbl.textColor = [UIColor redColor];
    titleLbl.textAlignment = UITextAlignmentCenter;
    titleLbl.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:titleLbl];
    
    //业务种类
    UILabel *categoryLbl = [[UILabel alloc]initWithFrame:CGRectMake(50, 80, 200, 30)];
    categoryLbl.text = @"业务种类：手机充值";
    categoryLbl.font = [UIFont boldSystemFontOfSize:18];
    categoryLbl.textAlignment = UITextAlignmentLeft;
    categoryLbl.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:categoryLbl];
    
    //手机号码
    UILabel *mobileLbl = [[UILabel alloc]initWithFrame:CGRectMake(50, 110, 200, 30)];
    mobileLbl.text = [NSString stringWithFormat:@"手机号码：%@", mobile];
    mobileLbl.font = [UIFont boldSystemFontOfSize:18];
    mobileLbl.textAlignment = UITextAlignmentLeft;
    mobileLbl.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:mobileLbl];
    
    //所属地区
    UILabel *areaLbl = [[UILabel alloc]initWithFrame:CGRectMake(50, 140, 200, 30)];
    areaLbl.text = @"所属地区：广东深圳";
    areaLbl.font = [UIFont boldSystemFontOfSize:18];
    areaLbl.textAlignment = UITextAlignmentLeft;
    areaLbl.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:areaLbl];
    
    //号码类型
    UILabel *typeLbl = [[UILabel alloc]initWithFrame:CGRectMake(50, 180, 200, 30)];
    typeLbl.text = @"号码类型：中国移动";
    typeLbl.font = [UIFont boldSystemFontOfSize:18];
    typeLbl.textAlignment = UITextAlignmentLeft;
    typeLbl.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:typeLbl];
    
    //充值金额
    UILabel *cashLbl = [[UILabel alloc]initWithFrame:CGRectMake(50, 220, 200, 30)];
    cashLbl.text = [NSString stringWithFormat:@"充值金额：%@元", cash];
    cashLbl.font = [UIFont boldSystemFontOfSize:18];
    cashLbl.textAlignment = UITextAlignmentLeft;
    cashLbl.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:cashLbl];
    
    //卡ID
    UILabel *cardidLbl = [[UILabel alloc]initWithFrame:CGRectMake(50, 250, 200, 30)];
    cardidLbl.text = @"充值卡ID：";
    cardidLbl.font = [UIFont boldSystemFontOfSize:18];
    cardidLbl.textAlignment = UITextAlignmentLeft;
    cardidLbl.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:cardidLbl];
    
    //确认充值
    UIButton *queryBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 300, 250, 30)];
    [queryBtn setTitle:@"确认充值" forState:UIControlStateNormal];
    [queryBtn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:queryBtn];
    
    //添加button方法
    [queryBtn addTarget:self action:@selector(queryEvent) forControlEvents:UIControlEventTouchUpInside];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//查询事件
- (void)queryEvent
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"手机充值" message:@"对不起，您还没登录" delegate:self cancelButtonTitle:@"登录" otherButtonTitles:@"立即注册", nil];

    [alert show];
}

@end
