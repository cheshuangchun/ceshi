//
//  CSPresentingAnimator.m
//  ceshi
//
//  Created by csc on 16/5/26.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSPresentingAnimator.h"
#import "UIView+SetRect.h"
@implementation CSPresentingAnimator

//转场动画时间
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //另一个view
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    toView.y        = CSHeight;
    
    //管理容器
    UIView  * container = [transitionContext containerView];
    
    //容器中添加推出的view
    [container addSubview:toView];
    
    //动画时间
    CGFloat duration = [self transitionDuration:transitionContext];
    //开始点  结束点
    CGPoint startPoint = toView.center;
    CGPoint endPoint = container.center;
    
    NSLog(@"start---%f   endPoint=------%f",startPoint.y,endPoint.y);
    
    //关键帧动画
    CAKeyframeAnimation * keyAnimate = [CAKeyframeAnimation animation];
    keyAnimate.keyPath               = @"position";
    keyAnimate.values                = [CSUtils calculateFrameFromPoint:startPoint toPoint:endPoint frameCount:10];
    
    
    keyAnimate.duration              = 0.5;
    toView.center                    = container.center;
    
    
    [toView.layer addAnimation:keyAnimate forKey:nil];
    
    
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [transitionContext completeTransition:YES];
    });
    
    
    
}


//- (NSArray *)calculateFrameFromPoint:(CGPoint)fromPoint
//                             toPoint:(CGPoint)toPoint
//                          frameCount:(size_t)frameCount
//{
//    // 设置帧数量
//    NSMutableArray *values = [NSMutableArray arrayWithCapacity:frameCount];
//    
//    // 计算并存储
//    CGFloat t  = 0.0;
//    CGFloat dt = 1.0 / (frameCount - 1);
//    for(size_t frame = 0; frame < frameCount; ++frame, t += dt)
//    {
//        // 此处就会根据不同的函数计算出不同的值达到不同的效果
//        CGFloat x = fromPoint.x + t * (toPoint.x - fromPoint.x);
//        CGFloat y = fromPoint.y + t * (toPoint.y - fromPoint.y);
//        
//        // 将计算结果存储进数组中
//        [values addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
//    }
//    
//    // 数组中存储的数据为 NSValue CGPoint 型
//    return values;
//}


@end
