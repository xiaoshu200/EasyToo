//
//  CarTrafficView.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-11.
//
//

#import "CarTrafficView.h"

@implementation CarTrafficView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)initView
{
    UILabel* carNumLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 20, 120, 30)] autorelease];
    [carNumLabel setTextAlignment:NSTextAlignmentRight];
    [carNumLabel setText:@"车牌号码："];
    [self addSubview:carNumLabel];
    
    UILabel* carTailNumLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 60, 120, 30)] autorelease];
    [carTailNumLabel setTextAlignment:NSTextAlignmentRight];
    [carTailNumLabel setText:@"车架号后6位："];
    [self addSubview:carTailNumLabel];
    
    UILabel* carColorLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 100, 120, 30)] autorelease];
    [carColorLabel setTextAlignment:NSTextAlignmentRight];
    [carColorLabel setText:@"车牌颜色："];
    [self addSubview:carColorLabel];
    
    UITextField* carNumText = [[[UITextField alloc] initWithFrame:CGRectMake(135, 20, 170, 30)] autorelease];
    [carNumText setBorderStyle:UITextBorderStyleLine];
    [self addSubview:carNumText];
    
    UITextField* carTailNumText = [[[UITextField alloc] initWithFrame:CGRectMake(135, 60, 170, 30)] autorelease];
    [carTailNumText setBorderStyle:UITextBorderStyleLine];
    [self addSubview:carTailNumText];
    
    UIButton* blueButton = [[[UIButton alloc] initWithFrame:CGRectMake(135, 100, 100, 30)] autorelease];
    [blueButton setBackgroundImage:[UIImage imageNamed:@"blue"] forState:UIControlStateNormal];
    [self addSubview:blueButton];
    
    UIButton* yellowButton = [[[UIButton alloc] initWithFrame:CGRectMake(135, 140, 100, 30)] autorelease];
    [yellowButton setBackgroundImage:[UIImage imageNamed:@"yellow"] forState:UIControlStateNormal];
    [self addSubview:yellowButton];
    
    UIButton* blackButton = [[[UIButton alloc] initWithFrame:CGRectMake(135, 180, 100, 30)] autorelease];
    [blackButton setBackgroundImage:[UIImage imageNamed:@"heipai"] forState:UIControlStateNormal];
    [self addSubview:blackButton];
    
    UIButton* searchButton = [[[UIButton alloc] initWithFrame:CGRectMake(80, 280, 180, 50)] autorelease];
    [searchButton setBackgroundImage:[UIImage imageNamed:@"chaxun"] forState:UIControlStateNormal];
    [self addSubview:searchButton];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect
{
    [self initView];
}

@end
