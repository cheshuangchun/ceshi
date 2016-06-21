//
//  CscTableHeaderFooterView.m
//  ceshi
//
//  Created by csc on 16/5/6.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CscTableHeaderFooterView.h"
#import "UITableView+Category.h"

@interface CscTableHeaderFooterView()
{
    UILabel * klabel;
}
@property (nonatomic, weak) UIControl * tapControl;
@end

@implementation CscTableHeaderFooterView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setupSubviews];
    }
    return self;
}

-(void)setupSubviews
{
    UIControl * tapControl = [[UIControl alloc]init];
    [tapControl addTarget:self action:@selector(tapSection:) forControlEvents:UIControlEventTouchUpInside];
    tapControl.backgroundColor = [UIColor redColor];
    tapControl.frame = self.contentView.bounds;
    [self.contentView addSubview:tapControl];
    self.tapControl = tapControl;
    
}



-(void)tapSection:(UIControl *)control
{
    UITableView * supTable = (UITableView *)self.superview;
    [supTable hideSection:self.headerSection];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
