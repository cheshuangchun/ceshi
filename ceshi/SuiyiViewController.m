//
//  SuiyiViewController.m
//  ceshi
//
//  Created by csc on 16/5/20.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "SuiyiViewController.h"
#import "SuiyiView.h"
@interface SuiyiViewController ()

@end

@implementation SuiyiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self createView];
    //[self createBezier];
}

-(void)createView;
{
    UIView * showView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CSWidth, CSHeight)];
    [self.view addSubview:showView];
    
    showView.backgroundColor = [UIColor yellowColor];
    showView.alpha = 0.5;
    
    
    
//    //贝塞尔曲线创建一个圈
//    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100/2.f, 100/2.f) radius:50-1 startAngle:-(90*M_PI/180) endAngle:(270*M_PI/180) clockwise:YES];
//    
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    //首先设置一个起点
    [path moveToPoint:CGPointMake(20, CSHeight-100)];
    //添加二次曲线
    [path addQuadCurveToPoint:CGPointMake(CSWidth-20, CSHeight-100) controlPoint:CGPointMake(CSWidth/2., 0)];

    
    
    
    //创建一个CAShapLayer
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.frame = showView.bounds;//与showView的frame一致
    layer.strokeColor = [UIColor greenColor].CGColor; //边缘线的颜色
    layer.fillColor = [UIColor clearColor].CGColor;//闭环填充的颜色
    layer.lineCap = kCALineCapSquare;//边缘线的类型
    layer.path = path.CGPath;//从贝塞尔曲线获取到形状
    layer.lineWidth = 1.f;//线条宽度
    layer.strokeStart = 0.f;
    layer.strokeEnd = 0.f;
    
    //将layer添加进图层
    [showView.layer addSublayer:layer];
    
    //添加动画效果
    CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.f;
    pathAnimation.fromValue = @(0.01);
    pathAnimation.toValue = @(1);
    [layer addAnimation:pathAnimation forKey:@"hi"];
    layer.strokeEnd = 1;
    
    
}

-(void)createBezier
{
    SuiyiView * suiyi = [[SuiyiView alloc]initWithFrame:CGRectMake(0, 0, CSWidth, CSHeight)];
    suiyi.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:suiyi];
    
    
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
