//
//  NSString+RegularExp.m
//  ceshi
//
//  Created by csc on 16/5/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "NSString+RegularExp.h"

@implementation NSString (RegularExp)
-(NSString *)replaceCharactersAtIndexs:(NSArray *)indexes withString:(NSString *)aString;
{
    NSInteger offset = 0;
    NSMutableString * raw = [self mutableCopy];
    NSInteger prevLength = 0;
    
    for(NSInteger i= 0; i<indexes.count;i++)
    {
        @autoreleasepool {
            NSRange range = [[indexes objectAtIndex:i] rangeValue];
            prevLength = range.length;
            
            range.location -= offset;
            [raw replaceCharactersInRange:range withString:aString];
            offset = offset+prevLength-aString.length;
            
        }
    }
    return raw;
    
}

-(NSMutableArray *)itemsForPattern:(NSString *)pattern captureGroupIndex:(NSInteger)index;
{
    NSError * error = nil;
    NSRegularExpression * regEx = [[NSRegularExpression alloc]initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    if(!error)
    {
        NSMutableArray * results = [[NSMutableArray alloc]initWithCapacity:1];
        NSRange searchRange = NSMakeRange(0, [self length]);
        NSLog(@"看看这个--------------%@",self);
        [regEx enumerateMatchesInString:self options:NSMatchingReportCompletion range:searchRange usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
           
            NSLog(@"------------------------------>>>>>>>>-------%@",result);
            if(result){
                NSRange groupRange = [result rangeAtIndex:index];
                NSString * match = [self substringWithRange:groupRange];
                [results addObject:match];
            }
        }];
        return results;
        
    }else
    {
        return nil;
    }
    
    
}
@end
