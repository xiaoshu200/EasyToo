//
//  PlainViewController.m
//  EasyToo
//
//  Created by hydb on 13-6-10.
//
//

#import "PlainViewController.h"

@interface PlainViewController ()

@end

@implementation PlainViewController

@synthesize startTF;
@synthesize arriveTF;
@synthesize companyTF;
@synthesize dateTF;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    startTF = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //定义title
    self.title = @"机票";
    
    //出发
    UIImageView *startImage=[[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 17, 17)];
    [startImage setImage:[UIImage imageNamed:@"start_city.gif"]];
    
    UILabel *startLbl = [[[UILabel alloc]initWithFrame:CGRectMake(40, 10, 50, 50)] autorelease];
    startLbl.text = @"出发：";
    startLbl.font = [UIFont boldSystemFontOfSize:30];
    startLbl.textAlignment = UITextAlignmentCenter;
    startLbl.adjustsFontSizeToFitWidth = YES;
    
    startTF = [[UITextField alloc] initWithFrame:CGRectMake(90, 20, 200, 30)];
    [startTF setBorderStyle:UITextBorderStyleBezel];
    startTF.placeholder = @"出发城市";
    [startTF setDelegate:self];
    
    [self.view addSubview:startImage];
    [self.view addSubview:startLbl];
    [self.view addSubview:startTF];
    
    //到达
    UIImageView *arriveImage=[[UIImageView alloc] initWithFrame:CGRectMake(20, 70, 17, 17)];
    [arriveImage setImage:[UIImage imageNamed:@"arrive_city.gif"]];
    
    UILabel *arriveLbl = [[UILabel alloc]initWithFrame:CGRectMake(40, 60, 50, 50)];
    arriveLbl.text = @"到达：";
    arriveLbl.font = [UIFont boldSystemFontOfSize:30];
    arriveLbl.textAlignment = UITextAlignmentCenter;
    arriveLbl.adjustsFontSizeToFitWidth = YES;
    
    arriveTF = [[UITextField alloc] initWithFrame:CGRectMake(90, 70, 200, 30)];
    [arriveTF setBorderStyle:UITextBorderStyleBezel];
    arriveTF.placeholder = @"到达城市";
    [arriveTF setDelegate:self];
    
    [self.view addSubview:arriveImage];
    [self.view addSubview:arriveLbl];
    [self.view addSubview:arriveTF];
    
    //航空公司
    UILabel *companyLbl = [[[UILabel alloc]initWithFrame:CGRectMake(20, 110, 70, 50)] autorelease];
    companyLbl.text = @"航空公司：";
    companyLbl.font = [UIFont boldSystemFontOfSize:30];
    companyLbl.textAlignment = UITextAlignmentCenter;
    companyLbl.adjustsFontSizeToFitWidth = YES;
    
    companyTF = [[UITextField alloc] initWithFrame:CGRectMake(90, 120, 200, 30)];
    [companyTF setBorderStyle:UITextBorderStyleBezel];
    companyTF.placeholder = @"所有";
    [companyTF setDelegate:self];
    
    [self.view addSubview:companyLbl];
    [self.view addSubview:companyTF];

    //起飞日期
    UILabel *dateLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, 70, 50)];
    dateLbl.text = @"起飞日期：";
    dateLbl.font = [UIFont boldSystemFontOfSize:30];
    dateLbl.textAlignment = UITextAlignmentCenter;
    dateLbl.adjustsFontSizeToFitWidth = YES;
    
    dateTF = [[UITextField alloc] initWithFrame:CGRectMake(90, 160, 200, 30)];
    [dateTF setBorderStyle:UITextBorderStyleBezel];
    [dateTF setDelegate:self];
    
    [self.view addSubview:dateLbl];
    [self.view addSubview:dateTF];
    
    // 建立 UIDatePicker
    datePicker = [[UIDatePicker alloc]init];
    // 時區的問題請再找其他協助 不是本篇重點
    datelocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_TW"];
    datePicker.locale = datelocale;
    datePicker.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    datePicker.datePickerMode = UIDatePickerModeDate;
    // 以下這行是重點 (螢光筆畫兩行) 將 UITextField 的 inputView 設定成 UIDatePicker
    // 則原本會跳出鍵盤的地方 就改成選日期了
    dateTF.inputView = datePicker;
    // 建立 UIToolbar
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    // 選取日期完成鈕 並給他一個 selector
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(cancelPicker)];
    // 把按鈕加進 UIToolbar
    toolBar.items = [NSArray arrayWithObject:right];
    // 以下這行也是重點 (螢光筆畫兩行)
    // 原本應該是鍵盤上方附帶內容的區塊 改成一個 UIToolbar 並加上完成鈕
    dateTF.inputAccessoryView = toolBar;
    
    //查询
    UIButton *queryBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 210, 260, 30)];
    [queryBtn setTitle:@"查询" forState:UIControlStateNormal];
    [queryBtn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:queryBtn];
    
    //添加button方法
    [queryBtn addTarget:self action:@selector(queryEvent) forControlEvents:UIControlEventTouchUpInside];
    
}

// 按下完成鈕後的 method
-(void) cancelPicker {
    // endEditing: 是結束編輯狀態的 method
    if ([self.view endEditing:NO]) {
        // 以下幾行是測試用 可以依照自己的需求增減屬性
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"yyyy-MM-dd" options:0 locale:datelocale];
        [formatter setDateFormat:dateFormat];
        [formatter setLocale:datelocale];
        // 將選取後的日期 填入 UITextField
        dateTF.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//查询事件
- (void)queryEvent
{
    TicketDetailViewController *ticketView = [[TicketDetailViewController alloc] init];
    ticketView.startCity = startTF.text;
    ticketView.arriveCity = arriveTF.text;
    ticketView.companyCity = companyTF.text;
    ticketView.dateCity = dateTF.text;
    [self.navigationController pushViewController:ticketView animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end



