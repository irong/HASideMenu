//
//  UIViewController+HASideMenu.h
//  HASideMenu
//
//  Created by Hazard on 15/5/18.
//  Copyright (c) 2015年 Hazard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HASideMenuVC.h"

@interface UIViewController (HASideMenu)

@property (nonatomic, readonly, strong) HASideMenuVC *sideMenuVC;

- (void)presentLeftVC:(id)sender;
- (void)presentRightVC:(id)sender;

@end
