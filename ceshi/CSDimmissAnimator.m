//
//  CSDimmissAnimator.m
//  ceshi
//
//  Created by csc on 16/5/26.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSDimmissAnimator.h"
#import "UIView+SetRect.h"
@implementation CSDimmissAnimator

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //自己的view
//    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
//    
//    //动画的时间
//    CGFloat duration = [self transitionDuration:transitionContext];
//    
//    //开始点  结束点
//    CGPoint startPoint = fromView.center;
//    CGPoint endPoint = CGPointMake(fromView.middleX, fromView.middleY+CSHeight);
//    
//    //关键帧动画
//    CAKeyframeAnimation * keyAnimation = [CAKeyframeAnimation animation];
//    keyAnimation.keyPath = @"position";
//    keyAnimation.values =  [CSUtils calculateFrameFromPoint:startPoint toPoint:endPoint frameCount:60*duration];
//    keyAnimation.duration = duration;
//    
//    fromView.center = endPoint;
//    [fromView.layer addAnimation:keyAnimation forKey:nil];
    
    
    
    
    // 自己的view
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    // 动画时间
    CGFloat duration = [self transitionDuration:transitionContext];
    
    // 开始点 + 结束点
    CGPoint startPoint = fromView.center;
    CGPoint endPoint   = CGPointMake(fromView.middleX,
                                     fromView.middleY + Height);
    
    // 关键帧动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath              = @"position";
    keyAnimation.values               = [CSUtils calculateFrameFromPoint:startPoint toPoint:endPoint frameCount:60*duration];;
    keyAnimation.duration             = duration;
    fromView.center                   = endPoint;
    [fromView.layer addAnimation:keyAnimation forKey:nil];
    
    
    
    
    
    [self performSelector:@selector(hehe:) withObject:transitionContext afterDelay:0.15];
    
}

-(void)hehe:(id<UIViewControllerContextTransitioning>)transitionContext
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [transitionContext completeTransition:YES];
    });
}
@end
