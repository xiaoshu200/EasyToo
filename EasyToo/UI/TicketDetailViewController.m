//
//  TicketDetailViewController.m
//  EasyToo
//
//  Created by hydb on 13-6-10.
//
//

#import "TicketDetailViewController.h"

@interface TicketDetailViewController ()

@end

@implementation TicketDetailViewController
{
    NSArray *startTime;
    NSArray *arriveTime;
    NSArray *airCompany;
    NSArray *airPort;
    NSArray *cashNeed;
    NSArray *descYN;
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

    startTime = [[NSArray alloc]initWithObjects:@"20:40",@"20:40",@"20:40",@"20:40",@"20:40",nil];
    arriveTime = [[NSArray alloc]initWithObjects:@"23:40",@"23:40",@"23:40",@"23:40",@"23:40",nil];
    airCompany = [[NSArray alloc]initWithObjects:@"南航CA1304",@"深航CA1304",@"南航CA1304",@"南航CA1304",@"深航CA1304",nil];
    airPort = [[NSArray alloc]initWithObjects:@"宝安国际机场->白云机场",@"宝安国际机场->白云机场",@"宝安国际机场->白云机场",@"宝安国际机场->白云机场",@"宝安国际机场->白云机场",nil];
    cashNeed = [[NSArray alloc]initWithObjects:@"1000元",@"1000元",@"1000元",@"1000元",@"1000元",nil];
    descYN = [[NSArray alloc]initWithObjects:@"全价经济舱/Y",@"全价经济舱/Y",@"全价经济舱/Y",@"全价经济舱/Y",@"全价经济舱/Y",nil];
    
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
    return [startTime count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

        if (indexPath.row == 0)
        {
            UIButton *timeBtn = [[UIButton alloc]initWithFrame:CGRectMake(2, 2, 50, 40)];
            [timeBtn setTitle:@"时间" forState:UIControlStateNormal];
            [timeBtn setBackgroundColor:[UIColor grayColor]];
            [cell.contentView addSubview:timeBtn];
            //[timeBtn addTarget:self action:@selector(timeEvent) forControlEvents:UIControlEventTouchUpInside];
            
            CGRect airportRect = CGRectMake(80, 2, 140, 14);
            UILabel *airportLabel = [[UILabel alloc] initWithFrame:airportRect];
            airportLabel.textAlignment = UITextAlignmentCenter;
            airportLabel.text = @"深圳->北京首都";
            airportLabel.font = [UIFont boldSystemFontOfSize:12];
            [cell.contentView addSubview:airportLabel];
            
            CGRect timeRect = CGRectMake(80, 25, 140, 14);
            UILabel *timeLabel = [[UILabel alloc] initWithFrame:timeRect];
            timeLabel.textAlignment = UITextAlignmentCenter;
            timeLabel.text = @"2013-06-11";
            timeLabel.font = [UIFont boldSystemFontOfSize:12];
            [cell.contentView addSubview:timeLabel];
            
            UIButton *priceBtn = [[UIButton alloc]initWithFrame:CGRectMake(265, 2, 50, 40)];
            [priceBtn setTitle:@"价格" forState:UIControlStateNormal];
            [priceBtn setBackgroundColor:[UIColor grayColor]];
            [cell.contentView addSubview:priceBtn];
            //[priceBtn addTarget:self action:@selector(priceEvent) forControlEvents:UIControlEventTouchUpInside];
            
        } else {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            //起飞时间
            CGRect startLabelRect = CGRectMake(2, 2, 40, 16);
            UILabel *startLabel = [[UILabel alloc] initWithFrame:startLabelRect];
            startLabel.textColor = [UIColor blueColor];
            startLabel.textAlignment = UITextAlignmentCenter;
            startLabel.text = [startTime objectAtIndex:indexPath.row];
            startLabel.font = [UIFont boldSystemFontOfSize:15];
            [cell.contentView addSubview:startLabel];
            
            //到达时间
            CGRect arriveLabelRect = CGRectMake(2, 25, 40, 12);
            UILabel *arriveLabel = [[UILabel alloc] initWithFrame:arriveLabelRect];
            arriveLabel.textAlignment = UITextAlignmentCenter;
            arriveLabel.text = [arriveTime objectAtIndex:indexPath.row];
            arriveLabel.font = [UIFont boldSystemFontOfSize:12];
            [cell.contentView addSubview:arriveLabel];
            
            //航空公司
            CGRect companyLabelRect = CGRectMake(70, 2, 120, 16);
            UILabel *companyLabel = [[UILabel alloc] initWithFrame:companyLabelRect];
            companyLabel.textColor = [UIColor blueColor];
            companyLabel.textAlignment = UITextAlignmentCenter;
            companyLabel.text = [airCompany objectAtIndex:indexPath.row];
            companyLabel.font = [UIFont boldSystemFontOfSize:15];
            [cell.contentView addSubview:companyLabel];
            
            //机场
            CGRect airPortLabelRect = CGRectMake(70, 25, 145, 12);
            UILabel *airPortLabel = [[UILabel alloc] initWithFrame:airPortLabelRect];
            airPortLabel.textAlignment = UITextAlignmentCenter;
            airPortLabel.text = [airPort objectAtIndex:indexPath.row];
            airPortLabel.font = [UIFont boldSystemFontOfSize:12];
            [cell.contentView addSubview:airPortLabel];
            
            //价格
            CGRect cashNeedLabelRect = CGRectMake(210, 2, 100, 16);
            UILabel *cashNeedLabel = [[UILabel alloc] initWithFrame:cashNeedLabelRect];
            cashNeedLabel.textColor = [UIColor redColor];
            cashNeedLabel.textAlignment = UITextAlignmentCenter;
            cashNeedLabel.text = [cashNeed objectAtIndex:indexPath.row];
            cashNeedLabel.font = [UIFont boldSystemFontOfSize:15];
            [cell.contentView addSubview:cashNeedLabel];
            
            //描述
            CGRect descYNRect = CGRectMake(210, 25, 100, 12);
            UILabel *descYNLabel = [[UILabel alloc] initWithFrame:descYNRect];
            descYNLabel.textAlignment = UITextAlignmentCenter;
            descYNLabel.text = [descYN objectAtIndex:indexPath.row];
            descYNLabel.font = [UIFont boldSystemFontOfSize:12];
            [cell.contentView addSubview:descYNLabel];
        }
        

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 0)
    {
        UIActionSheet* mySheet = [[UIActionSheet alloc]
                                  initWithTitle:@"请选择价位"
                                  delegate:self
                                  cancelButtonTitle:@"返回"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"1750元（全价头等舱/Y）", @"4380元（头等舱/F）",nil];
        [mySheet showInView:self.view];
    }
}


@end
