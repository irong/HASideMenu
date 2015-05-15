//
//  HASideMenuVC.h
//  HASideMenu
//
//  Created by Hazard on 15/5/15.
//  Copyright (c) 2015年 Hazard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HASideMenuVC : UIViewController


- (HASideMenuVC *)initWithContentVC:(UIViewController *)contentVC
                   leftVC:(UIViewController *)leftVC
                  rightVC:(UIViewController *)rightVC;


@end
