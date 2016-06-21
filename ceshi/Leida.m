//
//  Leida.m
//  ceshi
//
//  Created by csc on 16/4/27.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "Leida.h"

@implementation Leida


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
    
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor whiteColor]setFill];
    UIRectFill(rect);
    
    NSInteger count = 3;
    double animateDuration = 2;
    
    CALayer * animaLayer = [[CALayer alloc]init];
    self.animationLayer = animaLayer;
    
    for(NSInteger i =0; i<count;i++)
    {
       //雷达
        CALayer * pulLayer = [[CALayer alloc]init];
        pulLayer.backgroundColor = [UIColor orangeColor].CGColor;
        pulLayer.borderColor = [UIColor orangeColor].CGColor;
        pulLayer.borderWidth = 1.0;
        pulLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
        pulLayer.cornerRadius = rect.size.height/2;
        
        //
        CAMediaTimingFunction * timFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        
        CAAnimationGroup * animateGroup = [[CAAnimationGroup alloc]init];
        animateGroup.fillMode = kCAFillModeBackwards;
        animateGroup.beginTime = CACurrentMediaTime()+(double)i*(animateDuration)/count;
        animateGroup.duration = animateDuration;
        animateGroup.repeatCount = HUGE_VAL;
        animateGroup.timingFunction = timFunction;
        
        CABasicAnimation * scaleAnimate = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimate.fromValue = [NSNumber numberWithInt:0.2];
        scaleAnimate.toValue = [NSNumber numberWithInt:1];
        scaleAnimate.autoreverses = NO;
        
        CAKeyframeAnimation * opacityAnimate = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimate.values = @[[NSNumber numberWithDouble:1.0],[NSNumber numberWithDouble:0.5],[NSNumber numberWithDouble:0.3],[NSNumber numberWithDouble:0.0]];
        animateGroup.animations = [NSArray arrayWithObjects:scaleAnimate,opacityAnimate, nil];
        
        [pulLayer addAnimation:animateGroup forKey:nil];
        [self.layer addSublayer:pulLayer];
    }
    
    //self.animationLayer.zPosition = -1;
    //[self.layer addSublayer:self.animationLayer];
    
}


@end
