//
//  DatingViewController.m
//  MUICatalog
//
//  Created by linshengqin on 13-6-10.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//

#import "DatingViewController.h"

@interface DatingViewController ()

@end

@implementation DatingViewController

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
    //    [self.tableView setEditing:YES animated:YES];
    //   self.tableView.editing = YES;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
	// this UIViewController is about to re-appear, make sure we remove the current selection in our table view
//    self.fatherView
    [self.fatherView.navigationItem setTitle:@"开奖大厅"];
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
        cell.imageView.image = [UIImage imageNamed:@"cp_shuangse.png"];
    }
    else if( indexPath.section == 1 )
    {
        cell.textLabel.text = @"福彩3D";
        cell.imageView.image = [UIImage imageNamed:@"cp_3d.png"];
    }
    else
    {
        cell.textLabel.text = @"超级大乐透";
        cell.imageView.image = [UIImage imageNamed:@"cp_daletou.png"];
    }
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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
    /*
     SecondViewController *secondView = [[SecondViewController alloc] init];
     
     SecondViewController *secondView = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
     [self.navigationController pushViewController:secondView animated:YES];
     */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    
    
    
    /*
     UITableViewCell *oneCell = [tableView cellForRowAtIndexPath: indexPath];
     if (oneCell.accessoryType == UITableViewCellAccessoryNone) {
     oneCell.accessoryType = UITableViewCellAccessoryCheckmark;
     } else
     oneCell.accessoryType = UITableViewCellAccessoryNone;
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
     */
    /*
     SecondViewController *secondView = [[SecondViewController alloc] init];
     [self.navigationController pushViewController:secondView animated:YES];
     */
    //    NSString *font = [[UIFont familyNames] objectAtIndex:indexPath.row];
    //   self.title = font;
    //  [MINILABEL setText:font];
    //  [MINILABEL setFont:[UIFont fontWithName:font size:18.0f]];
}

//改变行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
