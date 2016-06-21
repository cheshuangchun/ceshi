//
//  YoloTx.m
//  ceshi
//
//  Created by csc on 16/5/6.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "YoloTx.h"
@interface YoloTx()<UITextViewDelegate>
{
    BOOL _isHidden;
}
@end

@implementation YoloTx
@synthesize pColor = _pColor;


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeEditing) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

-(void)setPColor:(UIColor *)pColor
{
    _pColor = pColor;
    [self setNeedsDisplay];
}

-(UIColor *)pColor
{
    return _pColor;
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    [self setNeedsDisplay];
}

-(void)setText:(NSString *)text
{
    [super setText:text];
    
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    if(!_isHidden)
    {
        UIFont * font;
        if([self font])
        {
            font = [self font];
        }else
        {
            font = [UIFont systemFontOfSize:12];
        }
        
        NSDictionary * dict = @{NSFontAttributeName:font,NSForegroundColorAttributeName:_pColor};
        [_placeholder drawAtPoint:CGPointMake(5, 8) withAttributes:dict];
        
    }
}


-(void)changeEditing
{
    if([self.text isEqualToString:@""])
    {
        _isHidden = NO;
    }else
    {
        _isHidden = YES;
    }
    [self setNeedsDisplay];
}

@end
