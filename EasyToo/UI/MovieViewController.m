//
//  MovieViewController.m
//  EasyToo
//
//  Created by hydb on 13-6-11.
//
//

#import "MovieViewController.h"
#import "DeviceUtil.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

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
    [self.navigationItem setTitle:@"电影票"];
    
    self.movie_nav = [[[MovieListViewController alloc] initWithStyle:UITableViewStylePlain ] autorelease];
    self.theatre_nav = [[[TheatreViewController alloc] initWithStyle:UITableViewStylePlain]autorelease];
    self.person_nav = [[[PersonViewController alloc]initWithStyle:UITableViewStylePlain] autorelease];
    
//    [self.navigationController pushViewController:self.movie_nav animated:NO];
    
    NSArray *controllerArray =[[NSArray alloc]initWithObjects:self.movie_nav,self.theatre_nav,self.person_nav,nil];
    self.tbc = [[[UITabBarController alloc]init] autorelease];
    
    // self.tbc.delegate = self;
    self.tbc.viewControllers = controllerArray;
    
    _tbc.selectedIndex = 0;
    
    [[self.tbc.tabBar.items objectAtIndex:0] setTitle:@"电影"];
    [[self.tbc.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"film"]];
    
    [[self.tbc.tabBar.items objectAtIndex:1] setTitle:@"影院"];
    [[self.tbc.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"camera"]];
    
    [[self.tbc.tabBar.items objectAtIndex:2] setTitle:@"个人中心"];
    [[self.tbc.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"owe_center"]];
    [self.tbc.tabBar setFrame:CGRectMake(0, 400, [DeviceUtil getScreenWidth], 60)];
    [self.view addSubview:self.tbc.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
