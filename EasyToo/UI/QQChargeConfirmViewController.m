//
//  ConfirmMessageViewController.m
//  QQCharge
//
//  Created by linshengqin on 13-6-10.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//

#import "QQChargeConfirmViewController.h"

@interface QQChargeConfirmViewController ()

@end

@implementation QQChargeConfirmViewController

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
    UILabel *label_message = [[UILabel alloc] initWithFrame:CGRectMake(130, 20, 150, 30)];
    label_message.text = @"确认信息";
    label_message.textColor = [UIColor redColor];
    [self.view addSubview:label_message];
    
    
    UILabel *label_account = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, 250, 30)];
    [label_account setText:[NSString stringWithFormat:@"QQ号码 : %@",self.account]];
    [self.view addSubview:label_account];
    
    
    UILabel *label_price = [[UILabel alloc] initWithFrame:CGRectMake(30, 90, 250, 30)];
    [label_price setText:[NSString stringWithFormat:@"充值金额 : %d元",self.price]];
    [self.view addSubview:label_price];
    
    UILabel *label_pay = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, 250, 30)];
    label_pay.text = @"支付方式:";
    [self.view addSubview:label_pay];
    
    UIButton *confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 260, 100, 30)];
    [confirmButton setBackgroundImage:[UIImage imageNamed:@"shop_confirmandpay"] forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(confirmPay:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmButton];
}

- (void)confirmPay:(id)sender
{
    UIAlertView *av= [[UIAlertView alloc] initWithTitle:@"提示" message:@"未登陆,请先登陆或注册" delegate:self  cancelButtonTitle:@"注册" otherButtonTitles:@"登陆", nil];
    [av show];
    [av release];
	//NSLog(@"UIBarButtonItem clicked");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
