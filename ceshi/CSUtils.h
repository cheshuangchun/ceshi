//
//  CSUtils.h
//  ceshi
//
//  Created by csc on 16/5/26.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSUtils : NSObject
+ (NSArray *)calculateFrameFromPoint:(CGPoint)fromPoint
                             toPoint:(CGPoint)toPoint
                          frameCount:(size_t)frameCount;
+(CGSize)fontsizeMake:(NSString *)str font:(UIFont *)font width:(CGFloat)width;

+(void)drawRadiousImage:(UIImageView *)imageView image:(UIImage *)image cornerRadius:(CGFloat)radius;
@end
