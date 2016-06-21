//
//  CoretextCell.m
//  ceshi
//
//  Created by csc on 16/5/13.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CoretextCell.h"

@implementation CoretextCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self createView];
    }
    return self;
}

-(void)createView;
{
    coreView = [[CSCoreTextView alloc]initWithFrame:CGRectMake(10, 0, CSWidth-20, 0)];
    [self.contentView addSubview:coreView];
}


-(void)setModel:(CSTextHeightCal *)model;
{
    coreView.frame = CGRectMake(10, 0, CSWidth-20, model.modelHeight);
    [coreView setOldString:model.showShuoshuo andXinString:model.completionShuoshuo];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
