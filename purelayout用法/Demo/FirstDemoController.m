//
//  FirstDemoController.m
//  purelayout用法
//
//  Created by  enniu on 16/6/26.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import "FirstDemoController.h"

@interface FirstDemoController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *purpleView;
@property (nonatomic, strong) UIView *greenView;

@end

@implementation FirstDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FirstDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.redView];
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.purpleView];
    [self.purpleView addSubview:self.greenView];
    
    [self initSetPureLayout];
}
#pragma mark - 设置约束
- (void)initSetPureLayout{
    //红色view距离父控件左边20,距离父控件上边100
    [self.redView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20.f];
    [self.redView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100.f];
    //红色view的宽和高为100
    [self.redView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    //等价于下边这两句代码
    //    [redView autoSetDimension:ALDimensionWidth toSize:100];
    //    [redView autoSetDimension:ALDimensionHeight toSize:100];

    //蓝色view的左边,距离红色view的右边为30
    [self.blueView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.redView withOffset:30];
    //蓝色view,红色view等宽等高
    [@[self.blueView,self.redView] autoMatchViewsDimension:ALDimensionWidth];
    [@[self.blueView,self.redView] autoMatchViewsDimension:ALDimensionHeight];
    //蓝色view,红色view水平对齐
    [self.blueView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.redView];
    
    [self.purpleView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20.f];
    [self.purpleView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:250];
    [self.purpleView autoSetDimension:ALDimensionWidth toSize:150];
    [self.purpleView autoSetDimension:ALDimensionHeight toSize:150];
    
    //绿色View距离父控件的上,左,下,右为15
    [self.greenView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(15, 15, 15, 15)];
    
    //这句的意思就是这个view的大小和父view的大小一样
//    [self.greenView autoPinEdgesToSuperviewEdges];
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
