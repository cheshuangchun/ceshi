//
//  CSTextHeightCal.m
//  ceshi
//
//  Created by csc on 16/5/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSTextHeightCal.h"
#import "CSRegularExManager.h"
#import "NSString+RegularExp.h"
#import "CSCoreTextView.h"
@implementation CSTextHeightCal
-(float)calculateShuoShuoHightWithHeight:(float)sizeWidth;
{
    NSString * matchString = _showShuoshuo;
    
    //获取Range数组
    NSArray * rangeArr = [CSRegularExManager itemIndexesWithPattern:EmotionItemPattern inString:matchString];
    //替换表情字符 [抱拳] [嘿嘿] 等
    NSString * newString = [matchString replaceCharactersAtIndexs:rangeArr withString:fPlaceholder];
    
    _completionShuoshuo = newString;
    
    CSCoreTextView * csCoretext = [[CSCoreTextView alloc]initWithFrame:CGRectMake(10, 0, CSWidth-20, 0)];
    csCoretext.isDraw = NO;
    [csCoretext setOldString:_showShuoshuo andXinString:newString];
    
    
    return [csCoretext getTextHeight];
}
@end
