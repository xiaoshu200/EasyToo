//
//  CarYearView.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-11.
//
//

#import "CarYearView.h"

@implementation CarYearView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect
{
    [self initView];
}

- (void)initView
{
    UILabel* carNumLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 20, 120, 30)] autorelease];
    [carNumLabel setTextAlignment:NSTextAlignmentRight];
    [carNumLabel setText:@"车牌号码："];
    [self addSubview:carNumLabel];
    
    UILabel* carTailNumLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 60, 120, 30)] autorelease];
    [carTailNumLabel setTextAlignment:NSTextAlignmentRight];
    [carTailNumLabel setText:@"车辆类型："];
    [self addSubview:carTailNumLabel];
    
    UILabel* carColorLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 100, 120, 30)] autorelease];
    [carColorLabel setTextAlignment:NSTextAlignmentRight];
    [carColorLabel setText:@"购买年份："];
    [self addSubview:carColorLabel];
    
    UITextField* carNumText = [[[UITextField alloc] initWithFrame:CGRectMake(135, 20, 170, 30)] autorelease];
    [carNumText setBorderStyle:UITextBorderStyleLine];
    [self addSubview:carNumText];
    
    UITextField* carTailNumText = [[[UITextField alloc] initWithFrame:CGRectMake(135, 60, 170, 30)] autorelease];
    [carTailNumText setBorderStyle:UITextBorderStyleLine];
    [self addSubview:carTailNumText];
    
    UIButton* searchButton = [[[UIButton alloc] initWithFrame:CGRectMake(120, 150, 100, 30)] autorelease];
    [searchButton setBackgroundImage:[UIImage imageNamed:@"djf_queren"] forState:UIControlStateNormal];
    [self addSubview:searchButton];
    
}

@end
