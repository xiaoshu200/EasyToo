//
//  NetGameViewController.m
//  QQCharge
//
//  Created by linshengqin on 13-6-11.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//

#import "NetGameViewController.h"
#import "NetGameConfirmViewController.h"
#import "DropDownList.h"
@interface NetGameViewController ()

@end

@implementation NetGameViewController

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
    
    self.gameType = [[DropDownList alloc] initWithFrame:CGRectMake(30, 60, 250, 30)];
    [self.gameType.textField setBorderStyle:UITextBorderStyleBezel];
    [self.view addSubview:self.gameType];
    
    self.cardType = [[DropDownList alloc] initWithFrame:CGRectMake(30, 110, 250, 30)];
    [self.cardType.textField setBorderStyle:UITextBorderStyleBezel];
    [self.view addSubview:self.cardType];

    
    self.cardNum = [[DropDownList alloc] initWithFrame:CGRectMake(30, 150, 250, 30)];
    [self.cardNum.textField setBorderStyle:UITextBorderStyleBezel];
    [self.view addSubview:self.cardNum];
    
    self.account = [[UITextField alloc] initWithFrame:CGRectMake(30, 190, 250, 30)];
    [self.account setBorderStyle:UITextBorderStyleBezel];
    self.account.placeholder = @"充值帐号";
    [self.view addSubview:self.account];
    self.account.delegate = self;
    
    
    self.account2 = [[UITextField alloc] initWithFrame:CGRectMake(30, 230, 250, 30)];
    [self.account2 setBorderStyle:UITextBorderStyleBezel];
    self.account2.placeholder = @"确认充值帐号";
    [self.view addSubview:self.account2];
    self.account.delegate = self;

    UIButton *nextStep =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextStep.frame = CGRectMake(110, 270, 150, 30);
    //    [[UIButton alloc] initWithFrame:CGRectMake(110, 230, 150, 30)];
    [nextStep setTitle:@"下一步" forState:UIControlStateNormal];
    //   nextStep.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:nextStep];
    [nextStep addTarget:self action:@selector(confirmMessge:) forControlEvents:UIControlEventTouchUpInside];
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

-(void)confirmMessge:(id)sender
{
    if( [self.account.text isEqualToString:self.account2.text] == NO)
    {
        UIAlertView *av= [[UIAlertView alloc] initWithTitle:@"提示" message:@"请确认帐号" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [av show];
    }
    else
    {
        NetGameConfirmViewController  *confirmView = [[NetGameConfirmViewController alloc] init];
        [self.navigationController pushViewController:confirmView animated:YES];
    }
}

@end
