//
//  luanView.m
//  ceshi
//
//  Created by csc on 16/5/30.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "luanView.h"

@implementation luanView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code  
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self createView];
    }
    return self;
}

-(void)createView;
{
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CSWidth, CSHeight)];
    UIImageView * bgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fang"]];
    
    
    
}

@end
