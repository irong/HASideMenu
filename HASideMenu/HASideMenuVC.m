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

@property (nonatomic, strong) UIView *menuViewContainer;
@property (nonatomic, strong) UIView *contentViewContainer;

@property (nonatomic, strong) UIImageView *backgroundImageView;

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
        
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _menuViewContainer = [[UIView alloc] init];
    _contentViewContainer = [[UIView alloc] init];
    
    _menuVCTransformation = CGAffineTransformMakeScale(1.5f, 1.5f);
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
    [self.view addSubview:self.menuViewContainer];
    [self.view addSubview:self.contentViewContainer];
    
    self.menuViewContainer.frame = self.view.bounds;
    self.menuViewContainer.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    if (self.leftVC) {
        [self addChildViewController:self.leftVC];
        self.leftVC.view.frame = self.view.bounds;
        self.leftVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.menuViewContainer addSubview:self.leftVC.view];
        [self.leftVC didMoveToParentViewController:self];
    }
    if (self.rightVC) {
        [self addChildViewController:self.rightVC];
        self.rightVC.view.frame = self.view.bounds;
        self.rightVC.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self.menuViewContainer addSubview:self.rightVC.view];
        [self.rightVC didMoveToParentViewController:self];
    }
    
    self.contentViewContainer.frame = self.view.bounds;
    self.contentViewContainer.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self addChildViewController:self.contentVC];
    self.contentVC.view.frame = self.view.bounds;
    self.contentVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.contentViewContainer addSubview:self.contentVC.view];
    [self.contentVC didMoveToParentViewController:self];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public

- (void)presentLeftMenuVC
{

}

- (void)presentRightMenuVC
{
    
}

#pragma mark - Private

- (void)presentMenuViewContainerWithMenuVC:(UIViewController *)menuVC
{
    self.backgroundImageView.transform = CGAffineTransformIdentity;
    self.backgroundImageView.frame = self.view.bounds;
    self.backgroundImageView.transform = CGAffineTransformMakeScale(1.7f, 1.7f);
    
    self.menuViewContainer.transform = CGAffineTransformIdentity;
    self.menuViewContainer.frame = self.view.bounds;
    self.menuViewContainer.transform = self.menuVCTransformation;
}

- (void)showLeftMenuVC
{
    if (!self.leftVC) {
        return;
    }
    [self.leftVC beginAppearanceTransition:YES animated:YES];
    self.leftVC.view.hidden = NO;
    self.rightVC.view.hidden = YES;
    [self.view.window endEditing:YES];
    
}

#pragma mark - Setters

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    _backgroundImage = backgroundImage;
    if (self.backgroundImageView) {
        self.backgroundImageView.image = backgroundImage;
    }
}



@end
