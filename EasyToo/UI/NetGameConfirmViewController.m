//
//  NetGameConfirmViewController.m
//  QQCharge
//
//  Created by linshengqin on 13-6-11.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//

#import "NetGameConfirmViewController.h"

@interface NetGameConfirmViewController ()

@end

@implementation NetGameConfirmViewController

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
    label_message.text = @"信息确认";
    [self.view addSubview:label_message];
    
    
    UILabel *label_account = [[UILabel alloc] initWithFrame:CGRectMake(50, 60, 250, 30)];
    [label_account setText:[NSString stringWithFormat:@"QQ帐号:%@",self.account]];
    [self.view addSubview:label_account];
    
    
    UILabel *label_count = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 250, 30)];
    [label_count setText:[NSString stringWithFormat:@"购买个数:%d",self.price]];
    [self.view addSubview:label_count];
    
    UILabel *label_price = [[UILabel alloc] initWithFrame:CGRectMake(50, 140, 250, 30)];
    [label_price setText:[NSString stringWithFormat:@"支付金额:%d元",self.price]];
    [self.view addSubview:label_price];
    
    UILabel *label_pay = [[UILabel alloc] initWithFrame:CGRectMake(50, 180, 250, 30)];
    label_pay.text = @"支付方式:";
    [self.view addSubview:label_pay];
    
    UIButton *zfbButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 220, 100, 30)];
    [zfbButton setBackgroundImage:[UIImage imageNamed:@"zfb"] forState:UIControlStateNormal];
    [self.view addSubview:zfbButton];
    
    UIButton *ybButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 220, 100, 30)];
    [ybButton setBackgroundImage:[UIImage imageNamed:@"yibao"] forState:UIControlStateNormal];
    [self.view addSubview:ybButton];
    
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
