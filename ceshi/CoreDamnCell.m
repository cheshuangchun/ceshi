//
//  CoreDamnCell.m
//  ceshi
//
//  Created by csc on 16/5/16.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CoreDamnCell.h"

@implementation CoreDamnCell

- (void)awakeFromNib {
    // Initialization code
    [self createTextView];
}

-(void)createTextView
{
    cTextView = [[CSCoreTextView alloc]init];
    [self.contentView addSubview:cTextView];
    [cTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.headView.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(0, 0));
    }];
}

-(void)setModel:(CSTextHeightCal *)model;
{
    [cTextView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.headView.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(CSWidth-20, model.modelHeight));
    }];

    [cTextView setOldString:model.showShuoshuo andXinString:model.completionShuoshuo];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
