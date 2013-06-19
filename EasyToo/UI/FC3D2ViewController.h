//
//  FC3D2ViewController.h
//  EasyToo
//
//  Created by linshengqin on 13-6-18.
//
//

#import <UIKit/UIKit.h>

@interface FC3D2ViewController : UIViewController
{
    UIButton *m_button;
    UILabel *tips;
}

@property  (retain,nonatomic) NSMutableArray *toolbarArray;
@property (retain ,nonatomic) UIToolbar *myToolbar;
@property (retain,nonatomic) UILabel *toolbarLabel;
@property (retain,nonatomic) NSMutableArray *btnArray;
@end
