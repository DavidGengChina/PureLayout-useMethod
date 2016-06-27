//
//  PracticeView.m
//  purelayout用法
//
//  Created by  enniu on 16/6/26.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import "PracticeView.h"

@interface PracticeView ()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *bigImageView;
@property (nonatomic, strong) UIImageView *circleImageView;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation PracticeView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //bgView贴在当前view上
        [self addSubview:self.bgView];
        //大图片贴在bgView上
        [self.bgView addSubview:self.bigImageView];
        //圆闪图片贴在bgView上
        [self.bgView addSubview:self.circleImageView];
        //名字Label贴在大图片上
        [self.bigImageView addSubview:self.nameLabel];
        //描述label贴在bgView上
        [self.bigImageView addSubview:self.descLabel];
        
        [self initViewPureLayout];
    }
    return self;
}
#pragma mark - 设置约束
- (void)initViewPureLayout{
    //bgView填充整个父view
    [self.bgView autoPinEdgesToSuperviewEdges];
    
    //大图片距左,上,下,右分别为0,0,10,0。忽略右边
    [self.bigImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 10, 0) excludingEdge:ALEdgeRight];
    
    [self.circleImageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.bigImageView];
    [self.circleImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.f];
    //圆闪图片和单边接缝label水平对齐,相差6像素
    [self.circleImageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.descLabel withOffset:6.f];
    
    //工艺label距离父viwe上,左,下。分别为,6,6,6像素
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:6.f];
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:6.f];
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:6.f];
    
    //单边接缝label距离父view的左边和下边分别为30和2
    [self.descLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30.f];
    [self.descLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:2.f];
    //单边接缝label的右边距离圆闪图片的左边为0
    [self.descLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.circleImageView withOffset:0.f];
}
#pragma mark - 懒加载
- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView newAutoLayoutView];
    }
    return _bgView;
}

- (UIImageView *)bigImageView{
    if (!_bigImageView) {
        _bigImageView = [UIImageView newAutoLayoutView];
        _bigImageView.image = [UIImage imageNamed:@"bigImage"];
    }
    return _bigImageView;
}

- (UIImageView*)circleImageView{
    if (!_circleImageView) {
        _circleImageView = [UIImageView newAutoLayoutView];
        NSArray *aniImages = @[[UIImage imageNamed:@"flash1"],
                               [UIImage imageNamed:@"flash2"],
                               [UIImage imageNamed:@"flash3"],
                               [UIImage imageNamed:@"flash4"],
                               [UIImage imageNamed:@"flash5"],
                               [UIImage imageNamed:@"flash6"]];
        
        _circleImageView.animationImages = aniImages;
        _circleImageView.animationDuration = aniImages.count * 0.1;
        
        [_circleImageView startAnimating];
    }
    return _circleImageView;
}

-(UILabel*)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
        _nameLabel.textColor = [UIColor orangeColor];
        _nameLabel.text = @"工艺";
        _nameLabel.font = [UIFont systemFontOfSize:8];
    }
    return _nameLabel;
    
}


-(UILabel*)descLabel{
    if (!_descLabel) {
        _descLabel = [UILabel newAutoLayoutView];
        _descLabel.textColor = [UIColor orangeColor];
        _descLabel.text = @"单边接缝";
        _descLabel.textAlignment = NSTextAlignmentCenter;
        _descLabel.font = [UIFont systemFontOfSize:8];
    }
    return _descLabel;
    
}

@end
