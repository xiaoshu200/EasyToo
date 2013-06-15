//
//  CarBusinessViewController.h
//  EasyToo
//
//  Created by zhengzhe on 13-6-11.
//
//

#import <UIKit/UIKit.h>
#import "CarTrafficView.h"
#import "CarShipView.h"
#import "CarYearView.h"

@interface CarBusinessViewController : UIViewController
{
    CarTrafficView* _carTrafficView;
    CarShipView* _carShipView;
    CarYearView* _carYearView;
}
@end
