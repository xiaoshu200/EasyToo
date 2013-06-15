//
//  BrandView.m
//  EasyToo
//
//  Created by hydb on 13-6-12.
//
//

#import "BrandView.h"


@implementation BrandView

@synthesize titleDetail;
@synthesize contentDetail;
@synthesize timeDetail;
@synthesize pictureDetail;

- (id)initWithFrame:(CGRect)frame
{
    titleDetail = [[NSArray alloc]initWithObjects:@"朱茵变身时尚模特", @"朱茵变身时尚模特", @"朱茵变身时尚模特", @"朱茵变身时尚模特", @"朱茵变身时尚模特", nil];
    contentDetail = [[NSArray alloc]initWithObjects:@"朱茵代言拍摄葆丽美Suisse化妆品品牌广告及花絮，来自瑞士的SUISSE PROGRAMME“瑞士葆丽美”护肤品，有一半拥有丰富经验的科学家及美容专家研制而成，贯彻沿用瑞士丰富的天然资源，加上最先进的科技，配置出一系列备受推崇的优质美容产品。", @"朱茵代言拍摄葆丽美Suisse化妆品品牌广告及花絮，来自瑞士的SUISSE PROGRAMME“瑞士葆丽美”护肤品，有一半拥有丰富经验的科学家及美容专家研制而成，贯彻沿用瑞士丰富的天然资源，加上最先进的科技，配置出一系列备受推崇的优质美容产品。", @"朱茵代言拍摄葆丽美Suisse化妆品品牌广告及花絮，来自瑞士的SUISSE PROGRAMME“瑞士葆丽美”护肤品，有一半拥有丰富经验的科学家及美容专家研制而成，贯彻沿用瑞士丰富的天然资源，加上最先进的科技，配置出一系列备受推崇的优质美容产品。", @"朱茵代言拍摄葆丽美Suisse化妆品品牌广告及花絮，来自瑞士的SUISSE PROGRAMME“瑞士葆丽美”护肤品，有一半拥有丰富经验的科学家及美容专家研制而成，贯彻沿用瑞士丰富的天然资源，加上最先进的科技，配置出一系列备受推崇的优质美容产品。", @"朱茵代言拍摄葆丽美Suisse化妆品品牌广告及花絮，来自瑞士的SUISSE PROGRAMME“瑞士葆丽美”护肤品，有一半拥有丰富经验的科学家及美容专家研制而成，贯彻沿用瑞士丰富的天然资源，加上最先进的科技，配置出一系列备受推崇的优质美容产品。", nil];
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
