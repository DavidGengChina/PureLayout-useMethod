//
//  PracticeThreeController.m
//  purelayout用法
//
//  Created by  enniu on 16/6/26.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import "PracticeThreeController.h"

@interface PracticeThreeController ()

/** 整体可滑动的Scrollow */
@property (nonatomic, strong)UIScrollView *pracScrollow;
/** 用一个view把Scrollow撑起来 */
@property (nonatomic, strong)UIView *contentView;

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *purpleView;
@property (nonatomic, strong) UIView *greenView;
@end

@implementation PracticeThreeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pracScrollow];
    [self.pracScrollow addSubview:self.contentView];
    
    [self.contentView addSubview:self.redView];
    [self.contentView addSubview:self.blueView];
    [self.contentView addSubview:self.purpleView];
    [self.contentView addSubview:self.greenView];
    
    [self initScrollowPureLayout];
}
#pragma mark - 设置约束
- (void)initScrollowPureLayout{
    [self.pracScrollow autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
    [self.contentView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [self.contentView autoSetDimension:ALDimensionWidth toSize:self.view.frame.size.width];
    
    NSArray *views = @[self.redView,self.blueView,self.purpleView,self.greenView];
    [views autoSetViewsDimension:ALDimensionHeight toSize:40.f];
    [views autoSetViewsDimension:ALDimensionWidth toSize:100];
    //间距为10,水平对齐,依次排列
    [views autoDistributeViewsAlongAxis:ALAxisVertical alignedTo:ALAttributeVertical withFixedSpacing:200.0 insetSpacing:YES matchedSizes:YES];
    //红色view相对于其父view水平对齐
    [self.redView autoAlignAxisToSuperviewAxis:ALAxisVertical];
}
#pragma mark - 懒加载
- (UIScrollView *)pracScrollow{
    if (!_pracScrollow) {
        _pracScrollow = [UIScrollView newAutoLayoutView];
        self.pracScrollow.backgroundColor = (UIColorFromRGB(0x373737));
    }
    return _pracScrollow;
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView newAutoLayoutView];
    }
    return _contentView;
}

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
