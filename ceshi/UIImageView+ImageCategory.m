//
//  UIImageView+ImageCategory.m
//  ceshi
//
//  Created by csc on 16/5/10.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "UIImageView+ImageCategory.h"
@implementation UIImageView (ImageCategory)
- (void)imageOffsetValue:(float)value {
    
    CGRect centerToWindow = [self convertRect:self.bounds toView:self.window];
    
    CGFloat centerX = CGRectGetMidX(centerToWindow);
    CGPoint windowCenter = self.window.center;
    CGFloat cellOffsetX = centerX - windowCenter.x;
    CGAffineTransform transX = CGAffineTransformMakeTranslation(- cellOffsetX * value, 0);
    
    self.transform = transX;
    
    
    
    
}
@end
