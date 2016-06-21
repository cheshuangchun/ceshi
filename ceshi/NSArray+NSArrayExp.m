//
//  NSArray+NSArrayExp.m
//  ceshi
//
//  Created by csc on 16/5/12.
//  Copyright © 2016年  csc. All rights reserved.
//

#import "NSArray+NSArrayExp.h"

@implementation NSArray (NSArrayExp)
-(NSArray *)getNewRangesInArrayBy:(NSInteger)offset;
{
    NSInteger aOffset = 0;
    NSInteger prevLength = 0;
    
    NSMutableArray * ranges = [[NSMutableArray alloc]initWithCapacity:1];
    for (NSInteger i=0; i<[self count]; i++) {
        @autoreleasepool {
            NSRange range = [[self objectAtIndex:i] rangeValue];
            prevLength = range.length;
            range.location -= aOffset;
            range.length = offset;
            [ranges addObject:NSStringFromRange(range)];
            aOffset = aOffset+prevLength-offset;
        }
    }
    return ranges;
}
@end
