//
//  HASideMenuVC.h
//  HASideMenu
//
//  Created by Hazard on 15/5/15.
//  Copyright (c) 2015年 Hazard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstVC.h"

@interface HASideMenuVC : UIViewController

@property(nonatomic, strong) UIViewController *contentVC;
@property(nonatomic, strong) UIViewController *leftVC;
@property(nonatomic, strong) UIViewController *rightVC;

@property(nonatomic, strong) UIImage *backgroundImage;


- (HASideMenuVC *)initWithContentVC:(UIViewController *)contentVC
                   leftVC:(UIViewController *)leftVC
                  rightVC:(UIViewController *)rightVC;

- (void)presentLeftMenuVC;
- (void)presentRightMenuVC;

@end
