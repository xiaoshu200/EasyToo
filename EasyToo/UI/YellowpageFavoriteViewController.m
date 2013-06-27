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
    [self.fatherView.navigationItem setTitle:@"收藏"];

	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    /*
    UIBarButtonItem *rightButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash  target:self action:@selector(selectRightAction:)]autorelease];
     */
    //rightButton.enabled= TRUE;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"清除收藏"
                                     style: UIBarButtonItemStyleBordered
                                     target: self
                                     action: @selector(done:)];
    self.fatherView.navigationItem.rightBarButtonItem = rightButton;
}

-(void ) viewWillDisappear:(BOOL)animated
{
    self.fatherView.navigationItem.rightBarButtonItem = nil;
}

-(void)initButton
{    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self action:@selector(selectRightAction:)];
    rightButton.enabled= TRUE;
   self.fatherView.navigationItem.rightBarButtonItem = rightButton;
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


-(void)selectRightAction:(UIButton*)button
{
    printf("we delete some of the favorites\n");
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
