//
//  NewsViewController.m
//  EasyToo
//
//  Created by hydb on 13-6-12.
//
//

#import "NewsViewController.h"
#import "DeviceUtil.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

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
    
    [self.navigationItem setTitle:@"城市咨询"];
    
    [self initHotPointView];
    [self initHouseView];
    [self initTravelView];
    [self initCareerView];
    [self initBrandView];
    [self initPictureView];
    
    [self initSegmentCtrl];
    
    [self addHotPointView];

}

//初始化SegmentCtrl
- (void)initSegmentCtrl
{
    UISegmentedControl* segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, [DeviceUtil getScreenWidth], 30)];
    
    [segment setSegmentedControlStyle:UISegmentedControlStyleBar];
    [segment setBackgroundColor:[UIColor lightGrayColor]];
    [segment insertSegmentWithTitle:@"热点" atIndex:0 animated:NO];
    [segment insertSegmentWithTitle:@"房产" atIndex:1 animated:NO];
    [segment insertSegmentWithTitle:@"旅游" atIndex:2 animated:NO];
    [segment insertSegmentWithTitle:@"职场" atIndex:3 animated:NO];
    [segment insertSegmentWithTitle:@"品牌" atIndex:4 animated:NO];
    [segment insertSegmentWithTitle:@"图库" atIndex:5 animated:NO];
    
    [segment addTarget:self action:@selector(onTabSelected:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segment];
}

-(void)onTabSelected:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    
    switch (control.selectedSegmentIndex) {
        case 0:
            [self addHotPointView];
            [self removeHouseView];
            [self removeTravelView];
            [self removeCareerView];
            [self removeBrandView];
            [self removePictureView];
            break;
        case 1:
            [self removeHotPointView];
            [self addHouseView];
            [self removeTravelView];
            [self removeCareerView];
            [self removeBrandView];
            [self removePictureView];
            break;
        case 2:
            [self removeHotPointView];
            [self removeHouseView];
            [self addTravelView];
            [self removeCareerView];
            [self removeBrandView];
            [self removePictureView];
            break;
        case 3:
            [self removeHotPointView];
            [self removeHouseView];
            [self removeTravelView];
            [self addCareerView];
            [self removeBrandView];
            [self removePictureView];
            break;
        case 4:
            [self removeHotPointView];
            [self removeHouseView];
            [self removeTravelView];
            [self removeCareerView];
            [self addBrandView];
            [self removePictureView];
            break;
        case 5:
            [self removeHotPointView];
            [self removeHouseView];
            [self removeTravelView];
            [self removeCareerView];
            [self removeBrandView];
            [self addPictureView];
            break;
        default:
            break;
    }
    
}


//1热点
- (void)initHotPointView
{
    _hotPointView = [[HotPointView alloc] initWithFrame:CGRectMake(0, 30, [DeviceUtil getScreenWidth], 420 - 30)];
}
- (void)addHotPointView
{
    if (_hotPointView)
    {
        [self.view addSubview:_hotPointView];
    }
}
- (void)removeHotPointView
{
    if (_hotPointView)
    {
        [_hotPointView removeFromSuperview];
    }
}

//2房产
- (void)initHouseView
{
    _houseView = [[HouseView alloc] initWithFrame:CGRectMake(0, 30, [DeviceUtil getScreenWidth], 420 - 30)];
}
- (void)addHouseView
{
    if (_houseView)
    {
        [self.view addSubview:_houseView];
    }
}
- (void)removeHouseView
{
    if (_houseView)
    {
        [_houseView removeFromSuperview];
    }
}

//3旅游
- (void)initTravelView
{
    _travelView = [[TravelView alloc] initWithFrame:CGRectMake(0, 30, [DeviceUtil getScreenWidth], 420 - 30)];
    
}
- (void)addTravelView
{
    if (_travelView)
    {
        [self.view addSubview:_travelView];
    }
}
- (void)removeTravelView
{
    if (_travelView)
    {
        [_travelView removeFromSuperview];
    }
}

//4职场
- (void)initCareerView
{
    _careerView = [[CareerView alloc] initWithFrame:CGRectMake(0, 30, [DeviceUtil getScreenWidth], 420 - 30)];
    
}
- (void)addCareerView
{
    if (_careerView)
    {
        [self.view addSubview:_careerView];
    }
}
- (void)removeCareerView
{
    if (_careerView)
    {
        [_careerView removeFromSuperview];
    }
}

//5品牌
- (void)initBrandView
{
    _brandView = [[BrandView alloc] initWithFrame:CGRectMake(0, 30, [DeviceUtil getScreenWidth], 420 - 30)];
    
}
- (void)addBrandView
{
    if (_brandView)
    {
        [self.view addSubview:_brandView];
    }
}
- (void)removeBrandView
{
    if (_brandView)
    {
        [_brandView removeFromSuperview];
    }
}


//6图库
- (void)initPictureView
{
    _pictureView = [[PictureView alloc] initWithFrame:CGRectMake(0, 30, [DeviceUtil getScreenWidth], 420 - 30)];
    
}
- (void)addPictureView
{
    if (_pictureView)
    {
        [self.view addSubview:_pictureView];
    }
}
- (void)removePictureView
{
    if (_pictureView)
    {
        [_pictureView removeFromSuperview];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
