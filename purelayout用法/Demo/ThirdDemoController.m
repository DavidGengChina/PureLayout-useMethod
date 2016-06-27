//
//  ThirdDemoController.m
//  purelayout用法
//
//  Created by  enniu on 16/6/26.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import "ThirdDemoController.h"

@interface ThirdDemoController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *purpleView;
@property (nonatomic, strong) UIView *greenView;

@end

@implementation ThirdDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ThirdDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.redView];
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.purpleView];
    [self.view addSubview:self.greenView];
    
    [self initThirdPureLayout];
}
#pragma mark - 设置约束
- (void)initThirdPureLayout{
    NSArray *colorViews = @[self.redView, self.blueView, self.purpleView, self.greenView];
    [colorViews autoSetViewsDimension:ALDimensionHeight toSize:40.f];
    //间距为10,水平对齐,依次排列
    [colorViews autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:10.0 insetSpacing:YES matchedSizes:YES];
    //红色view相对于其父view水平对齐
    [self.redView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}
#pragma mark - 懒加载
- (UIView *)redView{
    if (!_redView) {
        _redView = [UIView newAutoLayoutView];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UIView *)blueView{
    if (!_blueView) {
        _blueView = [UIView newAutoLayoutView];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}

- (UIView *)purpleView{
    if (!_purpleView) {
        _purpleView = [UIView newAutoLayoutView];
        _purpleView.backgroundColor = [UIColor purpleColor];
    }
    return _purpleView;
}

- (UIView *)greenView{
    if (!_greenView) {
        _greenView = [UIView newAutoLayoutView];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
