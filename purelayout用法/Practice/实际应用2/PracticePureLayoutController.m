//
//  PracticePureLayoutController.m
//  purelayout用法
//
//  Created by  enniu on 16/6/26.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import "PracticePureLayoutController.h"
#import "PracticeView.h"

@interface PracticePureLayoutController ()

@property (nonatomic, strong) UIImageView *showImageView;

@property (nonatomic, strong) PracticeView *praView;

@end

@implementation PracticePureLayoutController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实际应用2";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.showImageView];
    [self.view addSubview:self.praView];
    [self initPracticePureLayout];
}
#pragma mark - 设置约束
- (void)initPracticePureLayout{
    [self.showImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20.f];
    [self.showImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:200.f];
    [self.showImageView autoSetDimensionsToSize:CGSizeMake(120, 54)];
    
    [self.praView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.showImageView];
    [self.praView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.showImageView];
}
#pragma mark - 懒加载
- (UIImageView *)showImageView{
    if (!_showImageView) {
        _showImageView = [UIImageView newAutoLayoutView];
        _showImageView.image = [UIImage imageNamed:@"demo.png"];
    }
    return _showImageView;
}

- (PracticeView *)praView{
    if (!_praView) {
        _praView = [PracticeView newAutoLayoutView];
        _praView.backgroundColor = UIColorFromRGB(0xe3e3e3);
    }
    return _praView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
