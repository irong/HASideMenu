//
//  HASideMenuVC.m
//  HASideMenu
//
//  Created by Hazard on 15/5/15.
//  Copyright (c) 2015年 Hazard. All rights reserved.
//

#import "HASideMenuVC.h"

@interface HASideMenuVC ()
{
    UIImageView *_imgViewBG;
}

@end

@implementation HASideMenuVC

#pragma mark Instance life cycle


- (id)initWithContentVC:(UIViewController *)contentVC
                             leftVC:(UIViewController *)leftVC
                            rightVC:(UIViewController *)rightVC
{
    self = [super init];
    if (self) {
        _contentVC = contentVC;
        _leftVC = leftVC;
        _rightVC = rightVC;
    }
    return self;
}

#pragma mark View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化背景图
    _imgViewBG = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imgViewBG.image = self.backgroundImage;
    _imgViewBG.contentMode = UIViewContentModeScaleAspectFill;
    _imgViewBG.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_imgViewBG];
    
    if (self.leftVC) {
        [self addChildViewController:self.leftVC];
        self.leftVC.view.frame = self.view.bounds;
        self.leftVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:self.leftVC.view];
        [self.leftVC didMoveToParentViewController:self];
    }
    if (self.rightVC) {
        [self addChildViewController:self.rightVC];
        self.rightVC.view.frame = self.view.bounds;
        self.rightVC.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:self.rightVC.view];
        [self.rightVC didMoveToParentViewController:self];
    }
    
    [self addChildViewController:self.contentVC];
    self.contentVC.view.frame = self.view.bounds;
    self.contentVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.contentVC.view];
    [self.contentVC didMoveToParentViewController:self];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public

- (void)prensentLeftMenuVC
{
    
}

- (void)presentRightMenuVC
{
    
}



@end
