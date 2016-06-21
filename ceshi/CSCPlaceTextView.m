//
//  CSCPlaceTextView.m
//  ceshi
//
//  Created by csc on 16/5/6.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSCPlaceTextView.h"

@interface CSCPlaceTextView()<UITextViewDelegate>
{
    BOOL _isHidden;
}

@end

@implementation CSCPlaceTextView
@synthesize placeColor = _placeColor;
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeEditing) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

//设置占位符颜色
-(UIColor *)placeColor
{
    if(!_placeColor)
    {
        _placeColor = [UIColor grayColor];
    }
    
    return _placeColor;
}

-(void)setPlaceColor:(UIColor *)placeColor
{
    _placeColor = placeColor;
    [self setNeedsDisplay];
}



//设置占位符
-(void)setPlaceholder:(NSString *)placeholder
{
     _placeholder = placeholder;
    [self setNeedsDisplay];
}

-(void)setText:(NSString *)text
{
    [super setText:text];
    [self changeEditing];
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


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    if(!_isHidden)
    {
        UIFont * font ;
        if([self font])
        {
            font = [self font];
        }else
        {
            font = [UIFont systemFontOfSize:12];
        }
        NSDictionary * dict = @{NSFontAttributeName:font,NSForegroundColorAttributeName:self.placeColor};
        [self.placeholder drawAtPoint:CGPointMake(5, 8) withAttributes:dict];
    }
    
}


@end
