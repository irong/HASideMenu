//
//  UIViewController+HASideMenu.m
//  HASideMenu
//
//  Created by Hazard on 15/5/18.
//  Copyright (c) 2015年 Hazard. All rights reserved.
//

#import "UIViewController+HASideMenu.h"

@implementation UIViewController (HASideMenu)

- (HASideMenuVC *)sideMenuVC
{
    UIViewController *paVC = self.parentViewController;
    while (paVC) {
        if ([paVC isKindOfClass:[HASideMenuVC class]]) {
            return (HASideMenuVC*)paVC;
        }else if(paVC.parentViewController && paVC.parentViewController != paVC){
            paVC = paVC.parentViewController;
        }else{
            return nil;
        }
    }
    return nil;
}


#pragma mark - Deleate Methods
- (void)presentLeftVC:(id)sender
{
    [self.sideMenuVC presentLeftMenuVC];
}

- (void)presentRightVC:(id)sender
{
    [self.sideMenuVC presentRightMenuVC];
}

@end
