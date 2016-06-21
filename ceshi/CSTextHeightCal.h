//
//  CSTextHeightCal.h
//  ceshi
//
//  Created by csc on 16/5/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSTextHeightCal : NSObject
@property (copy, nonatomic) NSString * showShuoshuo;
@property (copy, nonatomic) NSString * completionShuoshuo;
@property (assign, nonatomic) float modelHeight;
-(float)calculateShuoShuoHightWithHeight:(float)sizeWidth;
@end
