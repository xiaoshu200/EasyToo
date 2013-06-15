//
//  TheatreViewController.m
//  EasyToo
//
//  Created by hydb on 13-6-11.
//
//

#import "TheatreViewController.h"

@interface TheatreViewController ()

@end

@implementation TheatreViewController
{
    NSArray *shopDetail;
    NSArray *addressDetail;
    NSArray *cashDetail;
}

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

    shopDetail = [[NSArray alloc]initWithObjects:@"保利国家剧院", @"保利国家剧院", @"保利国家剧院", @"保利国家剧院", @"保利国家剧院", nil];
    addressDetail = [[NSArray alloc]initWithObjects:@"深圳市南山区海岸城保利广场三楼", @"深圳市南山区海岸城保利广场三楼", @"深圳市南山区海岸城保利广场三楼", @"深圳市南山区海岸城保利广场三楼", @"深圳市南山区海岸城保利广场三楼", nil];
    cashDetail = [[NSArray alloc]initWithObjects:@"60-150元", @"60-150元", @"60-150元", @"60-150元", @"60-150元", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [shopDetail count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
    }
    
    if (indexPath.row == 0)
    {
        CGFloat widhth = [[UIScreen mainScreen] bounds].size.width;
        
        UIButton *distanceBtn = [[UIButton alloc]initWithFrame:CGRectMake(2, 0, widhth/3 -2 , 40)];
        [distanceBtn setTitle:@"距离" forState:UIControlStateNormal];
        [distanceBtn setBackgroundColor:[UIColor redColor]];
        [cell.contentView addSubview:distanceBtn];
        
        UIButton *areaBtn = [[UIButton alloc]initWithFrame:CGRectMake(widhth/3 + 2, 0, widhth/3 - 4, 40)];
        [areaBtn setTitle:@"全部区域" forState:UIControlStateNormal];
        [areaBtn setBackgroundColor:[UIColor redColor]];
        [cell.contentView addSubview:areaBtn];
        
        UIButton *ticketBtn = [[UIButton alloc]initWithFrame:CGRectMake(widhth/3*2 + 2, 0, widhth/3 - 4, 40)];
        [ticketBtn setTitle:@"全部票种" forState:UIControlStateNormal];
        [ticketBtn setBackgroundColor:[UIColor redColor]];
        [cell.contentView addSubview:ticketBtn];
        
    } else
    {
        // 列寬
        CGFloat contentWidth = self.tableView.frame.size.width;
        
        //门店
        CGRect shopLabelRect = CGRectMake(2, 2, contentWidth, 30);
        UILabel *shopLabel = [[UILabel alloc] initWithFrame:shopLabelRect];
        shopLabel.text = [shopDetail objectAtIndex:indexPath.row];
        shopLabel.font = [UIFont boldSystemFontOfSize:15];
        [cell.contentView addSubview:shopLabel];
        
        //地址
        CGRect addressLabelRect = CGRectMake(2, 30, contentWidth, 30);
        UILabel *addressLabel = [[UILabel alloc] initWithFrame:addressLabelRect];
        addressLabel.text = [addressDetail objectAtIndex:indexPath.row];
        addressLabel.font = [UIFont boldSystemFontOfSize:15];
        [cell.contentView addSubview:addressLabel];
        
        //金额
        CGRect cashLabelRect = CGRectMake(2, 60, contentWidth, 30);
        UILabel *cashLabel = [[UILabel alloc] initWithFrame:cashLabelRect];
        cashLabel.text = [cashDetail objectAtIndex:indexPath.row];
        cashLabel.font = [UIFont boldSystemFontOfSize:15];
        [cell.contentView addSubview:cashLabel];

    }
    
    return cell;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
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
*/

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 40;
    } else {
        return 90;
    }
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
     [detailViewController release];
     */
}

@end
