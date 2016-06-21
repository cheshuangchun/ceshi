//
//  KView.m
//  ceshi
//
//  Created by csc on 16/4/14.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "KView.h"

@implementation KView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor blackColor];
        [self createView];
    }
    return self;
}

-(void)createView
{
    self.addlbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 150, 20)];
    self.addlbl.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.addlbl];
}

@end
