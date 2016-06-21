//
//  FDemo2ViewController.m
//  ceshi
//
//  Created by csc on 16/5/27.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "FDemo2ViewController.h"

@interface FDemo2ViewController ()
{
    CAShapeLayer * layerA;
    CGFloat count;
}
@end

@implementation FDemo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self animation1:.8];
    
    [self animation2];
}

-(void)animation1:(CGFloat)toValue
{
    CGRect rect = CGRectMake(100, 100, 100, 100);
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:50];
    //先画一个圆
    layerA = [CAShapeLayer layer];
    layerA.path = bezierPath.CGPath;
    layerA.fillColor = [UIColor clearColor].CGColor;//填充色
    layerA.strokeColor = [UIColor purpleColor].CGColor;//边框色
    layerA.lineWidth = 6.;
    layerA.lineCap = kCALineCapRound;//线框类型
    [self.view.layer addSublayer:layerA];
    layerA.strokeEnd = 0.01;
    
//    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    animation.fromValue = @(0);
//    animation.toValue = @(toValue);
//    animation.duration = .5;
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
//    [layer addAnimation:animation forKey:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(layerStrokeEnd) userInfo:nil repeats:YES];
    
    
    
    
}

-(void)layerStrokeEnd
{
    count += 0.05;
    layerA.strokeEnd = count;
}


-(void)animation2
{
//    CGRect rect = CGRectMake(150, 150, 100, 100);
//    
//    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:50];
//    
//    CAShapeLayer * layer = [CAShapeLayer layer];
//    layer.fillColor = [UIColor clearColor].CGColor;
//    layer.strokeColor = [UIColor grayColor].CGColor;
//    layer.path = path.CGPath;
//    layer.lineWidth = 6.;
//    layer.lineCap = kCALineCapRound;
//    [self.view.layer addSublayer:layer];
//    
//    
//    CABasicAnimation * basicAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    basicAnimation.fromValue = @(0);
//    basicAnimation.toValue = @(.8);
//    basicAnimation.fillMode = kCAFillModeForwards;
//    basicAnimation.removedOnCompletion = NO;
//    basicAnimation.duration = .5;
//    
//    [layer addAnimation:basicAnimation forKey:nil];
    
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(100, 300, 50, 50)];
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(25, 25) radius:25 startAngle:-M_PI_2 endAngle:M_PI_2*3 clockwise:YES];
    
    //画一个外圆
    CAShapeLayer * grayLayer = [CAShapeLayer layer];
    grayLayer.fillColor = [UIColor clearColor].CGColor;
    grayLayer.strokeColor = [UIColor grayColor].CGColor;
    grayLayer.path = path.CGPath;
    grayLayer.lineWidth = 3.;
    grayLayer.lineCap = kCALineCapRound;
    [view.layer addSublayer:grayLayer];
    
    
    
    
    
    //先画一个圆
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor purpleColor].CGColor;
    layer.lineWidth = 3.;
    layer.lineCap = kCALineCapRound;
    
    [view.layer addSublayer:layer];
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0);
    animation.toValue = @(.6);
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = .6;
    
    [layer addAnimation:animation forKey:nil];
    
    
    CABasicAnimation * animation0 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation0.fromValue = @(0);
    animation0.toValue = @(.8);
    animation0.fillMode = kCAFillModeForwards;
    animation0.removedOnCompletion = NO;
    animation0.duration = .6;
    
    [grayLayer addAnimation:animation0 forKey:nil];
    
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
