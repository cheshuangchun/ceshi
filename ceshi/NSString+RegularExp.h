//
//  NSString+RegularExp.h
//  ceshi
//
//  Created by csc on 16/5/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegularExp)
-(NSString *)replaceCharactersAtIndexs:(NSArray *)indexes withString:(NSString *)aString;

-(NSMutableArray *)itemsForPattern:(NSString *)pattern captureGroupIndex:(NSInteger)index;
@end
