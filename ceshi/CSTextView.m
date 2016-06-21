//
//  CSTextView.m
//  ceshi
//
//  Created by csc on 16/4/21.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSTextView.h"
#import <CoreText/CoreText.h>
#import "NSString+CSNSStringExtension.h"
#import "CSRegularExpressionManager.h"
@implementation CSTextView
{
    //未替换含有[抱拳]的字符串
    NSString * _oldString;
    //替换过含有[抱拳]的字符串
    NSString * _newString;
    
    //
    CTTypesetterRef typesetter;
    CTFontRef helvetica;
    

}


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
    
    }
    return self;
}

-(void)dealloc
{
    if(typesetter != NULL)
    {
        CFRelease(typesetter);
    }
}


- (void)setOldString:(NSString *)oldString andNewString:(NSString *)newString;
{
    _oldString = oldString;
    _newString = newString;
    [self cookEmotionString];
}

-(void)cookEmotionString
{
    //使用正则表达式查找特殊字符的位置
    NSArray * itemIndexs = [CSRegularExpressionManager itemIndexesWithPattern:EmotionItemPattern inString:_oldString];
    
    NSArray * names = nil;
    NSArray * newRanges = nil;
    names = [_oldString itemsForPattern:EmotionItemPattern captureGroupIndex:1];
    
    
    
    
}

@end
