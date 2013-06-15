//
//  ElecSaveVIew.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-12.
//
//

#import "ElecSaveVIew.h"

@implementation ElecSaveVIew

@synthesize titleDetail;
@synthesize contentDetail;
@synthesize timeDetail;
@synthesize pictureDetail;

- (id)initWithFrame:(CGRect)frame
{
    titleDetail = [[NSArray alloc]initWithObjects:@"客厅浴室节电小窍门", @"日常家居照明的节电方法", @"电饭煲如何从选购、使用和保养上省电", @"洗衣机的节电之道", @"电冰箱节电也不难", nil];
    contentDetail = [[NSArray alloc]initWithObjects:@"客厅浴室节能其实并不难，优势只需一个小动作，客厅节能需", @"客厅浴室节能其实并不难，优势只需一个小动作，客厅节能需", @"客厅浴室节能其实并不难，优势只需一个小动作，客厅节能需", @"客厅浴室节能其实并不难，优势只需一个小动作，客厅节能需", @"客厅浴室节能其实并不难，优势只需一个小动作，客厅节能需", nil];
    timeDetail = [[NSArray alloc]initWithObjects:@"2013-06-12", @"2013-06-12", @"2013-06-12", @"2013-06-12", @"2013-06-12", @"2013-06-12", nil];
    pictureDetail = [[NSArray alloc]initWithObjects:@"concert_ticket_huaju.png", @"concert_ticket_huaju.png", @"concert_ticket_huaju.png",@"concert_ticket_huaju.png",@"concert_ticket_huaju.png",nil];
    
    self = [super initWithFrame:frame];
    if (self) {
        UITableView* tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        [self addSubview:tableView];
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        [tableView setFrame:CGRectMake(0, 0, width, height)];
        [tableView setDelegate:self];
        [tableView setDataSource:self];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [titleDetail count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // 列寬
    CGFloat contentWidth = self.frame.size.width;
    
    cell.imageView.image = [UIImage imageNamed:[pictureDetail objectAtIndex:indexPath.row]];//未选cell时的图片
    
    //标题
    CGRect titleLabelRect = CGRectMake(95, 2, contentWidth - 115, 30);
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleLabelRect];
    titleLabel.text = [titleDetail objectAtIndex:indexPath.row];
    titleLabel.font = [UIFont boldSystemFontOfSize:12];
    titleLabel.textColor = [UIColor blueColor];
    [cell.contentView addSubview:titleLabel];
    
    //内容
    CGRect contentLabelRect = CGRectMake(95, 30, contentWidth - 115, 30);
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:contentLabelRect];
    contentLabel.text = [contentDetail objectAtIndex:indexPath.row];
    contentLabel.font = [UIFont boldSystemFontOfSize:10];
    contentLabel.numberOfLines = 0;
    [cell.contentView addSubview:contentLabel];
    
    //时间
    CGRect timeLabelRect = CGRectMake(95, 60, contentWidth - 115, 30);
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:timeLabelRect];
    timeLabel.text = [timeDetail objectAtIndex:indexPath.row];
    timeLabel.font = [UIFont boldSystemFontOfSize:10];
    [cell.contentView addSubview:timeLabel];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
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
