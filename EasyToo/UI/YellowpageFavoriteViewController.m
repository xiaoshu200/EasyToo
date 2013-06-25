//
//  YellowpageFavoriteViewController.m
//  EasyToo
//
//  Created by linshengqin on 13-6-12.
//
//

#import "YellowpageFavoriteViewController.h"
#import "DeviceUtil.h"
@interface YellowpageFavoriteViewController ()

@end

@implementation YellowpageFavoriteViewController

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
    [self initButton];
    [self initTableView];
	// Do any additional setup after loading the view.
}

-(void)initButton
{
    /*
    UIButton *_btnDish = [[UIButton alloc] initWithFrame:CGRectMake(120, 0, 100, 40)];
    [_btnDish setBackgroundImage:[UIImage imageNamed:@"buttonup"] forState:UIControlStateNormal];
    [self.view addSubview:_btnDish];
    UILabel *label_dish = [[UILabel alloc]initWithFrame:CGRectMake(20,0,60,40)];
    label_dish.text = @"清除收藏";
    label_dish.font = [UIFont boldSystemFontOfSize:13];
    [label_dish setBackgroundColor:[UIColor clearColor]];
    label_dish.textAlignment = UITextAlignmentCenter;
    label_dish.adjustsFontSizeToFitWidth = YES;
    [_btnDish addSubview:label_dish];
     */
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self action:@selector(selectRightAction:)];
    rightButton.enabled= TRUE;
 //   self.navigationItem.rightBarButtonItem = rightButton;
}
- (void)initTableView
{
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [DeviceUtil getScreenWidth], 420 - 40 - 40) style:UITableViewStylePlain];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* dequeueBgIdentifer = @"cellview";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:dequeueBgIdentifer];
    
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dequeueBgIdentifer] autorelease];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //IBGImage(@"sod_test");
    return cell;
}

#pragma delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField setText:@""];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
