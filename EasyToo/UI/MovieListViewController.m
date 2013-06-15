//
//  MovieListViewController.m
//  EasyToo
//
//  Created by hydb on 13-6-11.
//
//

#import "MovieListViewController.h"

@interface MovieListViewController ()

@end

@implementation MovieListViewController
{
    NSArray *detailMovie;
    NSArray *detailURL;
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

    detailMovie = [[NSArray alloc]initWithObjects:@"民国期间“南北武林”多个门派宗师级人物的传奇故事，真实的表现四大拳派「咏春、八卦、八极、形意」的招式和武学精神", @"民国期间“南北武林”多个门派宗师级人物的传奇故事，真实的表现四大拳派「咏春、八卦、八极、形意」的招式和武学精神",@"民国期间“南北武林”多个门派宗师级人物的传奇故事，真实的表现四大拳派「咏春、八卦、八极、形意」的招式和武学精神",@"民国期间“南北武林”多个门派宗师级人物的传奇故事，真实的表现四大拳派「咏春、八卦、八极、形意」的招式和武学精神",@"民国期间“南北武林”多个门派宗师级人物的传奇故事，真实的表现四大拳派「咏春、八卦、八极、形意」的招式和武学精神", nil];
    detailURL = [[NSArray alloc]initWithObjects:@"car_logo", @"car_logo", @"car_logo",@"car_logo",@"car_logo",nil];
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
    return [detailMovie count];
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
        
        UIButton *onshowBtn = [[UIButton alloc]initWithFrame:CGRectMake(2, 0, widhth/2 -2 , 40)];
        [onshowBtn setTitle:@"正在热映" forState:UIControlStateNormal];
        [onshowBtn setBackgroundColor:[UIColor redColor]];
        [cell.contentView addSubview:onshowBtn];
        
        UIButton *beingshowBtn = [[UIButton alloc]initWithFrame:CGRectMake(widhth/2 + 2, 0, widhth/2 - 4, 40)];
        [beingshowBtn setTitle:@"即将上映" forState:UIControlStateNormal];
        [beingshowBtn setBackgroundColor:[UIColor redColor]];
        [cell.contentView addSubview:beingshowBtn];
        
    } else
    {
        NSString *content = [detailMovie objectAtIndex:indexPath.row];
        // 列寬
        CGFloat contentWidth = self.tableView.frame.size.width;
        // 用何種字體進行顯示
        UIFont *font = [UIFont systemFontOfSize:13];
        CGSize size = [content sizeWithFont:font constrainedToSize:CGSizeMake(contentWidth, 1000)];
        
        CGRect rect = [cell.textLabel textRectForBounds:cell.textLabel.frame limitedToNumberOfLines:0];
        // 設置顯示榘形大小
        rect.size = size;
        // 重置列文本區域
        cell.textLabel.frame = rect;
        
        cell.textLabel.text = content;
        
        // 設置自動換行(重要)
        cell.textLabel.numberOfLines = 0;
        // 設置顯示字體(一定要和之前計算時使用字體一至)
        cell.textLabel.font = font;
        
        cell.imageView.image = [UIImage imageNamed:[detailURL objectAtIndex:indexPath.row]];//未选cell时的图片
        //cell.imageView.highlightedImage=highlightImage;//选中cell后的图片
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
