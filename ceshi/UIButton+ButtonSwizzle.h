//
//  UIButton+ButtonSwizzle.h
//  ceshi
//
//  Created by csc on 16/5/17.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ButtonSwizzle)
@property (nonatomic, assign) NSTimeInterval cs_acceptInterval;
@property (nonatomic, assign) BOOL ignoreEvent;
@end
