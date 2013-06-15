//
//  CarBusinessViewController.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-11.
//
//

#import "CarBusinessViewController.h"
#import "DeviceUtil.h"
#import "CarTrafficView.h"

@interface CarBusinessViewController ()

@end

@implementation CarBusinessViewController

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
    [self.navigationItem setTitle:@"车务代缴"];
    
    [self initCarTrafficView];
    [self initCarShipView];
    [self initCarYearView];
    
    [self initSegmentCtrl];
    
    [self addCarTrafficView];
    
}

- (void)dealloc
{
    [_carShipView release];
    [_carTrafficView release];
    [_carYearView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initSegmentCtrl
{
    UISegmentedControl* segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, [DeviceUtil getScreenWidth], 30)];
    
    [segment setSegmentedControlStyle:UISegmentedControlStyleBar];
    [segment setBackgroundColor:[UIColor lightGrayColor]];
    [segment insertSegmentWithTitle:@"广州交通违章代缴" atIndex:0 animated:NO];
    [segment insertSegmentWithTitle:@"广州车船税代缴" atIndex:1 animated:NO];
    [segment insertSegmentWithTitle:@"广州年票代缴" atIndex:2 animated:NO];
    
    [segment addTarget:self action:@selector(onTabSelected:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:segment];
}

- (void)initCarTrafficView
{
    _carTrafficView = [[CarTrafficView alloc] initWithFrame:CGRectMake(0, 30, [DeviceUtil getScreenWidth], 420 - 30)];
    
}

- (void)initCarShipView
{
    _carShipView = [[CarShipView alloc] initWithFrame:CGRectMake(0, 30, [DeviceUtil getScreenWidth], 420 - 30)];
}

- (void)initCarYearView
{
    _carYearView = [[CarYearView alloc] initWithFrame:CGRectMake(0, 30, [DeviceUtil getScreenWidth], 420 - 30)];
}

- (void)addCarTrafficView
{
    if (_carTrafficView)
    {
        [self.view addSubview:_carTrafficView];
    }
}

- (void)addCarShipView
{
    if (_carShipView) {
        [self.view addSubview:_carShipView];
    }
}

- (void)addCarYearView
{
    if (_carYearView) {
        [self.view addSubview:_carYearView];
    }
}

- (void)removeCarTrafficView
{
    if (_carTrafficView)
    {
        [_carTrafficView removeFromSuperview];
    }
}

- (void)removeCarShipView
{
    if (_carShipView)
    {
        [_carShipView removeFromSuperview];
    }
}

- (void)removeCarYearView
{
    if (_carYearView) {
        [_carYearView removeFromSuperview];
    }
}

-(void)onTabSelected:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    
    switch (control.selectedSegmentIndex) {
        case 0:
            [self addCarTrafficView];
            [self removeCarShipView];
            [self removeCarYearView];
            break;
        case 1:
            [self addCarShipView];
            [self removeCarTrafficView];
            [self removeCarYearView];
            break;
        case 2:
            [self addCarYearView];
            [self removeCarTrafficView];
            [self removeCarShipView];
            break;
        default:
            break;
    }
 
}




@end
