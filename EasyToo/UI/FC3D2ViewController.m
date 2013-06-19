//
//  FC3D2ViewController.m
//  EasyToo
//
//  Created by linshengqin on 13-6-18.
//
//

#import "FC3D2ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface FC3D2ViewController ()

@end

@implementation FC3D2ViewController

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
    [self initLable];
    [self initToolBar];
    [self initButton];
	// Do any additional setup after loading the view.
    [self becomeFirstResponder]; // for shaking

}

#define MAX_NUM 10
-(void) initButton
{
    
    /*红球*/
    int tag = 0;
    int num = 0;
    while (num<MAX_NUM)
    {
        m_button = [UIButton buttonWithType:UIButtonTypeCustom];
        m_button.frame = CGRectMake(90+(tag%5)*40, (tag/5)*40+30, 40, 40);
        m_button.tag=tag;
        // Set the font and color
        [m_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [m_button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        m_button.titleLabel.font = [UIFont boldSystemFontOfSize:10.0f];
        
        [m_button setTitle:[NSString stringWithFormat:@"%d",num] forState:UIControlStateNormal];
        
        [m_button setBackgroundColor:[UIColor clearColor]];
        [m_button setBackgroundImage:[UIImage imageNamed:@"cp_ssqiu_bg"] forState:UIControlStateNormal ];
        [m_button setBackgroundImage:[UIImage imageNamed:@"cp_ssqiured_bg"]forState:UIControlStateSelected];
        
        [m_button addTarget:self action:@selector(touristEvent:) forControlEvents:UIControlEventTouchUpInside];
        [_btnArray addObject:m_button];
        [self.view addSubview:m_button];
        num++;
        tag++;
    }
    num = 0;
    while (num<MAX_NUM)
    {
        m_button = [UIButton buttonWithType:UIButtonTypeCustom];
        m_button.frame = CGRectMake(90+(tag%5)*40, (tag/5)*40+60, 40, 40);
        m_button.tag=tag;
        // Set the font and color
        [m_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [m_button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        m_button.titleLabel.font = [UIFont boldSystemFontOfSize:10.0f];
        
        [m_button setTitle:[NSString stringWithFormat:@"%d",num] forState:UIControlStateNormal];
        
        [m_button setBackgroundColor:[UIColor clearColor]];
        [m_button setBackgroundImage:[UIImage imageNamed:@"cp_ssqiu_bg"] forState:UIControlStateNormal ];
        [m_button setBackgroundImage:[UIImage imageNamed:@"cp_ssqiured_bg"]forState:UIControlStateSelected];
        
        [m_button addTarget:self action:@selector(touristEvent:) forControlEvents:UIControlEventTouchUpInside];
        [_btnArray addObject:m_button];
        [self.view addSubview:m_button];
        num++;
        tag++;
    }
    num = 0;
    while (num<MAX_NUM)
    {
        m_button = [UIButton buttonWithType:UIButtonTypeCustom];
        m_button.frame = CGRectMake(90+(tag%5)*40, (tag/5)*40+90, 40, 40);
        m_button.tag=tag;
        // Set the font and color
        [m_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [m_button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        m_button.titleLabel.font = [UIFont boldSystemFontOfSize:10.0f];
        
        [m_button setTitle:[NSString stringWithFormat:@"%d",num] forState:UIControlStateNormal];
        
        [m_button setBackgroundColor:[UIColor clearColor]];
        [m_button setBackgroundImage:[UIImage imageNamed:@"cp_ssqiu_bg"] forState:UIControlStateNormal ];
        [m_button setBackgroundImage:[UIImage imageNamed:@"cp_ssqiured_bg"]forState:UIControlStateSelected];
        
        [m_button addTarget:self action:@selector(touristEvent:) forControlEvents:UIControlEventTouchUpInside];
        [_btnArray addObject:m_button];
        [self.view addSubview:m_button];
        num++;
        tag++;
    }
    
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

-(void) initLable
{
    tips = [[UILabel alloc] initWithFrame:CGRectMake(150, 0, 170, 30)];
    tips.text =  @"至少选择一位数字";
    tips.font = [UIFont boldSystemFontOfSize:14.0f];  //UILabel的字体大小
    tips.textAlignment = NSTextAlignmentLeft;  //文本对齐方式
    [self.view addSubview:tips];
    
    UILabel *tips2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    tips2.text =  @"摇一摇机选";
    tips2.font = [UIFont boldSystemFontOfSize:14.0f];  //UILabel的字体大小
    tips2.textAlignment = NSTextAlignmentCenter;  //文本对齐方式
    [self.view addSubview:tips2];
    
    UILabel *tips3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 40, 40)];
    tips3.text =  @"百位";
    tips3.font = [UIFont boldSystemFontOfSize:14.0f];  //UILabel的字体大小
    tips3.textAlignment = NSTextAlignmentCenter;  //文本对齐方式
    [self.view addSubview:tips3];
    
    
    UILabel *tips4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 40, 40)];
    tips4.text =  @"十位";
    tips4.font = [UIFont boldSystemFontOfSize:14.0f];  //UILabel的字体大小
    tips4.textAlignment = NSTextAlignmentCenter;  //文本对齐方式
    [self.view addSubview:tips4];
    
    UILabel *tips5 = [[UILabel alloc] initWithFrame:CGRectMake(0, 270, 40, 40)];
    tips5.text =  @"个位";
    tips5.font = [UIFont boldSystemFontOfSize:14.0f];  //UILabel的字体大小
    tips5.textAlignment = NSTextAlignmentCenter;  //文本对齐方式
    [self.view addSubview:tips5];
    
    
}

-(void)touristEvent:(id)sender
{
    UIButton *button = (UIButton *)sender;
    button.selected = !button.selected;
    
}


-(void)onClickCancle:(id)sender
{
    printf("cancle\n");
}

-(void)onClickConfirm:(id)sender
{
    printf("confirm\n");
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
