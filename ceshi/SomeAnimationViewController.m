//
//  SomeAnimationViewController.m
//  ceshi
//
//  Created by csc on 16/4/28.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "SomeAnimationViewController.h"

@interface SomeAnimationViewController ()
{
    UIImageView * demoView;
    BOOL finshA;
}
@end

@implementation SomeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    demoView = [[UIImageView alloc]initWithFrame:CGRectMake(187.5, 441.5, 30, 30)];
    [demoView setImage:[UIImage imageNamed:@"face"]];
    demoView.layer.cornerRadius = 15;
    demoView.layer.masksToBounds = YES;
    
    [self.view addSubview:demoView];
    
    //基本动画
    
    //[self positionAnimation];
   // [self opacityAnimate];
    
   //[self backGroundAnimate];
    
    //keyPath
    [self keyFrameAnimation];
    
    
    //[self pathAnimate];
    
}
//移动
-(void)positionAnimation
{
    CABasicAnimation * basicAnimate = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    basicAnimate.toValue = [NSNumber numberWithDouble:CSWidth];
    basicAnimate.fillMode = kCAFillModeForwards;
    basicAnimate.removedOnCompletion = NO;
    basicAnimate.repeatCount = HUGE_VAL;
    basicAnimate.duration = 2.;
    [demoView.layer addAnimation:basicAnimate forKey:@"translationX"];
}

-(void)opacityAnimate
{
    CABasicAnimation * basicAnimate = [CABasicAnimation animationWithKeyPath:@"opacity"];
    basicAnimate.fromValue = [NSNumber numberWithDouble:1.0];
    basicAnimate.toValue = [NSNumber numberWithDouble:0.2];
    basicAnimate.fillMode = kCAFillModeForwards;
    basicAnimate.removedOnCompletion = NO;
    basicAnimate.repeatCount = HUGE_VAL;
    basicAnimate.duration = 2.;
    [demoView.layer addAnimation:basicAnimate forKey:@"opacityX"];
}

-(void)backGroundAnimate
{
    CABasicAnimation * basicAnimate = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    basicAnimate.toValue = (id)[UIColor blueColor].CGColor;
    basicAnimate.fillMode = kCAFillModeForwards;
    basicAnimate.removedOnCompletion = NO;
    basicAnimate.repeatCount = HUGE_VAL;
    basicAnimate.duration = 2.;
    [demoView.layer addAnimation:basicAnimate forKey:@"bgColor"];
}

//关键帧动画
-(void)keyFrameAnimation
{
    CAKeyframeAnimation * anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue * value0 = [NSValue valueWithCGPoint:CGPointMake(10, 100)];
    NSValue * value01 = [NSValue valueWithCGPoint:CGPointMake(10, 200)];
    NSValue * value1 = [NSValue valueWithCGPoint:CGPointMake(CSWidth/4., 200)];
    NSValue * value2 = [NSValue valueWithCGPoint:CGPointMake(CSWidth/4.0*2, 300)];
    NSValue * value3 = [NSValue valueWithCGPoint:CGPointMake(CSWidth, 100)];
    //NSValue * value3 = [NSValue valueWithCGPoint:CGPointMake(CSWidth., 100)];
    anima.values = [NSArray arrayWithObjects:value0,value01,value1,value2,value3, nil];
    anima.duration = 2;
    anima.fillMode = kCAFillModeForwards;
    anima.repeatCount = HUGE_VAL;
    anima.removedOnCompletion = YES;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [demoView.layer addAnimation:anima forKey:@"keyFramePath"];
    
}

//path动画
-(void)pathAnimate
{
    // 1.Configure rotation animation
    //
    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.values = @[@(0.0), @(- M_PI), @(- M_PI * 1.5), @(- M_PI * 2)];
    //rotationAnimation.duration = 0.3f;
    rotationAnimation.keyTimes = @[@(0.0), @(0.3), @(0.6), @(1.0)];
    
    // 2.Configure moving animation
    //
    CAKeyframeAnimation *movingAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // Create moving path
    //
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 187.5, 441.5);
    CGPathAddLineToPoint(path, NULL, 87.9, 384);
    CGPathAddLineToPoint(path, NULL, 100.8, 391.5);
    CGPathAddLineToPoint(path, NULL, 96.6, 389);
    
    movingAnimation.path = path;
    movingAnimation.keyTimes = @[@(0.0), @(0.5), @(0.7), @(1.0)];
    //movingAnimation.duration = 0.3f;
    CGPathRelease(path);
    
    // 3.Merge two animation together
    //
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    animations.animations = @[movingAnimation, rotationAnimation];
    animations.duration = 0.5;
    animations.delegate = self;
    //animations.repeatCount = HUGE_VAL;
    
    animations.removedOnCompletion = NO;
    animations.fillMode = kCAFillModeForwards;
    
    
    [demoView.layer addAnimation:animations forKey:@"keyFramePath"];
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    finshA = !finshA;
    if(finshA)
        [self finishAnimate];
    else
        [self pathAnimate];
}

-(void)finishAnimate
{
    CAKeyframeAnimation * keyqAnimate = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    keyqAnimate.values = @[@(-M_PI*2),@(-M_PI*1.5),@(-M_PI),@(0.0)];
    
    CAKeyframeAnimation * moveAnimate = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 96.6, 389);
    CGPathAddLineToPoint(path, NULL, 100.8, 391.5);
    CGPathAddLineToPoint(path, NULL, 87.9, 384);
    CGPathAddLineToPoint(path, NULL, 187.5, 441.5);
    
    moveAnimate.path = path;
    CGPathRelease(path);
    
    CAAnimationGroup * animations = [CAAnimationGroup animation];
    animations.animations = @[moveAnimate,keyqAnimate];
    animations.duration = 0.5;
    
    animations.removedOnCompletion = NO;
    animations.fillMode = kCAFillModeForwards;
    
    [demoView.layer addAnimation:animations forKey:@"keysss"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
