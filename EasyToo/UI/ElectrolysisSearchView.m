//
//  ElectrolysisSearchView.m
//  EasyToo
//
//  Created by zhengzhe on 13-6-11.
//
//

#import "ElectrolysisSearchView.h"

@implementation ElectrolysisSearchView

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
    UILabel* numLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 20, 60, 30)] autorelease];
    [numLabel setTextAlignment:NSTextAlignmentRight];
    [numLabel setText:@"户号："];
    [self addSubview:numLabel];
    
    UILabel* yearLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 60, 60, 30)] autorelease];
    [yearLabel setTextAlignment:NSTextAlignmentRight];
    [yearLabel setText:@"年份："];
    [self addSubview:yearLabel];
    
    UILabel* monthLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 100, 60, 30)] autorelease];
    [monthLabel setTextAlignment:NSTextAlignmentRight];
    [monthLabel setText:@"月份："];
    [self addSubview:monthLabel];
    
    UITextField* numText = [[[UITextField alloc] initWithFrame:CGRectMake(75, 20, 200, 30)] autorelease];
    [numText setBorderStyle:UITextBorderStyleLine];
    [self addSubview:numText];
    
    UITextField* yearText = [[[UITextField alloc] initWithFrame:CGRectMake(75, 60, 200, 30)] autorelease];
    [yearText setBorderStyle:UITextBorderStyleLine];
    [self addSubview:yearText];
    
    UITextField* MonthFromText = [[[UITextField alloc] initWithFrame:CGRectMake(75, 100, 80, 30)] autorelease];
    [MonthFromText setBorderStyle:UITextBorderStyleLine];
    [self addSubview:MonthFromText];
    
    UILabel* toLabel = [[[UILabel alloc] initWithFrame:CGRectMake(160, 100, 20, 30)] autorelease];
    [toLabel setText:@"至"];
    [self addSubview:toLabel];
    
    UITextField* MonthToText = [[[UITextField alloc] initWithFrame:CGRectMake(185, 100, 85, 30)] autorelease];
    [MonthToText setBorderStyle:UITextBorderStyleLine];
    [self addSubview:MonthToText];
    
    UIButton* conformButton = [[[UIButton alloc] initWithFrame:CGRectMake(120, 200, 80, 30)] autorelease];
    [conformButton setBackgroundImage:[UIImage imageNamed:@"djf_queren"] forState:UIControlStateNormal];
    [self addSubview:conformButton];
    
}



@end
