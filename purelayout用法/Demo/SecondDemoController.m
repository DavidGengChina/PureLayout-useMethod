//
//  SecondDemoController.m
//  purelayout用法
//
//  Created by  enniu on 16/6/26.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import "SecondDemoController.h"

@interface SecondDemoController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;

@end

@implementation SecondDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SecondDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.redView];
    [self.view addSubview:self.blueView];
    
    [self initSecondDemoPureLayout];
}
#pragma mark - 设置约束
- (void)initSecondDemoPureLayout{
    //红色view在父view的中心点
    [self.redView autoCenterInSuperview];
    //红色view的宽高为100
    [self.redView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    
    //红色view,蓝色view左对齐
    [self.blueView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.redView];
    //蓝色View的上边距离红色view的下边是10
    [self.blueView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.redView withOffset:10];
    //蓝色View距离父view的右边为20
    [self.blueView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20.f];
    //蓝色View的高度是红色View高度的一半
    [self.blueView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.redView withMultiplier:0.5];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
