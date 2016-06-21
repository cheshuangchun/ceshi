//
//  CSRegularExpressionManager.h
//  ceshi
//
//  Created by csc on 16/4/21.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSRegularExpressionManager : NSObject
+ (NSArray *)itemIndexesWithPattern:(NSString *)pattern inString:(NSString *)findingString;
@end
