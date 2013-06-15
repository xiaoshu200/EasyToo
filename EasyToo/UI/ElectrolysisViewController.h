//
//  ElectrolysisViewController.h
//  EasyToo
//
//  Created by zhengzhe on 13-6-11.
//
//

#import <UIKit/UIKit.h>
#import "ElectrolysisSearchView.h"
#import "ElecPayView.h"
#import "ElecHistroyView.h"
#import "ElecShopView.h"
#import "ElecSaveVIew.h"
#import "ElecQAView.h"
#import "ElecShareView.h"

@interface ElectrolysisViewController : UIViewController
{
    ElectrolysisSearchView* _searchView;
    ElecPayView* _payView;
    ElecHistroyView* _histroyView;
    ElecShopView* _shopView;
    ElecSaveVIew* _saveView;
    ElecQAView* _qaView;
    ElecShareView* _shareView;
}

@end
