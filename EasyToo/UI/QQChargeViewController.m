//
//  QQChargeViewController.m
//  QQCharge
//
//  Created by linshengqin on 13-6-10.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//

#import "QQChargeViewController.h"
#import "QQChargeConfirmViewController.h"

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
    
    [self.navigationItem setTitle:@"Q币"];
    
    
    UILabel *label_qq = [[[UILabel alloc]initWithFrame:CGRectMake(30, 10, 180, 30)]autorelease];
    label_qq.text = @"填写QQ信息:";
    [self.view addSubview:label_qq];
    
    self.qqNumber = [[[UITextField alloc] initWithFrame:CGRectMake(30, 40, 250, 30)]autorelease];
    [self.qqNumber setBorderStyle:UITextBorderStyleBezel];
    self.qqNumber.placeholder = @"QQ帐号";
    [self.view addSubview:self.qqNumber];
    self.qqNumber.delegate = self;
    self.qqNumber.keyboardType = UIKeyboardTypeNumberPad;
    self.qqNumber.returnKeyType = UIReturnKeyDone;
    
    
    UILabel *label_value = [[[UILabel alloc]initWithFrame:CGRectMake(30, 80, 180, 30)]autorelease];
    label_value.text = @"请选择充值面额:";
    [self.view addSubview:label_value];
    
    text_value = [[[UITextField alloc] initWithFrame:CGRectMake(30, 110, 250, 30)]autorelease];
    [text_value setBorderStyle:UITextBorderStyleBezel];
    [text_value setDelegate:self];
    
    [self.view addSubview:text_value];
    // 建立 UIToolbar
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(cancelPicker)];
    // 把按鈕加進 UIToolbar
    toolBar.items = [NSArray arrayWithObject:right];
    text_value.inputAccessoryView = toolBar;
    
    pickerArray = [[NSArray arrayWithObjects:@"10",@"30",@"50",@"100",@"200",@"250", nil] retain];
    selectPicker = [[[UIPickerView alloc]initWithFrame:CGRectZero]autorelease];
    selectPicker.showsSelectionIndicator = YES;
    selectPicker.frame = CGRectMake(0, 100, 0, 0);
    
    text_value.inputAccessoryView = toolBar;
    text_value.delegate = self;
    selectPicker.delegate = self;
    selectPicker.dataSource = self;
    selectPicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    text_value.inputView = selectPicker;
    
    UILabel *label_pay = [[[UILabel alloc]initWithFrame:CGRectMake(30, 150, 180, 30)]autorelease];
    label_pay.text = @"选择支付方式:";
    [self.view addSubview:label_pay];
    
    UIButton *zfbButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 180, 100, 30)];
    [zfbButton setBackgroundImage:[UIImage imageNamed:@"zfb"] forState:UIControlStateNormal];
    [self.view addSubview:zfbButton];
    
    UIButton *ybButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 180, 100, 30)];
    [ybButton setBackgroundImage:[UIImage imageNamed:@"yibao"] forState:UIControlStateNormal];
    [self.view addSubview:ybButton];

    
    UIButton *nextStep =[[UIButton buttonWithType:UIButtonTypeCustom]autorelease];
    nextStep.frame = CGRectMake(120, 220, 80, 30);
    [nextStep setBackgroundImage:[UIImage imageNamed:@"djf_queren"] forState:UIControlStateNormal];
    [self.view addSubview:nextStep];
    [nextStep addTarget:self action:@selector(confirmMessge:) forControlEvents:UIControlEventTouchUpInside];
    
    
	// Do any additional setup after loading the view.
}

// 按下完成鈕後的 method
-(void) cancelPicker {
    [text_value endEditing:YES];
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

#pragma mark - UITextFieldDelegate

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.qqNumber resignFirstResponder];
    
}
-(void)confirmMessge:(id)sender
{
    QQChargeConfirmViewController  *confirmView = [[[QQChargeConfirmViewController alloc] init]autorelease];
    confirmView.account = self.qqNumber.text;
    confirmView.price   = [text_value.text intValue];
    [self.navigationController pushViewController:confirmView animated:YES];
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
        pickerLabel = [[[UILabel alloc] init]autorelease];
        // Setup label properties - frame, font, colors etc
        //adjustsFontSizeToFitWidth property to YES
        //        pickerLabel.minimumFontSize =100.;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSInteger row = [selectPicker selectedRowInComponent:0];
    text_value.text = [pickerArray objectAtIndex:row];
}

- (IBAction)selectButton:(id)sender {
    [text_value endEditing:YES];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	return 100.0;
}

@end
