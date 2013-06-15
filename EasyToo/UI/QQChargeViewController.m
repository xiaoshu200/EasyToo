//
//  QQChargeViewController.m
//  QQCharge
//
//  Created by linshengqin on 13-6-10.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//

#import "QQChargeViewController.h"
#import "ConfirmMessageViewController.h"
#import "DropDownList.h"

@interface QQChargeViewController ()

@end

@implementation QQChargeViewController

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
    self.qqNumber = [[UITextField alloc] initWithFrame:CGRectMake(30, 60, 250, 30)];
    [self.qqNumber setBorderStyle:UITextBorderStyleBezel];
    self.qqNumber.placeholder = @"QQ帐号";
    [self.view addSubview:self.qqNumber];
    self.qqNumber.delegate = self;
    
    self.qqNumber2 = [[UITextField alloc] initWithFrame:CGRectMake(30, 110, 250, 30)];
    [self.qqNumber2 setBorderStyle:UITextBorderStyleBezel];
    self.qqNumber2.placeholder = @"确认QQ帐号";
    [self.view addSubview:self.qqNumber2];
    self.qqNumber2.delegate = self;

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30,150, 180, 30)];
    label.text = @"选择面额:";
    [self.view addSubview:label];
    
 //   self.label_num = [[UITextField alloc] initWithFrame:CGRectMake(110, 150, 180, 30)];
    self.label_num = [[DropDownList alloc] initWithFrame:CGRectMake(110, 150, 180, 30)];
    [self.label_num  setBorderStyle:UITextBorderStyleBezel];
//    self.label_num .placeholder = @"1";
    [self.view addSubview:self.label_num ];
//    self.label_num .delegate = self;
    
    UILabel *price = [[UILabel alloc]initWithFrame:CGRectMake(30,190, 100, 30)];
    price.text = @"价格:";
    [self.view addSubview:price];
    
    UIButton *nextStep =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextStep.frame = CGRectMake(110, 230, 150, 30);
//    [[UIButton alloc] initWithFrame:CGRectMake(110, 230, 150, 30)];
     [nextStep setTitle:@"下一步" forState:UIControlStateNormal];
 //   nextStep.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:nextStep];
    [nextStep addTarget:self action:@selector(confirmMessge:) forControlEvents:UIControlEventTouchUpInside];
	// Do any additional setup after loading the view.
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
    if( [self.qqNumber.text isEqualToString:self.qqNumber2.text] == NO)
    {
        UIAlertView *av= [[UIAlertView alloc] initWithTitle:@"提示" message:@"请确认QQ号" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [av show];
    }
    /*
    else if( [self.label_num.textField.text length] <= 0)
    {
        UIAlertView *av= [[UIAlertView alloc] initWithTitle:@"提示" message:@"请确认充值数" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [av show];
    }
     */
    else
    {
        ConfirmMessageViewController  *confirmView = [[ConfirmMessageViewController alloc] init];
        confirmView.account = self.qqNumber.text;
        NSLog(@"11111 is:%@",self.label_num.textField.text);
        confirmView.price = [self.label_num.textField.text intValue];
        [self.navigationController pushViewController:confirmView animated:YES];
    }
}

@end
