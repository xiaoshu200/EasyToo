//
//  ShoppingMallViewController.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-10.
//
//

#import "ShoppingMallViewController.h"
#import "DeviceUtil.h"

@interface ShoppingMallViewController ()

@end

@implementation ShoppingMallViewController

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
    _titleDetail = [[NSArray alloc]initWithObjects:@"家电", @"服饰", @"饮食", @"书籍", @"房产税第二轮改革试点袭来？", nil];
    _contentDetail = [[NSArray alloc]initWithObjects:@"家电", @"服饰", @"饮食", @"书籍", @"房产税改革扩大试点已箭在弦上。5月24日，国务院明确提出，在2013年深化经济体制改革工作中，扩大个人住房房产税改革试点范围是重点工作之一", nil];
    _timeDetail = [[NSArray alloc]initWithObjects:@"2013-06-12", @"2013-06-12", @"2013-06-12", @"2013-06-12", @"2013-06-12", @"2013-06-12", nil];
    _pictureDetail = [[NSArray alloc]initWithObjects:@"meirong2", @"nearby", @"meishi2",@"marry2",@"concert_ticket_huaju.png",nil];
    
    
    [super viewDidLoad];
    [self initTopBar];
    [self initTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTopBar
{
    UIImageView *topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [DeviceUtil getScreenWidth], 60)];
    
    [topImage setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:topImage];
    
    UIImageView *searchBgImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 20, [DeviceUtil getScreenWidth] - 50, 30)];
    
    [searchBgImage setImage:[UIImage imageNamed:@"shop_search"]];
    [self.view addSubview:searchBgImage];
    
    UIButton *searchBtn = [[UIButton alloc] initWithFrame:CGRectMake([DeviceUtil getScreenWidth] - 82, 2, 25, 25)];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"shop_search_button"] forState:UIControlStateNormal];
    [searchBgImage addSubview:searchBtn];
    
    _SearchTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 25, [DeviceUtil getScreenWidth] - 55, 22)];
    [_SearchTextField setText:@"请输入商品名称"];
    //    [_SearchTextField setBackgroundColor:[UIColor greenColor]];
    [_SearchTextField setDelegate:self];
    
    [self.view addSubview:_SearchTextField];
}

- (void)initTableView
{
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, [DeviceUtil getScreenWidth], 420 - 60 - 40) style:UITableViewStylePlain];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [self.view addSubview:tableView];
}

#pragma datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 320/4;
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
    CGFloat contentWidth = [DeviceUtil getScreenWidth];
    
    cell.imageView.image = [UIImage imageNamed:[_pictureDetail objectAtIndex:indexPath.row]];//未选cell时的图片
    
    //标题
    CGRect titleLabelRect = CGRectMake(95, 2, contentWidth - 115, 30);
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleLabelRect];
    titleLabel.text = [_titleDetail objectAtIndex:indexPath.row];
    titleLabel.font = [UIFont boldSystemFontOfSize:12];
    titleLabel.textColor = [UIColor blueColor];
    [cell.contentView addSubview:titleLabel];
    
    //内容
    CGRect contentLabelRect = CGRectMake(95, 30, contentWidth - 115, 30);
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:contentLabelRect];
    contentLabel.text = [_contentDetail objectAtIndex:indexPath.row];
    contentLabel.font = [UIFont boldSystemFontOfSize:10];
    contentLabel.numberOfLines = 0;
    [cell.contentView addSubview:contentLabel];
    
    //时间
//    CGRect timeLabelRect = CGRectMake(95, 60, contentWidth - 115, 30);
//    UILabel *timeLabel = [[UILabel alloc] initWithFrame:timeLabelRect];
//    timeLabel.text = [_timeDetail objectAtIndex:indexPath.row];
//    timeLabel.font = [UIFont boldSystemFontOfSize:10];
//    [cell.contentView addSubview:timeLabel];
    
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
