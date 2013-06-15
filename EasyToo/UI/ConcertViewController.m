//
//  ConcertViewController.m
//  EasyToo
//
//  Created by hydb on 13-6-10.
//
//

#import "ConcertViewController.h"

@interface ConcertViewController ()

@end

@implementation ConcertViewController

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
    self.title = @ "演艺票";
    
    //定义9个button
    UIButton *yanchangBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 70, 70)];
    [yanchangBtn setTitle:@"" forState:UIControlStateNormal];
    [yanchangBtn setImage:[UIImage imageNamed:@"concert_ticket_yanchang"] forState:UIControlStateNormal];
    
    UIButton *maxiBtn = [[UIButton alloc]initWithFrame:CGRectMake(120, 20, 70, 70)];
    [maxiBtn setTitle:@"" forState:UIControlStateNormal];
    [maxiBtn setImage:[UIImage imageNamed:@"concert_ticket_maxi"] forState:UIControlStateNormal];
    
    UIButton *musicBtn = [[UIButton alloc]initWithFrame:CGRectMake(220, 20, 70, 70)];
    [musicBtn setTitle:@"" forState:UIControlStateNormal];
    [musicBtn setImage:[UIImage imageNamed:@"concert_ticket_music"] forState:UIControlStateNormal];
    
    UIButton *nuyouBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 120, 70, 70)];
    [nuyouBtn setTitle:@"" forState:UIControlStateNormal];
    [nuyouBtn setImage:[UIImage imageNamed:@"concert_ticket_nuyou"] forState:UIControlStateNormal];
    
    UIButton *tiyuBtn = [[UIButton alloc]initWithFrame:CGRectMake(120, 120, 70, 70)];
    [tiyuBtn setTitle:@"" forState:UIControlStateNormal];
    [tiyuBtn setImage:[UIImage imageNamed:@"concert_ticket_tiyu"] forState:UIControlStateNormal];
    
    UIButton *wudaoBtn = [[UIButton alloc]initWithFrame:CGRectMake(220, 120, 70, 70)];
    [wudaoBtn setTitle:@"" forState:UIControlStateNormal];
    [wudaoBtn setImage:[UIImage imageNamed:@"concert_ticket_wudao"] forState:UIControlStateNormal];
    
    UIButton *xiquBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 220, 70, 70)];
    [xiquBtn setTitle:@"" forState:UIControlStateNormal];
    [xiquBtn setImage:[UIImage imageNamed:@"concert_ticket_xiqu"] forState:UIControlStateNormal];
    
    UIButton *yuajuBtn = [[UIButton alloc]initWithFrame:CGRectMake(120, 220, 70, 70)];
    [yuajuBtn setTitle:@"" forState:UIControlStateNormal];
    [yuajuBtn setImage:[UIImage imageNamed:@"concert_ticket_huaju"] forState:UIControlStateNormal];
    
    UIButton *otherBtn = [[UIButton alloc]initWithFrame:CGRectMake(220, 220, 70, 70)];
    [otherBtn setTitle:@"" forState:UIControlStateNormal];
    [otherBtn setImage:[UIImage imageNamed:@"concert_ticket_other"] forState:UIControlStateNormal];
    
    //添加button方法
    [yanchangBtn addTarget:self action:@selector(yanchangEvent) forControlEvents:UIControlEventTouchUpInside];
    
    
    //定义9个label
    UILabel *yanchangLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 90, 70, 30)];
    yanchangLbl.text = @"演唱会";
    yanchangLbl.font = [UIFont boldSystemFontOfSize:13];
    yanchangLbl.textAlignment = UITextAlignmentCenter;
    yanchangLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *maxiLbl = [[UILabel alloc]initWithFrame:CGRectMake(120, 90, 70, 30)];
    maxiLbl.text = @"魔术/马戏";
    maxiLbl.font = [UIFont boldSystemFontOfSize:13];
    maxiLbl.textAlignment = UITextAlignmentCenter;
    maxiLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *musicLbl = [[UILabel alloc]initWithFrame:CGRectMake(220, 90, 70, 30)];
    musicLbl.text = @"音乐会";
    musicLbl.font = [UIFont boldSystemFontOfSize:13];
    musicLbl.textAlignment = UITextAlignmentCenter;
    musicLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *nuyouLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 190, 70, 30)];
    nuyouLbl.text = @"运动/旅游";
    nuyouLbl.font = [UIFont boldSystemFontOfSize:13];
    nuyouLbl.textAlignment = UITextAlignmentCenter;
    nuyouLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *tiyuLbl = [[UILabel alloc]initWithFrame:CGRectMake(120, 190, 70, 30)];
    tiyuLbl.text = @"体育";
    tiyuLbl.font = [UIFont boldSystemFontOfSize:13];
    tiyuLbl.textAlignment = UITextAlignmentCenter;
    tiyuLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *wudaoLbl = [[UILabel alloc]initWithFrame:CGRectMake(220, 190, 70, 30)];
    wudaoLbl.text = @"舞蹈/芭蕾";
    wudaoLbl.font = [UIFont boldSystemFontOfSize:13];
    wudaoLbl.textAlignment = UITextAlignmentCenter;
    wudaoLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *xiquLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 290, 70, 30)];
    xiquLbl.text = @"戏曲";
    xiquLbl.font = [UIFont boldSystemFontOfSize:13];
    xiquLbl.textAlignment = UITextAlignmentCenter;
    xiquLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *yuajuLbl = [[UILabel alloc]initWithFrame:CGRectMake(120, 290, 70, 30)];
    yuajuLbl.text = @"话剧/歌剧";
    yuajuLbl.font = [UIFont boldSystemFontOfSize:13];
    yuajuLbl.textAlignment = UITextAlignmentCenter;
    yuajuLbl.adjustsFontSizeToFitWidth = YES;
    
    UILabel *otherLbl = [[UILabel alloc]initWithFrame:CGRectMake(220, 290, 70, 30)];
    otherLbl.text = @"其他";
    otherLbl.font = [UIFont boldSystemFontOfSize:13];
    otherLbl.textAlignment = UITextAlignmentCenter;
    otherLbl.adjustsFontSizeToFitWidth = YES;
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//演唱会事件
- (void)yanchangEvent
{
    yanchangViewController *yanchangView = [[yanchangViewController alloc] init];
    [self.navigationController pushViewController:yanchangView animated:YES];
}



@end
