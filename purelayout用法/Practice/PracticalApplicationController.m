//
//  PracticalApplicationController.m
//  purelayout用法
//
//  Created by  enniu on 16/6/26.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import "PracticalApplicationController.h"

@interface PracticalApplicationController ()
@property (nonatomic, strong) UILabel *practicLabel;
@property (nonatomic, strong) UIView *starView;
@property (nonatomic,strong) NSMutableArray *starImageArr;
@end

@implementation PracticalApplicationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实际应用";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.starImageArr = [[NSMutableArray alloc]init];
    
    [self.view addSubview:self.practicLabel];
    
    [self.view addSubview:self.starView];
    
    [self initPracticPurrLayout];
}
#pragma mark - 设置约束
- (void)initPracticPurrLayout{
    //不约束label的高,它会自动根据文字的多少拉伸高
    [self.practicLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [self.practicLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [self.practicLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100];
    
    //星星view与父view垂直对齐
    [self.starView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.starView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.practicLabel withOffset:40.f];
    [self.starView autoSetDimensionsToSize:CGSizeMake(100, 30)];
    
    //一共有七个白色星星
    for (NSInteger i = 0; i < 7; i++) {
        UIImageView * img = [self getStarImg];
        [self.starImageArr addObject:img];
        [self.starView addSubview:img];
    }
    
    //评价度展示3个星星
    for (int i = 0; i < 3; i++) {
        UIImageView * img = self.starImageArr[i];
        img.image = [UIImage imageNamed:@"star_dark"];
    }
    //星星图片高为11
    [self.starImageArr autoSetViewsDimension:ALDimensionHeight toSize:11.0];
    //间距为3,水平排列
    [self.starImageArr autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:3.0 insetSpacing:YES matchedSizes:YES];
    [self.starImageArr.firstObject autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UIImageView *)getStarImg {
    UIImageView * starIm = [UIImageView newAutoLayoutView];
    [starIm setImage:[UIImage imageNamed:@"star_light.png"]];
    return starIm;
}

- (UILabel *)practicLabel{
    if (!_practicLabel) {
        _practicLabel = [UILabel newAutoLayoutView];
        _practicLabel.backgroundColor = [UIColor blueColor];
        _practicLabel.textColor = [UIColor blackColor];
        _practicLabel.font = [UIFont systemFontOfSize:16];
        _practicLabel.numberOfLines = 0;
        _practicLabel.text = @"Purelayout的实际应用,你学会了吗？Purelayout的实际应用,你学会了吗？Purelayout的实际应用,你学会了吗？Purelayout的实际应用,你学会了吗？Purelayout的实际应用,你学会了吗？Purelayout的实际应用,你学会了吗？Purelayout的实际应用,你学会了吗？Purelayout的实际应用,你学会了吗？Purelayout的实际应用,你学会了吗？Purelayout的实际应用,你学会了吗？";
    }
    return _practicLabel;
}

- (UIView *)starView{
    if (!_starView) {
        _starView = [UIView newAutoLayoutView];
        _starView.backgroundColor = [UIColor orangeColor];
        _starView.alpha = 0.6;
    }
    return _starView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
