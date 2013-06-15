//
//  SSQ2ViewController.h
//  EasyToo
//
//  Created by linshengqin on 13-6-15.
//
//

#import <UIKit/UIKit.h>

@interface SSQ2ViewController : UIViewController
{
    UIButton *m_button;
    UILabel *tips;
}

@property (retain,nonatomic) NSMutableArray *red_btnArray;
@property (retain,nonatomic) NSMutableArray *blue_btnArray;
@property  (retain,nonatomic) NSMutableArray *toolbarArray;
@property (retain ,nonatomic) UIToolbar *myToolbar;
@property (retain,nonatomic) UILabel *toolbarLabel;

@end
