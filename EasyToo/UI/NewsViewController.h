//
//  NewsViewController.h
//  EasyToo
//
//  Created by hydb on 13-6-12.
//
//

#import <UIKit/UIKit.h>
#import "HotPointView.h"
#import "HouseView.h"
#import "TravelView.h"
#import "CareerView.h"
#import "BrandView.h"
#import "PictureView.h"

@interface NewsViewController : UIViewController
{
    HotPointView *_hotPointView;
    HouseView *_houseView;
    TravelView *_travelView;
    CareerView *_careerView;
    BrandView *_brandView;
    PictureView *_pictureView;
}

@end
