//
//  FC3D2ViewController.m
//  EasyToo
//
//  Created by linshengqin on 13-6-18.
//
//

#import "FC3D2ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "DeviceUtil.h"

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
    [self.navigationItem setTitle:@"3D直选"];
    
    [self initSegmentView];
    
    [self initZhiXuanView];
    [self initZuSanView];
    [self initZuLiuView];
    [self addZhiXuanView];
	// Do any additional setup after loading the view.

}

- (void)initZhiXuanView
{
    _zhixuanView = [[_DZHIXUAN alloc] initWithFrame:CGRectMake(0, 30, [DeviceUtil getScreenWidth], 420 - 30)];
    
}

- (void)addZhiXuanView
{
    if (_zhixuanView)
    {
        [self.view addSubview:_zhixuanView];
    }
}


- (void)removeZhiXuanView
{
    if (_zhixuanView)
    {
        [_zhixuanView removeFromSuperview];
    }
}


- (void)initZuSanView
{
    _zusanView = [[_DZUSAN alloc] initWithFrame:CGRectMake(0, 30, [DeviceUtil getScreenWidth], 420 - 30)];
    
}

- (void)addZuSanView
{
    if (_zusanView)
    {
        [self.view addSubview:_zusanView];
    }
}

- (void)removeZuSanView
{
    if (_zusanView)
    {
        [_zusanView removeFromSuperview];
    }
}


- (void)initZuLiuView
{
    _zuliuView = [[_DZULIU alloc] initWithFrame:CGRectMake(0, 30, [DeviceUtil getScreenWidth], 420 - 30)];
    
}

- (void)addZuLiuView
{
    if (_zuliuView)
    {
        [self.view addSubview:_zuliuView];
    }
}

- (void)removeZuLiuView
{
    if (_zuliuView)
    {
        [_zuliuView removeFromSuperview];
    }
}

- (void)initSegmentView
{
    UISegmentedControl* segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, [DeviceUtil getScreenWidth], 40)];
    
    [segment setSegmentedControlStyle:UISegmentedControlStyleBar];
    
    segment.tintColor= [UIColor colorWithRed:0.23 green:0.20 blue:0.22 alpha:0.90];
    [segment setBackgroundColor:[UIColor lightGrayColor]];
    [segment insertSegmentWithTitle:@"直选" atIndex:0 animated:NO];
    [segment insertSegmentWithTitle:@"组三" atIndex:1 animated:NO];
    [segment insertSegmentWithTitle:@"组六" atIndex:2 animated:NO];

    
    [segment addTarget:self action:@selector(onTabSelected:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segment];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) dealloc
{
    [_zhixuanView release];
    [_zuliuView release];
    [_zusanView release];
    [super dealloc];
}
-(void)onTabSelected:(id)sender
{
    //    UISegmentedControl *control = (UISegmentedControl *)sender;
    UISegmentedControl *control = (UISegmentedControl *)sender;
    
    switch (control.selectedSegmentIndex) {
        case 0:
            [self addZhiXuanView];
            [self removeZuSanView];
            [self removeZuLiuView];
            [self.navigationItem setTitle:@"3D直选"];
            break;
        case 1:
            [self addZuSanView];
            [self removeZhiXuanView];
            [self removeZuLiuView];
            [self.navigationItem setTitle:@"3D组三"];
            break;
        case 2:
            [self addZuLiuView];
            [self removeZhiXuanView];
            [self removeZuSanView];
            [self.navigationItem setTitle:@"3D组六"];
            break;
        default:
            break;
    }
    

}
@end
