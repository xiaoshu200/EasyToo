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
    UILabel *label_message = [[[UILabel alloc] initWithFrame:CGRectMake(130, 0, 150, 30)]autorelease];
    label_message.text = @"信息确认";
    [self.view addSubview:label_message];
    
    
    UILabel *label_gameType = [[[UILabel alloc] initWithFrame:CGRectMake(50, 40, 250, 30)] autorelease];
    [label_gameType setText:[NSString stringWithFormat:@"游戏名称:%@",_gameType]];
    [self.view addSubview:label_gameType];
    
    
    UILabel *label_cardType = [[[UILabel alloc] initWithFrame:CGRectMake(50, 80, 250, 30)]autorelease];
    [label_cardType setText:[NSString stringWithFormat:@"充值卡类:%@",_cardType]];
    [self.view addSubview:label_cardType];
    
    UILabel *label_cardPrice = [[[UILabel alloc] initWithFrame:CGRectMake(50, 120, 250, 30)]autorelease];
    [label_cardPrice setText:[NSString stringWithFormat:@"卡类面值:%d元",_cardPrice]];
    [self.view addSubview:label_cardPrice];
    
    UILabel *label_cardNum = [[[UILabel alloc] initWithFrame:CGRectMake(50, 160, 250, 30)]autorelease];
    [label_cardNum setText:[NSString stringWithFormat:@"购买数量:%d个",_cardNum]];
    [self.view addSubview:label_cardNum];
    
    UILabel *label_totalPrice = [[[UILabel alloc] initWithFrame:CGRectMake(50, 200, 250, 30)]autorelease];
    [label_totalPrice setText:[NSString stringWithFormat:@"支付金额:%d元",_totalPrice]];
    [self.view addSubview:label_totalPrice];
    
    UILabel *label_account = [[[UILabel alloc] initWithFrame:CGRectMake(50, 240, 250, 30)]autorelease];
    [label_account setText:[NSString stringWithFormat:@"充值帐号:%@",_account]];
    [self.view addSubview:label_account];
    
    UILabel *label_pay = [[[UILabel alloc] initWithFrame:CGRectMake(50, 280, 250, 30)]autorelease];
    label_pay.text = @"支付方式:";
    [self.view addSubview:label_pay];
    
    UIButton *zfbButton = [[[UIButton alloc] initWithFrame:CGRectMake(50, 310, 100, 30)]autorelease];
    [zfbButton setBackgroundImage:[UIImage imageNamed:@"zfb"] forState:UIControlStateNormal];
    [self.view addSubview:zfbButton];
    
    UIButton *ybButton = [[[UIButton alloc] initWithFrame:CGRectMake(180, 310, 80, 30)]autorelease];
    [ybButton setBackgroundImage:[UIImage imageNamed:@"yibao"] forState:UIControlStateNormal];
    [self.view addSubview:ybButton];
    
    UIButton *confirmButton = [[[UIButton alloc] initWithFrame:CGRectMake(120, 350, 80, 30)]autorelease];
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
