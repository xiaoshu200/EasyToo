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
    
    [self.navigationItem setTitle:@"Q币充值"];
    
    self.qqNumber = [[UITextField alloc] initWithFrame:CGRectMake(30, 40, 250, 30)];
    [self.qqNumber setBorderStyle:UITextBorderStyleBezel];
    self.qqNumber.placeholder = @"QQ帐号";
    [self.view addSubview:self.qqNumber];
    self.qqNumber.delegate = self;
    self.qqNumber.keyboardType = UIKeyboardTypeNumberPad;
    self.qqNumber.returnKeyType = UIReturnKeyDone;
    
    self.qqNumber2 = [[UITextField alloc] initWithFrame:CGRectMake(30, 90, 250, 30)];
    [self.qqNumber2 setBorderStyle:UITextBorderStyleBezel];
    self.qqNumber2.placeholder = @"确认QQ帐号";
    [self.view addSubview:self.qqNumber2];
    self.qqNumber2.delegate = self;
    self.qqNumber2.keyboardType = UIKeyboardTypeNumberPad;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 130, 180, 30)];
    label.text = @"选择面额:";
    [self.view addSubview:label];
    
    text_value = [[UITextField alloc] initWithFrame:CGRectMake(110, 130, 180, 30)];
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
    selectPicker = [[UIPickerView alloc]initWithFrame:CGRectZero];
    selectPicker.showsSelectionIndicator = YES;
    selectPicker.frame = CGRectMake(0, 100, 0, 0);

    text_value.inputAccessoryView = toolBar;
    text_value.delegate = self;
    selectPicker.delegate = self;
    selectPicker.dataSource = self;
    selectPicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    text_value.inputView = selectPicker;
    
    UILabel *price = [[UILabel alloc]initWithFrame:CGRectMake(30,170, 100, 30)];
    price.text = @"价格:";
    [self.view addSubview:price];
    
    UIButton *nextStep =[UIButton buttonWithType:UIButtonTypeCustom];
    nextStep.frame = CGRectMake(100, 230, 90, 30);
    [nextStep setBackgroundImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
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
    [self.qqNumber2 resignFirstResponder];
    
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
        confirmView.price   = [text_value.text intValue];
//        NSLog(@"11111 is:%@",self.label_num.textField.text);
//        confirmView.price = [self.label_num.textField.text intValue];
        [self.navigationController pushViewController:confirmView animated:YES];
    }
}

- (void)onBtnClick:(id)sender
{
    if (!self.dropDown)
    {
        [self addDropDown:sender];
    }
    else
    {
        [self removeDropDown:sender];
    }
}

- (void)addDropDown:(id)button
{
    NSArray * arr = [NSArray arrayWithObjects:@"10", @"30", @"50", @"100", @"150", nil];
    
    CGFloat f = 200;
    self.dropDown = [[NIDropDown alloc]showDropDown:button :&f :arr];
    self.dropDown.delegate = self;
}

- (void)removeDropDown:(id)button
{
    [self.dropDown hideDropDown:button];
    self.dropDown = nil;
}

- (void)niDropDownDelegateMethod: (NIDropDown *) sender {
    self.dropDown = nil;
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
