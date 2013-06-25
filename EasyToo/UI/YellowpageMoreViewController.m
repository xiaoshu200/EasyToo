//
//  YellowpageMoreViewController.m
//  EasyToo
//
//  Created by linshengqin on 13-6-25.
//
//

#import "YellowpageMoreViewController.h"
#import "DeviceUtil.h"

@interface YellowpageMoreViewController ()

@end

@implementation YellowpageMoreViewController

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
    [self initData];
    [self initTableView];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
	// this UIViewController is about to re-appear, make sure we remove the current selection in our table view
  /*
	NSIndexPath *tableSelection = [self indexPathForSelectedRow];
	[self deselectRowAtIndexPath:tableSelection animated:NO];
   */
}


-(void) initData
{
    NSArray *m_array = [NSArray arrayWithObjects:@"设置", @"分享", @"反馈",@"关于",nil];
    self.menuList = [NSMutableArray arrayWithArray:m_array];
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
    return [self.menuList count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* dequeueBgIdentifer = @"cellview";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:dequeueBgIdentifer];
    
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dequeueBgIdentifer]autorelease];
    }
    
 //   cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.menuList objectAtIndex:indexPath.row];
    //IBGImage(@"sod_test");
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
        
}

//改变行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


@end
