//
//  NSString+CSNSStringExtension.h
//  ceshi
//
//  Created by csc on 16/4/21.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CSNSStringExtension)
- (NSString *)replaceCharactersAtIndexes:(NSArray *)indexes withString:(NSString *)aString;
- (NSMutableArray *)itemsForPattern:(NSString *)pattern captureGroupIndex:(NSUInteger)index;
@end
