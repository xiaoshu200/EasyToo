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
    
    [self.navigationItem setTitle:@"网络游戏直充"];
	// Do any additional setup after loading the view.
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 250, 30)];
    [titleLabel setText:@"选择游戏和金额"];
    [self.view addSubview:titleLabel];
 
    
    
    self.gameType = [[UITextField alloc] initWithFrame:CGRectMake(30, 60, 250, 30)];
    [self.gameType setBorderStyle:UITextBorderStyleBezel];
    [self.view addSubview:self.gameType];
    self.gameType.delegate = self;
    self.gameType.tag = 1;
    
    // 建立 UIToolbar
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(cancelPicker)];
    // 把按鈕加進 UIToolbar
    toolBar.items = [NSArray arrayWithObject:right];
    self.gameType.inputAccessoryView = toolBar;
    
    pickerArray = [[NSArray arrayWithObjects:@"10",@"30",@"50",@"100",@"200",@"250", nil] retain];
    selectPicker = [[UIPickerView alloc]initWithFrame:CGRectZero];
    selectPicker.showsSelectionIndicator = YES;
    selectPicker.frame = CGRectMake(0, 100, 0, 0);
    selectPicker.delegate = self;
    selectPicker.dataSource = self;
    
    self.gameType.inputAccessoryView = toolBar;
    
    
    selectPicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    self.gameType.inputView = selectPicker;

    self.cardType = [[UITextField alloc] initWithFrame:CGRectMake(30, 110, 250, 30)];
    [self.cardType setBorderStyle:UITextBorderStyleBezel];
    [self.view addSubview:self.cardType];
    self.cardType.delegate = self;
    self.cardType.tag = 2;
    self.cardType.inputAccessoryView = toolBar;
    selectPicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    self.cardType.inputView = selectPicker;
    
    self.cardNum = [[UITextField alloc] initWithFrame:CGRectMake(30, 150, 250, 30)];
    [self.cardNum setBorderStyle:UITextBorderStyleBezel];
    [self.view addSubview:self.cardNum];
    self.cardNum.delegate = self;
    self.cardNum.tag = 3;
    self.cardNum.inputAccessoryView = toolBar;
    selectPicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    self.cardNum.inputView = selectPicker;
    
    self.account = [[UITextField alloc] initWithFrame:CGRectMake(30, 190, 250, 30)];
    [self.account setBorderStyle:UITextBorderStyleBezel];
    self.account.placeholder = @"充值帐号";
    [self.view addSubview:self.account];
    self.account.delegate = self;
    self.account.tag = 4;
    self.account.inputAccessoryView = toolBar;
    selectPicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    self.account.inputView = selectPicker;
    
    
    self.account2 = [[UITextField alloc] initWithFrame:CGRectMake(30, 230, 250, 30)];
    [self.account2 setBorderStyle:UITextBorderStyleBezel];
    self.account2.placeholder = @"确认充值帐号";
    [self.view addSubview:self.account2];
    self.account2.delegate = self;
    self.account2.tag = 5;
    self.account2.inputAccessoryView = toolBar;
    selectPicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    self.account2.inputView = selectPicker;

    UIButton *nextStep =[UIButton buttonWithType:UIButtonTypeCustom];
    nextStep.frame = CGRectMake(110, 270, 90, 30);
    [nextStep setBackgroundImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
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
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = rect;
    [UIView commitAnimations];
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


#pragma picker delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        // Setup label properties - frame, font, colors etc
        //adjustsFontSizeToFitWidth property to YES
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:UITextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0);//键盘高度216
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    if(offset > 0)
    {
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        self.view.frame = rect;
    }
    [UIView commitAnimations];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSInteger row = [selectPicker selectedRowInComponent:0];
    printf("textField tag is:%d\n",textField.tag);
    if( textField.tag == 1)
        self.gameType.text = [pickerArray objectAtIndex:row];
    if( textField.tag == 2)
        self.cardType.text = [pickerArray objectAtIndex:row];
    if( textField.tag == 3)
        self.cardNum.text = [pickerArray objectAtIndex:row];
    if( textField.tag == 4)
        self.account.text = [pickerArray objectAtIndex:row];
    if( textField.tag == 5)
        self.account2.text = [pickerArray objectAtIndex:row];
    
}

// 按下完成鈕後的 method
-(void) cancelPicker {
    [self.gameType endEditing:YES];
    [self.cardType endEditing:YES];
    [self.cardNum endEditing:YES];
    [self.account endEditing:YES];
    [self.account2 endEditing:YES];
}
@end
