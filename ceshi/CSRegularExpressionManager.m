//
//  CSRegularExpressionManager.m
//  ceshi
//
//  Created by csc on 16/4/21.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSRegularExpressionManager.h"

@implementation CSRegularExpressionManager
+ (NSArray *)itemIndexesWithPattern:(NSString *)pattern inString:(NSString *)findingString;
{
    NSAssert(pattern != nil, @"%s: pattern 不可以为 nil", __PRETTY_FUNCTION__);
    
    NSError * error = nil;
    NSRegularExpression * regExp = [[NSRegularExpression alloc]initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    //查找匹配的字符串
    NSArray * result = [regExp matchesInString:findingString options:NSMatchingReportCompletion range:NSMakeRange(0, [findingString length])];
    if(error)
    {
        return nil;
    }
    
    NSUInteger count = [result count];
    if (0 == count)
    {
        return [NSArray array];
    }
    // 将返回数组中的 NSTextCheckingResult 的实例的 range 取出生成新的 range 数组
    NSMutableArray * ranges = [[NSMutableArray alloc]initWithCapacity:1];
    for (NSInteger i=0;i<count;i++)
    {
        @autoreleasepool {
            NSRange aRange = [[result objectAtIndex:i] range];
            [ranges addObject:[NSValue valueWithRange:aRange]];
        }
    }
    return ranges;
}
@end
