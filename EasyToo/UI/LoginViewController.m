//
//  LoginViewController.m
//  EasyToo
//
//  Created by hydb on 13-6-11.
//
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize nameTF;
@synthesize passwordTF;

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
    UIImageView *imgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"index"]];
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CGFloat widhth = [[UIScreen mainScreen] bounds].size.width;
    imgview.frame = CGRectMake(0, 0, widhth, height);
    [self.view addSubview:imgview];
    
    //用户名
    UILabel *nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(40, 170, 50, 30)];
    nameLbl.text = @"用户名：";
    nameLbl.font = [UIFont boldSystemFontOfSize:35];
    nameLbl.textAlignment = UITextAlignmentRight;
    nameLbl.adjustsFontSizeToFitWidth = YES;
    nameLbl.backgroundColor = [UIColor clearColor];
    
    nameTF = [[UITextField alloc] initWithFrame:CGRectMake(90, 170, 200, 30)];
    [nameTF setBorderStyle:UITextBorderStyleBezel];
    nameTF.placeholder = @"用户名/手机号/呢称";
    [nameTF setDelegate:self];

    [self.view addSubview:nameLbl];
    [self.view addSubview:nameTF];
    
    //密码
    UILabel *passwordLbl = [[UILabel alloc]initWithFrame:CGRectMake(40, 200, 50, 30)];
    passwordLbl.text = @"密  码：";
    passwordLbl.font = [UIFont boldSystemFontOfSize:35];
    passwordLbl.textAlignment = UITextAlignmentRight;
    passwordLbl.adjustsFontSizeToFitWidth = YES;
    passwordLbl.backgroundColor = [UIColor clearColor];
    
    passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(90, 200, 200, 30)];
    [passwordTF setBorderStyle:UITextBorderStyleBezel];
    [passwordTF setDelegate:self];
    
    [self.view addSubview:passwordLbl];
    [self.view addSubview:passwordTF];
    
    //找回密码
    UIButton *getpassbacBtn = [[UIButton alloc]initWithFrame:CGRectMake(180, 240, 150, 20)];
    [getpassbacBtn setTitle:@"找回登录密码" forState:UIControlStateNormal];
    getpassbacBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [getpassbacBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:getpassbacBtn];
    
    //添加button方法
    [getpassbacBtn addTarget:self action:@selector(getpassbacEvent) forControlEvents:UIControlEventTouchUpInside];
    
    //登录 
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(40, 270, 80, 30)];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"index_2.png"] forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    
    //添加button方法
    [loginBtn addTarget:self action:@selector(loginEvent) forControlEvents:UIControlEventTouchUpInside];
    
    //注册
    UIButton *registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(210, 270, 80, 30)];
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"index_1.png"] forState:UIControlStateNormal];
    [self.view addSubview:registerBtn];
    
    //添加button方法
    [registerBtn addTarget:self action:@selector(registerEvent) forControlEvents:UIControlEventTouchUpInside];
    

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

//找回密码
- (void)getpassbacEvent
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"找回密码" message:@"联系客服110可找回登录密码" delegate:self cancelButtonTitle:@"登录" otherButtonTitles:@"返回", nil];
    
    [alert show];}

//登录
- (void)loginEvent
{
}

//注册
- (void)registerEvent
{
}

@end
