//
//  RichTextCell.m
//  ceshi
//
//  Created by csc on 16/4/18.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "RichTextCell.h"

@implementation RichTextCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self creatUI];
    }
    return self;

}

-(void)creatUI
{
    coreTx = [[CSCCoreText alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:coreTx];
    
}

-(void)setMessage:(RichModel *)model;
{
    CGRect rect = model.srect;
    coreTx.frame =  CGRectMake(20, 0, rect.size.width, rect.size.height);
    coreTx.text = model.attStr;
    coreTx.lineSpace = 1.0f;
    coreTx.font = [UIFont systemFontOfSize:15.0f];
    coreTx.backgroundColor = [UIColor yellowColor];
    //textView.delegage = self;
    [self.contentView addSubview:coreTx];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
