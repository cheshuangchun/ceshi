//
//  NSString+CSNSStringExtension.m
//  ceshi
//
//  Created by csc on 16/4/21.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "NSString+CSNSStringExtension.h"

@implementation NSString (CSNSStringExtension)
- (NSString *)replaceCharactersAtIndexes:(NSArray *)indexes withString:(NSString *)aString;
{
    NSAssert(indexes != nil, @"%s: indexes 不可以为nil", __PRETTY_FUNCTION__);
    NSAssert(aString != nil, @"%s: aString 不可以为nil", __PRETTY_FUNCTION__);
    
    NSUInteger offset = 0;
    NSMutableString * raw = [self mutableCopy];
    
    NSInteger prevLength = 0;
    for (NSInteger i = 0; i<[indexes count]; i++) {
        @autoreleasepool {
            NSRange range = [[indexes objectAtIndex:i] range];
            prevLength = range.length;
            
            range.location -= offset;
            [raw replaceCharactersInRange:range withString:aString];
            offset = offset + prevLength - [aString length];
        }
    }
    return raw;
}

- (NSMutableArray *)itemsForPattern:(NSString *)pattern captureGroupIndex:(NSUInteger)index
{
    if(!pattern)
        return nil;
    NSError * error = nil;
    NSRegularExpression * regx = [[NSRegularExpression alloc]initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    if (!error)
    {
        NSMutableArray * results = [[NSMutableArray alloc]init];
        NSRange searchRange = NSMakeRange(0, [self length]);
        [regx enumerateMatchesInString:self options:0 range:searchRange usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
            //NSLog(@"---------------------------------------------------------------");
            NSRange groupRange = [result rangeAtIndex:1];
            NSString * match = [self substringWithRange:groupRange];
             NSLog(@"---------------------------------------------------------------%@",match);
            [results addObject:match];
            
        }];
        return results;
    }
    return nil;
    
    
}

@end
