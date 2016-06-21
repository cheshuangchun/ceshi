//
//  NSArray+CSArrayExtension.m
//  ceshi
//
//  Created by csc on 16/4/21.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "NSArray+CSArrayExtension.h"

@implementation NSArray (CSArrayExtension)
- (NSArray *)offsetRangesInArrayBy:(NSUInteger)offset
{
    NSUInteger aoffset = 0;
    NSUInteger prevLength = 0;
    
    NSMutableArray  * ranges = [[NSMutableArray alloc]initWithCapacity:1];
    for (NSInteger i = 0; i < [self count]; i++) {
        @autoreleasepool {
            NSRange range = [[self objectAtIndex:i] rangeValue];
            prevLength = range.length;
            
            range.location -= aoffset;
            range.length = offset;
            [ranges addObject:NSStringFromRange(range)];
            aoffset = aoffset + prevLength - offset;
        }
    }
    
    return ranges;
}
@end
