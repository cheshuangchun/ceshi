//
//  FDemo3ViewController.m
//  ceshi
//
//  Created by csc on 16/5/27.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "FDemo3ViewController.h"

@interface FDemo3ViewController ()

@end

@implementation FDemo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self animation1];
    
    //
    [self leida];
    
    
}

-(void)animation1
{
    UIView * testView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 300, 200)];
    [self.view addSubview:testView];
    
    CGPoint point1 = CGPointMake(10, 80);
    CGPoint point2 = CGPointMake(10, 200);
    CGPoint point3 = CGPointMake(300, 200);
    CGPoint point4 = CGPointMake(300, 80);
    //贝塞尔曲线
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    
    //controlpoint控制点 ，不等于曲线顶点
    [path addQuadCurveToPoint:point1 controlPoint:CGPointMake(155, -50)];
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.lineWidth = 3.;
    layer.fillColor = [UIColor orangeColor].CGColor;
    layer.strokeColor = [UIColor purpleColor].CGColor;
    layer.path = path.CGPath;
    
    [testView.layer addSublayer:layer];
    
    //动画
    CABasicAnimation  * pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 3;
    pathAnimation.fromValue = @(0);
    pathAnimation.toValue = @(1);
    pathAnimation.autoreverses = NO;
    
    [layer addAnimation:pathAnimation forKey:nil];
    
}

//雷达
-(void)leida
{
    
    UIView * leiView = [[UIView alloc]initWithFrame:CGRectMake(50, 400, 200, 200)];
    leiView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:leiView];
    
    //
    CAShapeLayer * leiLayer = [CAShapeLayer layer];
    leiLayer.frame = leiView.bounds;
    leiLayer.path = [UIBezierPath bezierPathWithOvalInRect:leiLayer.bounds].CGPath;
    leiLayer.fillColor = [UIColor orangeColor].CGColor;
    leiLayer.opacity = 0.0;
    
    //可以复制的layer
    CAReplicatorLayer * repLayer = [CAReplicatorLayer layer];
    repLayer.frame = leiLayer.bounds;
    repLayer.instanceCount = 4;//创建副本的数量，包括源对象
    repLayer.instanceDelay = 1;//复制版本之间的延迟
    [repLayer addSublayer:leiLayer];
    
    [leiView.layer addSublayer:repLayer];
    
    CABasicAnimation * opacityAnimate = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimate.fromValue = @(0.5);
    opacityAnimate.toValue = @(0.0);
    
    
    CABasicAnimation * scalAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scalAnima.fromValue = @(0);
    scalAnima.toValue = @(1);
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.animations = @[opacityAnimate,scalAnima];
    group.duration = 4;
    group.autoreverses = NO;
    group.repeatCount = HUGE_VAL;
    
    [leiLayer addAnimation:group forKey:@"angroup"];
    
    
//    UIView * testView = [[UIView alloc]initWithFrame:CGRectMake(50,400, 200, 200)];
//    testView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:testView];
//    
//    CAShapeLayer * oriLayer = [CAShapeLayer layer];
//    oriLayer.frame = testView.layer.bounds;
//    oriLayer.path = [UIBezierPath bezierPathWithOvalInRect:oriLayer.bounds].CGPath;
//    oriLayer.fillColor = [UIColor redColor].CGColor;
//    oriLayer.opacity = 0.0;
//    
//    //可以复制的layer
//    CAReplicatorLayer * replayer = [CAReplicatorLayer layer];
//    replayer.frame = testView.bounds;
//    replayer.instanceCount = 4;//创建副本的数量,包括源对象。
//    replayer.instanceDelay = 1;//复制副本之间的延迟
//    [replayer addSublayer:oriLayer];
//    
//    [testView.layer addSublayer:replayer];
//    
//    CABasicAnimation * opacityAnima = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    opacityAnima.fromValue = @(0.5);
//    opacityAnima.toValue = @(0.0);
//    
//    CABasicAnimation * scaleAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    scaleAnima.fromValue = @(0.);
//    scaleAnima.toValue = @(1.);
//    
////    CABasicAnimation *scaleAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
////    scaleAnima.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.0, 0.0, 0.0)];
////    scaleAnima.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 1.0)];
//    
//    
//    
//    CAAnimationGroup  * group = [CAAnimationGroup animation];
//    group.animations = @[opacityAnima,scaleAnima];
//    group.duration = 4;
//    group.autoreverses = NO;
//    group.repeatCount = HUGE_VAL;
//    
//    [oriLayer addAnimation:group forKey:nil];
    
    
//    UIView * _testView=[[UIView alloc] initWithFrame:CGRectMake(30, 400, 200, 200)];
//    _testView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:_testView];
//    
//    _testView.layer.backgroundColor = [UIColor clearColor].CGColor;
//    //CAShapeLayer和CAReplicatorLayer都是CALayer的子类
//    //CAShapeLayer的实现必须有一个path，可以配合贝塞尔曲线
//    CAShapeLayer *pulseLayer = [CAShapeLayer layer];
//    pulseLayer.frame = _testView.layer.bounds;
//    pulseLayer.path = [UIBezierPath bezierPathWithOvalInRect:pulseLayer.bounds].CGPath;
//    pulseLayer.fillColor = [UIColor redColor].CGColor;//填充色
//    pulseLayer.opacity = 0.0;
//    
//    //可以复制layer
//    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
//    replicatorLayer.frame = _testView.bounds;
//    replicatorLayer.instanceCount = 4;//创建副本的数量,包括源对象。
//    replicatorLayer.instanceDelay = 1;//复制副本之间的延迟
//    [replicatorLayer addSublayer:pulseLayer];
//    [_testView.layer addSublayer:replicatorLayer];
//    
//    CABasicAnimation *opacityAnima = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    opacityAnima.fromValue = @(0.3);
//    opacityAnima.toValue = @(0.0);
//    
//    CABasicAnimation *scaleAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
//    scaleAnima.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.0, 0.0, 0.0)];
//    scaleAnima.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 1.0)];
//    
//    CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
//    groupAnima.animations = @[opacityAnima, scaleAnima];
//    groupAnima.duration = 4.0;
//    groupAnima.autoreverses = NO;
//    groupAnima.repeatCount = HUGE;
//    [pulseLayer addAnimation:groupAnima forKey:@"groupAnimation"];
    
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
