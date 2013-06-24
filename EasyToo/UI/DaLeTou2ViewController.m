//
//  DaLeTou2ViewController.m
//  EasyToo
//
//  Created by linshengqin on 13-6-15.
//
//

#import "DaLeTou2ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface DaLeTou2ViewController ()

@end

@implementation DaLeTou2ViewController

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
    [self.navigationItem setTitle:@"大乐透"];
    [super viewDidLoad];
    _red_btnArray = [[NSMutableArray alloc]init];
    _blue_btnArray = [[NSMutableArray alloc]init];
    [self initLable];
    [self initButton];
    [self initToolBar];
	// Do any additional setup after loading the view.
    [self becomeFirstResponder]; // for shaking

}

-(void) initToolBar
{
    _myToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 375, 320, 44)];
	_myToolbar.barStyle = UIBarStyleBlackOpaque;
    _toolbarArray = [[NSMutableArray alloc] init];
    [_toolbarArray addObject:[[UIBarButtonItem alloc] initWithTitle:@"清空" style:UIBarButtonItemStyleDone target:self action:@selector(onClickCancle:)]];
    
    
    _toolbarLabel = [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 100.0f, 200.0f, 30.0f)];
    _toolbarLabel.font=[UIFont systemFontOfSize:16];
    _toolbarLabel.backgroundColor = [UIColor clearColor];
    _toolbarLabel.textAlignment=NSTextAlignmentCenter;
    _toolbarLabel.text  = @"共0注 0元";
    _toolbarLabel.textColor = [UIColor whiteColor];
    UIBarButtonItem *myButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_toolbarLabel];
    
    [_toolbarArray addObject: myButtonItem]; //添加文本
    // flex item used to separate the left groups items and right grouped items
	UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                              target:nil
                                                                              action:nil];
    [_toolbarArray addObject:flexItem];
    [_toolbarArray addObject:[[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(onClickConfirm:)]];
    
    
    
    [_myToolbar setItems:_toolbarArray];
    
    [self.view addSubview:_myToolbar];
    
}

-(void)onClickCancle:(id)sender
{
    printf("cancle\n");
}

-(void)onClickConfirm:(id)sender
{
    printf("red button objects count is %d\n",[_red_btnArray count]);
    int red_count = 0;
    int blue_count = 0;
    for (UIButton *button in _red_btnArray) {
        if( button.selected == YES )
            red_count++;
    }
    
    for (UIButton *button in _blue_btnArray) {
        if( button.selected == YES )
            blue_count++;
    }
    //  _toolbarLabel.text  = @"共0注 0元";
    _toolbarLabel.text = [NSString stringWithFormat:@"红球%d个 蓝球%d个",red_count,blue_count];
}

-(void) initLable
{
    tips = [[UILabel alloc] initWithFrame:CGRectMake(150, 0, 170, 30)];
    tips.text =  @"至少选择5个红球,1个蓝球";
    tips.font = [UIFont boldSystemFontOfSize:12.0f];  //UILabel的字体大小
    tips.textAlignment = NSTextAlignmentLeft;  //文本对齐方式
    [self.view addSubview:tips];
    
    UILabel *tips2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    tips2.text =  @"摇一摇机选";
    tips2.font = [UIFont boldSystemFontOfSize:12.0f];  //UILabel的字体大小
    tips2.textAlignment = NSTextAlignmentCenter;  //文本对齐方式
    [self.view addSubview:tips2];
    
}
#define MAX_RED_NUM 35
#define MAX_BULE_NUM 12
-(void) initButton
{
    
    /*红球*/
    int red_num = 0;
    while (red_num<MAX_RED_NUM) {
        
        m_button = [UIButton buttonWithType:UIButtonTypeCustom];
        m_button.frame = CGRectMake(20+(red_num%7)*40, (red_num/7)*40+40, 40, 40);
        m_button.tag=red_num+1;
        // Set the font and color
        [m_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [m_button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        m_button.titleLabel.font = [UIFont boldSystemFontOfSize:10.0f];
        
        [m_button setTitle:[NSString stringWithFormat:@"%02d",red_num+1] forState:UIControlStateNormal];
        
        [m_button setBackgroundColor:[UIColor clearColor]];
        [m_button setBackgroundImage:[UIImage imageNamed:@"cp_ssqiu_bg"] forState:UIControlStateNormal ];
        [m_button setBackgroundImage:[UIImage imageNamed:@"cp_ssqiured_bg"]forState:UIControlStateSelected];
        
        [m_button addTarget:self action:@selector(touristEvent:) forControlEvents:UIControlEventTouchUpInside];
        [_red_btnArray addObject:m_button];
        [self.view addSubview:m_button];
        red_num++;
    }
    
    /*蓝球*/
    int blue_num = 0;
    while (blue_num<MAX_BULE_NUM) {
        
        m_button = [UIButton buttonWithType:UIButtonTypeCustom];
        m_button.frame = CGRectMake(20+(blue_num%7)*40, (blue_num/7)*40+(red_num/7)*40+60, 40, 40);
        m_button.tag=blue_num+1;
        // Set the font and color
        [m_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [m_button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        m_button.titleLabel.font = [UIFont boldSystemFontOfSize:10.0f];
        
        [m_button setTitle:[NSString stringWithFormat:@"%02d",blue_num+1] forState:UIControlStateNormal];
        
        [m_button setBackgroundColor:[UIColor clearColor]];
        [m_button setBackgroundImage:[UIImage imageNamed:@"cp_ssqiu_bg"] forState:UIControlStateNormal ];
        [m_button setBackgroundImage:[UIImage imageNamed:@"cp_ssqiublue_bg"]forState:UIControlStateSelected];
        
        [m_button addTarget:self action:@selector(touristEvent:) forControlEvents:UIControlEventTouchUpInside];
        [_blue_btnArray addObject:m_button];
        [self.view addSubview:m_button];
        blue_num++;
    }
}

-(void)touristEvent:(id)sender
{
    UIButton *button = (UIButton *)sender;
    button.selected = !button.selected;
    
}

#pragma mark shark delegate

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    
    //检测到摇动
    printf("shaking begin!\n");
}



- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    
    //摇动取消
    
}



- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    
    //摇动结束
    
    if (event.subtype == UIEventSubtypeMotionShake) {
        
        //something happens
        printf("shaking end!\n");
        _toolbarLabel.text = [NSString stringWithFormat:@"别摇我"];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
