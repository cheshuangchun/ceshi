//
//  CSRegularExManager.h
//  ceshi
//
//  Created by csc on 16/5/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSRegularExManager : NSObject
+(NSArray *)itemIndexesWithPattern:(NSString *)pattern inString:(NSString *)findingString;
@end
