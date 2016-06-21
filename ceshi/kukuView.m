//
//  kukuView.m
//  ceshi
//
//  Created by csc on 16/4/27.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "kukuView.h"

@implementation kukuView


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(animationStop)];
        [self addGestureRecognizer:tap];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor clearColor]setFill];
    
    CALayer * thumbnailLayer = [[CALayer alloc]init];
    thumbnailLayer.backgroundColor = [UIColor whiteColor].CGColor;
    CGRect thumbnailRect = CGRectMake(0, 0,40, 40);
    thumbnailRect.origin.x = 30;
    thumbnailRect.origin.y = 80;
    thumbnailLayer.frame = thumbnailRect;
    thumbnailLayer.cornerRadius = 20.0;
    thumbnailLayer.borderWidth = 1.0;
    thumbnailLayer.masksToBounds = YES;
    thumbnailLayer.borderColor = [UIColor whiteColor].CGColor;
    UIImage * thumbnail = [UIImage imageNamed:@"face"];
    thumbnailLayer.contents = (id)thumbnail.CGImage;
    thumbnailLayer.zPosition = -1;
    [self.layer addSublayer:thumbnailLayer];
    self.animateLayer = thumbnailLayer;

    CAMediaTimingFunction * function = [CAMediaTimingFunction functionWithName:@"linear"];
    
    CAAnimationGroup * groupAnimate = [[CAAnimationGroup alloc]init];
    groupAnimate.fillMode = kCAFillModeForwards;//@"both";
    groupAnimate.duration = 1.5;
     groupAnimate.repeatCount = HUGE_VAL;
    groupAnimate.beginTime = CACurrentMediaTime()+1;
    groupAnimate.timingFunction = function;
    
    
    CABasicAnimation * scalAnimate = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scalAnimate.fromValue = [NSNumber numberWithDouble:1.0];
    scalAnimate.toValue = [NSNumber numberWithDouble:2.0];
    scalAnimate.autoreverses = NO;
    
    CABasicAnimation * translationAnimateZ = [CABasicAnimation animationWithKeyPath:@"transform.translation.z"];
    translationAnimateZ.fillMode = kCAFillModeForwards;
    translationAnimateZ.autoreverses = NO;
    translationAnimateZ.fromValue = [NSNumber numberWithDouble:-20.0];
    translationAnimateZ.toValue = [NSNumber numberWithDouble:300.0];
    
    CABasicAnimation * translationAnimateX = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    translationAnimateX.fillMode = kCAFillModeForwards;
    translationAnimateX.autoreverses = NO;
    translationAnimateX.fromValue = [NSNumber numberWithDouble:30.0];
    translationAnimateX.toValue = [NSNumber numberWithDouble:150.0];
    
    
    
//    
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
//    
//    anim.keyPath = @"position";
//    anim.removedOnCompletion = NO;
//    anim.fillMode = kCAFillModeForwards;
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddEllipseInRect(path, NULL, CGRectMake(30, 50, 100, 100));
//    anim.path = path;
//    CGPathRelease(path);
//    
//    // 设置动画的执行节奏
//    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    
    CAKeyframeAnimation * keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    keyAnimation.values = @[[NSNumber numberWithDouble:1.0],[NSNumber numberWithDouble:0.5],[NSNumber numberWithDouble:0.3],[NSNumber numberWithDouble:0.0]];
    
    
    groupAnimate.animations = [NSArray arrayWithObjects:scalAnimate,translationAnimateZ,translationAnimateX,keyAnimation, nil];
    ;
    [thumbnailLayer addAnimation:groupAnimate forKey:@"animate"];
    
    //[self.layer addSublayer:animaLayer];
}

-(void)animationStop
{
    [self.animateLayer removeAllAnimations];
}


@end
