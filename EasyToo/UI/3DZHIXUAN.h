//
//  3DZHIXUAN.h
//  EasyToo
//
//  Created by linshengqin on 13-6-24.
//
//

#import <UIKit/UIKit.h>

@interface _DZHIXUAN : UIView
{
    UIButton *m_button;
    UILabel *tips;

}

@property (retain,nonatomic) NSMutableArray *btnArray;

@property (retain ,nonatomic) UIToolbar *myToolbar;

@property  (retain,nonatomic) NSMutableArray *toolbarArray;
@property (retain,nonatomic) UILabel *toolbarLabel;
@end
