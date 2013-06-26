//
//  NetGameConfirmViewController.h
//  QQCharge
//
//  Created by linshengqin on 13-6-11.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetGameConfirmViewController : UIViewController

@property (retain,nonatomic) NSString *gameType;
@property (retain,nonatomic) NSString *cardType;
@property (nonatomic) int cardPrice;
@property (nonatomic) int cardNum;
@property (nonatomic) int totalPrice;
@property (retain,nonatomic) NSString *account;
@end
