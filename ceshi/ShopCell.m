//
//  ShopCell.m
//  ceshi
//
//  Created by csc on 16/4/14.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "ShopCell.h"

@implementation ShopCell

- (void)awakeFromNib {
    // Initialization code
}

-(IBAction)substractionBtnClick:(id)sender
{
    self.shopBlock(0);
}

-(IBAction)addBtnClick:(id)sender
{
    self.shopBlock(1);
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
