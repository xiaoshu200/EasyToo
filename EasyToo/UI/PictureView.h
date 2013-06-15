//
//  PictureView.h
//  EasyToo
//
//  Created by hydb on 13-6-12.
//
//

#import <UIKit/UIKit.h>

@interface PictureView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *titleDetail;
@property (nonatomic, strong) NSArray *timeDetail;
@property (nonatomic, strong) NSArray *contentDetail;
@property (nonatomic, strong) NSArray *pictureDetail;

@end
