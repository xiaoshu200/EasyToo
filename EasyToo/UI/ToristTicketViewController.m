//
//  ToristTicketViewController.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-11.
//
//

#import "ToristTicketViewController.h"

@interface ToristTicketViewController ()

@end

@implementation ToristTicketViewController

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
	// Do any additional setup after loading the view.
    
    //定义title
    self.title = @ "景点门票";
    
    [self initView];
}

- (void)initView
{
    //定义9个button
    UIButton *yanchangBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, 70, 70)];
    [yanchangBtn setTitle:@"" forState:UIControlStateNormal];
    [yanchangBtn setImage:[UIImage imageNamed:@"scenic_sort_01"] forState:UIControlStateNormal];
    
    UIButton *maxiBtn = [[UIButton alloc]initWithFrame:CGRectMake(120, 10, 70, 70)];
    [maxiBtn setTitle:@"" forState:UIControlStateNormal];
    [maxiBtn setImage:[UIImage imageNamed:@"scenic_sort_02"] forState:UIControlStateNormal];
    
    UIButton *musicBtn = [[UIButton alloc]initWithFrame:CGRectMake(220, 10, 70, 70)];
    [musicBtn setTitle:@"" forState:UIControlStateNormal];
    [musicBtn setImage:[UIImage imageNamed:@"scenic_sort_03"] forState:UIControlStateNormal];
    
    UIButton *nuyouBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 110, 70, 70)];
    [nuyouBtn setTitle:@"" forState:UIControlStateNormal];
    [nuyouBtn setImage:[UIImage imageNamed:@"scenic_sort_04"] forState:UIControlStateNormal];
    
    UIButton *tiyuBtn = [[UIButton alloc]initWithFrame:CGRectMake(120, 110, 70, 70)];
    [tiyuBtn setTitle:@"" forState:UIControlStateNormal];
    [tiyuBtn setImage:[UIImage imageNamed:@"scenic_sort_05"] forState:UIControlStateNormal];
    
    UIButton *wudaoBtn = [[UIButton alloc]initWithFrame:CGRectMake(220, 110, 70, 70)];
    [wudaoBtn setTitle:@"" forState:UIControlStateNormal];
    [wudaoBtn setImage:[UIImage imageNamed:@"scenic_sort_06"] forState:UIControlStateNormal];
    
    UIButton *xiquBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 210, 70, 70)];
    [xiquBtn setTitle:@"" forState:UIControlStateNormal];
    [xiquBtn setImage:[UIImage imageNamed:@"scenic_sort_07"] forState:UIControlStateNormal];
    
    UIButton *yuajuBtn = [[UIButton alloc]initWithFrame:CGRectMake(120, 210, 70, 70)];
    [yuajuBtn setTitle:@"" forState:UIControlStateNormal];
    [yuajuBtn setImage:[UIImage imageNamed:@"scenic_sort_08"] forState:UIControlStateNormal];
    
    UIButton *otherBtn = [[UIButton alloc]initWithFrame:CGRectMake(220, 210, 70, 70)];
    [otherBtn setTitle:@"" forState:UIControlStateNormal];
    [otherBtn setImage:[UIImage imageNamed:@"scenic_sort_09"] forState:UIControlStateNormal];
    
    UIButton *ziJiaYouBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 310, 70, 70)];
    [ziJiaYouBtn setTitle:@"" forState:UIControlStateNormal];
    [ziJiaYouBtn setImage:[UIImage imageNamed:@"scenic_sort_10"] forState:UIControlStateNormal];
    
    UIButton *zhiTongCheBtn = [[UIButton alloc]initWithFrame:CGRectMake(120, 310, 70, 70)];
    [zhiTongCheBtn setTitle:@"" forState:UIControlStateNormal];
    [zhiTongCheBtn setImage:[UIImage imageNamed:@"scenic_sort_11"] forState:UIControlStateNormal];
    
    UIButton *ziZhuYouBtn = [[UIButton alloc]initWithFrame:CGRectMake(220, 310, 70, 70)];
    [ziZhuYouBtn setTitle:@"" forState:UIControlStateNormal];
    [ziZhuYouBtn setImage:[UIImage imageNamed:@"scenic_sort_12"] forState:UIControlStateNormal];
    
    //添加button方法
    [yanchangBtn addTarget:self action:@selector(yanchangEvent) forControlEvents:UIControlEventTouchUpInside];
    
    
    //定义9个label
    UILabel *yanchangLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 70, 30)];
    yanchangLbl.text = @"公园主题";
    yanchangLbl.font = [UIFont boldSystemFontOfSize:13];
    yanchangLbl.textAlignment = UITextAlignmentCenter;
    yanchangLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *maxiLbl = [[UILabel alloc]initWithFrame:CGRectMake(120, 80, 70, 30)];
    maxiLbl.text = @"海滨漂流";
    maxiLbl.font = [UIFont boldSystemFontOfSize:13];
    maxiLbl.textAlignment = UITextAlignmentCenter;
    maxiLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *musicLbl = [[UILabel alloc]initWithFrame:CGRectMake(220, 80, 70, 30)];
    musicLbl.text = @"温泉度假";
    musicLbl.font = [UIFont boldSystemFontOfSize:13];
    musicLbl.textAlignment = UITextAlignmentCenter;
    musicLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *nuyouLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 180, 70, 30)];
    nuyouLbl.text = @"自然生态";
    nuyouLbl.font = [UIFont boldSystemFontOfSize:13];
    nuyouLbl.textAlignment = UITextAlignmentCenter;
    nuyouLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *tiyuLbl = [[UILabel alloc]initWithFrame:CGRectMake(120, 180, 70, 30)];
    tiyuLbl.text = @"名胜古迹";
    tiyuLbl.font = [UIFont boldSystemFontOfSize:13];
    tiyuLbl.textAlignment = UITextAlignmentCenter;
    tiyuLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *wudaoLbl = [[UILabel alloc]initWithFrame:CGRectMake(220, 180, 70, 30)];
    wudaoLbl.text = @"园林博览";
    wudaoLbl.font = [UIFont boldSystemFontOfSize:13];
    wudaoLbl.textAlignment = UITextAlignmentCenter;
    wudaoLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *xiquLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 280, 70, 30)];
    xiquLbl.text = @"休闲娱乐";
    xiquLbl.font = [UIFont boldSystemFontOfSize:13];
    xiquLbl.textAlignment = UITextAlignmentCenter;
    xiquLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *yuajuLbl = [[UILabel alloc]initWithFrame:CGRectMake(120, 280, 70, 30)];
    yuajuLbl.text = @"运动扩展";
    yuajuLbl.font = [UIFont boldSystemFontOfSize:13];
    yuajuLbl.textAlignment = UITextAlignmentCenter;
    yuajuLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *otherLbl = [[UILabel alloc]initWithFrame:CGRectMake(220, 280, 70, 30)];
    otherLbl.text = @"度假酒店";
    otherLbl.font = [UIFont boldSystemFontOfSize:13];
    otherLbl.textAlignment = UITextAlignmentCenter;
    otherLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *ziJiaYouLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 380, 70, 30)];
    ziJiaYouLbl.text = @"自驾游套票";
    ziJiaYouLbl.font = [UIFont boldSystemFontOfSize:13];
    ziJiaYouLbl.textAlignment = UITextAlignmentCenter;
    ziJiaYouLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *zhiTongCheLbl = [[UILabel alloc]initWithFrame:CGRectMake(120, 380, 70, 30)];
    zhiTongCheLbl.text = @"直通车套票";
    zhiTongCheLbl.font = [UIFont boldSystemFontOfSize:13];
    zhiTongCheLbl.textAlignment = UITextAlignmentCenter;
    zhiTongCheLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *ziZhuYouLbl = [[UILabel alloc]initWithFrame:CGRectMake(220, 380, 70, 30)];
    ziZhuYouLbl.text = @"自助游套票";
    ziZhuYouLbl.font = [UIFont boldSystemFontOfSize:13];
    ziZhuYouLbl.textAlignment = UITextAlignmentCenter;
    ziZhuYouLbl.adjustsFontSizeToFitWidth = YES;
    //加入button
    [self.view addSubview:yanchangBtn];
    [self.view addSubview:maxiBtn];
    [self.view addSubview:musicBtn];
    [self.view addSubview:nuyouBtn];
    [self.view addSubview:tiyuBtn];
    [self.view addSubview:wudaoBtn];
    [self.view addSubview:xiquBtn];
    [self.view addSubview:yuajuBtn];
    [self.view addSubview:otherBtn];
    [self.view addSubview:ziJiaYouBtn];
    [self.view addSubview:zhiTongCheBtn];
    [self.view addSubview:ziZhuYouBtn];
    
    //加入label
    [self.view addSubview:yanchangLbl];
    [self.view addSubview:maxiLbl];
    [self.view addSubview:musicLbl];
    [self.view addSubview:nuyouLbl];
    [self.view addSubview:tiyuLbl];
    [self.view addSubview:wudaoLbl];
    [self.view addSubview:xiquLbl];
    [self.view addSubview:yuajuLbl];
    [self.view addSubview:otherLbl];
    [self.view addSubview:ziJiaYouLbl];
    [self.view addSubview:zhiTongCheLbl];
    [self.view addSubview:ziZhuYouLbl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//演唱会事件
- (void)yanchangEvent
{
//    yanchangViewController *yanchangView = [[yanchangViewController alloc] init];
//    [self.navigationController pushViewController:yanchangView animated:YES];
}

@end
