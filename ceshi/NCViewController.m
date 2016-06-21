//
//  NCViewController.m
//  ceshi
//
//  Created by csc on 16/3/21.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "NCViewController.h"

@interface NCViewController ()
{
    UIView * redView;
}
@end

@implementation NCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
    redView = [[UIView alloc]initWithFrame:CGRectMake(60, 130, 5, 5)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    /**
     *  <#Description#>
     */
    [self createAnimate];
}

-(void)createAnimate
{
    CGMutablePathRef path = CGPathCreateMutable();
    //将路径的起点定位到  （50  120）
    CGPathMoveToPoint(path,NULL,60.0,130.0);
    //下面5行添加5条直线的路径到path中
    CGPathAddLineToPoint(path, NULL, 60, 130);
    CGPathAddLineToPoint(path, NULL, 200, 130);
    CGPathAddLineToPoint(path, NULL, 200, 250);
    CGPathAddLineToPoint(path, NULL, 60, 250);
    CGPathAddLineToPoint(path, NULL, 60, 130);
    //下面四行添加四条曲线路径到path
//    CGPathAddCurveToPoint(path,NULL,50.0,275.0,150.0,275.0,70.0,120.0);
//    CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,90.0,120.0);
//    CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,110.0,120.0);
//    CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,130.0,120.0);
    //以“position”为关键字 创建 实例
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设置path属性
    [animation setPath:path];
    [animation setDuration:3.0];
    [animation setRepeatCount:100];
    //这句代码 表示 是否动画回到原位
    // [animation setAutoreverses:YES];
    CFRelease(path);
    [redView.layer addAnimation:animation forKey:NULL];
    
    
    
    CGPoint  point1 = CGPointMake(10, 200);
    CGPoint  point2 = CGPointMake(300, 200);
    CGPoint  point3 = CGPointMake(300, 300);
    CGPoint  point4 = CGPointMake(10, 300);
    
    
    
    UIBezierPath * bepath = [UIBezierPath bezierPath];
    [bepath moveToPoint:point1];
//    [bepath addLineToPoint:point2];
//    [bepath addLineToPoint:point3];
//    [bepath addLineToPoint:point4];
//    [bepath closePath];
    
    [bepath addCurveToPoint:point2 controlPoint1:CGPointMake(145, 30) controlPoint2:CGPointMake(202, 400)];
    
    
    
    CAShapeLayer * layerShape = [CAShapeLayer layer];
    layerShape.lineWidth = 3;
    layerShape.fillColor = [UIColor clearColor].CGColor;
    layerShape.path = bepath.CGPath;
    layerShape.strokeColor = [UIColor purpleColor].CGColor;
    
    [self.view.layer addSublayer:layerShape];
    
    CABasicAnimation * bAnimate = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    bAnimate.duration = 3;
    bAnimate.fromValue = @(0);
    bAnimate.toValue = @(1);
    bAnimate.autoreverses = NO;
    
    [layerShape addAnimation:bAnimate forKey:@"hehe"];
    
    
    
    
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
