//
//  PureLayoutTableViewCell.m
//  purelayout用法
//
//  Created by  enniu on 16/6/26.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import "PureLayoutTableViewCell.h"

@implementation PureLayoutTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addKongJianLabel];
    }
    return self;
}

- (void)addKongJianLabel{
    self.cellNameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.cellNameLabel];
    [self.cellNameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:24.f];
    [self.cellNameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [self.cellNameLabel autoSetDimension:ALDimensionHeight toSize:30];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
