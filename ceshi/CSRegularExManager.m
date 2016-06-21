//
//  CSRegularExManager.m
//  ceshi
//
//  Created by csc on 16/5/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSRegularExManager.h"

@implementation CSRegularExManager
+(NSArray *)itemIndexesWithPattern:(NSString *)pattern inString:(NSString *)findingString;
{
    NSError * error = nil;
    NSRegularExpression * regExp = [[NSRegularExpression alloc]initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    //查找匹配的字符串
    NSArray * result = [regExp matchesInString:findingString options:NSMatchingReportCompletion range:NSMakeRange(0, findingString.length)];
    
    if(!error)
    {
        NSInteger count = [result count];
        if(0 == count)
        {
            return [NSArray array];
        }
        NSMutableArray * ranges = [[NSMutableArray alloc]initWithCapacity:count];
        for(NSInteger i = 0; i<count;i++)
        {
            @autoreleasepool {
                NSRange range = [[result objectAtIndex:i] range];
                [ranges addObject:[NSValue valueWithRange:range]];
            }
        }
        return ranges;
        
    }else
    {
        return nil;
    }
    
}
@end
