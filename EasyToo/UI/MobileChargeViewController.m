//
//  MobileChargeViewController.m
//  EasyToo
//
//  Created by hydb on 13-6-11.
//
//

#import "MobileChargeViewController.h"

@interface MobileChargeViewController ()

@end

@implementation MobileChargeViewController

@synthesize mobileTF;
@synthesize cashTF;

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
    
    //说明
    UILabel *descLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    descLbl.text = @"支持 移动|联通|电信 充值";
    descLbl.font = [UIFont boldSystemFontOfSize:17];
    descLbl.textAlignment = UITextAlignmentCenter;
    descLbl.backgroundColor = [UIColor grayColor];
    descLbl.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:descLbl];
    
    //流程说明
    UILabel *procedureLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 50)];
    procedureLbl.text = @"1.输入号码--2.选择金额--3.信息确认--4.支付--5.充值成功";
    procedureLbl.font = [UIFont boldSystemFontOfSize:12];
    procedureLbl.textAlignment = UITextAlignmentCenter;
    procedureLbl.backgroundColor = [UIColor grayColor];
    procedureLbl.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:procedureLbl];
    
    //手机号码
    UILabel *mobileLbl = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, 70, 30)];
    mobileLbl.text = @"手机号码：";
    mobileLbl.font = [UIFont boldSystemFontOfSize:30];
    mobileLbl.textAlignment = UITextAlignmentCenter;
    mobileLbl.adjustsFontSizeToFitWidth = YES;
    
    mobileTF = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 190, 30)];
    [mobileTF setBorderStyle:UITextBorderStyleBezel];
    mobileTF.placeholder = @"请输入您要充值的号码";
    [mobileTF setDelegate:self];
    
    [self.view addSubview:mobileLbl];
    [self.view addSubview:mobileTF];
    
    //金额
    UILabel *cashLbl = [[UILabel alloc]initWithFrame:CGRectMake(30, 150, 70, 30)];
    cashLbl.text = @"充值金额：";
    cashLbl.font = [UIFont boldSystemFontOfSize:30];
    cashLbl.textAlignment = UITextAlignmentCenter;
    cashLbl.adjustsFontSizeToFitWidth = YES;
    
    cashTF = [[DropDownList alloc] initWithFrame:CGRectMake(100, 150, 190, 30)];
    //cashTF.placeholder = @"选择面额";
    
    [self.view addSubview:cashLbl];
    [self.view addSubview:cashTF];
    
    //充值
    UIButton *queryBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 200, 260, 30)];
    [queryBtn setTitle:@"充值" forState:UIControlStateNormal];
    [queryBtn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:queryBtn];
    //添加button方法
    [queryBtn addTarget:self action:@selector(queryEvent) forControlEvents:UIControlEventTouchUpInside];
    
    //中国移动营业厅网点
    UIButton *netBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 280, 260, 30)];
    [netBtn setTitle:@"中国移动营业厅网点" forState:UIControlStateNormal];
    [netBtn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:netBtn];
    
    //常见问答
    UIButton *answerBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 320, 260, 30)];
    [answerBtn setTitle:@"常见问答" forState:UIControlStateNormal];
    [answerBtn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:answerBtn];
    
    //服务分享
    UIButton *serviceBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 360, 260, 30)];
    [serviceBtn setTitle:@"服务分享" forState:UIControlStateNormal];
    [serviceBtn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:serviceBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//充值事件
- (void)queryEvent
{
    MobileChargeConfirmViewController *confirmView = [[MobileChargeConfirmViewController alloc] init];
    confirmView.mobile = mobileTF.text;
    confirmView.cash = cashTF.textField.text;
    [self.navigationController pushViewController:confirmView animated:YES];
}

@end
