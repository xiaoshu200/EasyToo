//
//  ElectrolysisViewController.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-11.
//
//

#import "ElectrolysisViewController.h"
#import "DeviceUtil.h"

#define VIEW_FRAME CGRectMake(0, 40, [DeviceUtil getScreenWidth], 380)

@interface ElectrolysisViewController ()

@end

@implementation ElectrolysisViewController

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
    [self.navigationItem setTitle:@"电费代缴"];
    
    [self initSearchView];
    [self initPayView];
    [self initHistroyView];
    [self initShopView];
    [self initSaveView];
    [self initQAView];
    [self initShareView];

    [self initSegmentView];
    
    [self addSearchView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initSegmentView
{
    UISegmentedControl* segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, [DeviceUtil getScreenWidth], 40)];
    
    [segment setSegmentedControlStyle:UISegmentedControlStyleBar];
    [segment setBackgroundColor:[UIColor lightGrayColor]];
    [segment insertSegmentWithTitle:@"查询" atIndex:0 animated:NO];
    [segment insertSegmentWithTitle:@"缴纳" atIndex:1 animated:NO];
    [segment insertSegmentWithTitle:@"历史" atIndex:2 animated:NO];
    [segment insertSegmentWithTitle:@"网点" atIndex:3 animated:NO];
    [segment insertSegmentWithTitle:@"知识" atIndex:4 animated:NO];
    [segment insertSegmentWithTitle:@"问答" atIndex:5 animated:NO];
    [segment insertSegmentWithTitle:@"分享" atIndex:6 animated:NO];

    [segment addTarget:self action:@selector(onTabSelected:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segment];
}

- (void)initSearchView
{
    _searchView = [[ElectrolysisSearchView alloc] initWithFrame:VIEW_FRAME];
}

- (void)initPayView
{
    _payView = [[ElecPayView alloc] initWithFrame:VIEW_FRAME];
}

- (void)initHistroyView
{
    _histroyView = [[ElecHistroyView alloc] initWithFrame:VIEW_FRAME];
}

- (void)initShopView
{
    _shopView = [[ElecShopView alloc] initWithFrame:VIEW_FRAME];
}

- (void)initSaveView
{
    _saveView = [[ElecSaveVIew alloc] initWithFrame:VIEW_FRAME];
}

- (void)initQAView
{
    _qaView = [[ElecQAView alloc] initWithFrame:VIEW_FRAME];
}

- (void)initShareView
{
    _shareView = [[ElecShareView alloc] initWithFrame:VIEW_FRAME];
}

- (void)addSearchView
{
    [self.view addSubview:_searchView];
}

- (void)addPayView
{
    [self.view addSubview:_payView];
}

- (void)addHistroyView
{
    [self.view addSubview:_histroyView];
}

- (void)addShopView
{
    [self.view addSubview:_shopView];
}

- (void)addSaveView
{
    [self.view addSubview:_saveView];
}

- (void)addQAView
{
    [self.view addSubview:_qaView];
}

- (void)addShareView
{
    [self.view addSubview:_shareView];
}

- (void)removeSearchView
{
    [_searchView removeFromSuperview];
}

- (void)removePayView
{
    [_payView removeFromSuperview];
}

- (void)removeHistroyView
{
    [_histroyView removeFromSuperview];
}

- (void)removeShopView
{
    [_shopView removeFromSuperview];
}

- (void)removeSaveView
{
    [_saveView removeFromSuperview];
}

- (void)removeQAView
{
    [_qaView removeFromSuperview];
}

- (void)removeShareView
{
    [_shareView removeFromSuperview];
}

- (void)removeAllSubView
{
    [self removeSearchView];
    [self removePayView];
    [self removeHistroyView];
    [self removeShopView];
    [self removeSaveView];
    [self removeQAView];
    [self removeShareView];
}

-(void)onTabSelected:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    [self removeAllSubView];
    switch (control.selectedSegmentIndex) {
        case 0:
            [self addSearchView];
            break;
        case 1:
            [self addPayView];
            break;
        case 2:
            [self addHistroyView];
            break;
        case 3:
            [self addShopView];
            break;
        case 4:
            [self addSaveView];
            break;
        case 5:
            [self addQAView];
            break;
        case 6:
            [self addShareView];
            break;
        default:
            break;
    }
}

@end
