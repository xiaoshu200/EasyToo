//
//  FirstViewController.m
//  MYUICatalog
//
//  Created by linshengqin on 13-6-1.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//


#import "GouPiaoViewController.h"
#import "SSQViewController.h"
#import "FC3DViewController.h"
#import "DaLeTouViewController.h"   
#import "SSQ2ViewController.h"
#import "DaLeTou2ViewController.h"
#define MINILABEL ((UILabel *)self.navigationItem.titleView)
@interface GouPiaoViewController ()

@end

@implementation GouPiaoViewController

@synthesize menuList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.menuList = [NSMutableArray array];
    int i = 0;
    for(i=0;i<100;i++)
    {
        [menuList addObject:[NSNumber numberWithInt:i]];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
	[self.fatherView.navigationItem setTitle:@"选择彩种"];
	NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
	[self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
    return [[UIFont familyNames] count];
    return [self.menuList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    if(indexPath.section == 0)
    {
    cell.textLabel.text = @"双色球";
    cell.detailTextLabel.text =@"2013年超级奖林胜钦中了双色球";
    cell.imageView.image = [UIImage imageNamed:@"cp_shuangse.png"];
    }
    else if( indexPath.section == 1 )
    {
        cell.textLabel.text = @"福彩3D";
        cell.detailTextLabel.text =@"毛哲中了3D";
        cell.imageView.image = [UIImage imageNamed:@"cp_3d.png"];
    }
    else
    {
        cell.textLabel.text = @"超级大乐透";
        cell.detailTextLabel.text =@"超级大乐透";
        cell.imageView.image = [UIImage imageNamed:@"cp_daletou.png"];
    }
    return cell;
}


 
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return NO;
 }

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 0)
    {
    SSQ2ViewController *ssqView = [[SSQ2ViewController alloc] init];
    [self.fatherView.navigationController pushViewController:ssqView animated:YES];
    //选中后的反显颜色即刻消失
    }
    else if(indexPath.section == 1)
    {
        FC3DViewController *fcView = [[FC3DViewController alloc] init];
        [self.fatherView.navigationController pushViewController:fcView animated:YES];
    }
    else
    {
        DaLeTou2ViewController *daletouView = [[DaLeTou2ViewController alloc] init];
        [self.fatherView.navigationController pushViewController:daletouView animated:YES];
    }
    
}

//改变行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


@end
