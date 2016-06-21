//
//  CSAnimationViewController.m
//  ceshi
//
//  Created by csc on 16/5/18.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSAnimationViewController.h"

@interface CSAnimationViewController ()
{
    UIImageView * faceView;
    UIView * bgView;
    UITextField * field;
}
@end

@implementation CSAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //[self createView];
    //[self createView2];
    //[self createView3];
    //[self createView4];
    
    //抛物线
    //[self paowuxian];
    
    //五角星
    [self wujiaoxing];

    //画个矩形动画
    //[self otherC];
    
    //画个弧形
    //[self sancihuxian];
    
    
    //[self yuanjiaoImage];
    
}

-(void)createView
{
    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, CSWidth, 100)];
    bgView.backgroundColor = [UIColor colorWithRed:27/255. green:50/255. blue:70/255. alpha:1.0];
    [self.view addSubview:bgView];
    
    faceView = [[UIImageView alloc]initWithFrame:CGRectMake(10, (100-50)/2.0f, 50, 50)];
    [faceView setImage:[UIImage imageNamed:@"face"]];
    [bgView addSubview:faceView];
    
    CABasicAnimation * anmation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    anmation.fromValue = @(10);
    anmation.toValue = @(CSWidth+40);
    anmation.duration = 5;
    anmation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [faceView.layer addAnimation:anmation forKey:@"basic"];
    faceView.layer.position = CGPointMake(CSWidth+40, (100-50)/2.f);
}

-(void)createView2
{
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 100+20, CSWidth, 100)];
    view2.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view2];
    
    field = [[UITextField alloc]initWithFrame:CGRectMake((CSWidth-200)/2.0, 40, 200, 30)];
    field.text = @"hhhhhhh";
    field.secureTextEntry = YES;
    field.borderStyle = UITextBorderStyleRoundedRect;
    [view2 addSubview:field];
    
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view2Tap)];
    [view2 addGestureRecognizer:tap2];
    
    
}


-(void)view2Tap
{
    CAKeyframeAnimation * keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    keyAnimation.values = @[@0,@10,@-10,@10,@0];
    keyAnimation.keyTimes = @[@0,@(1/6.0),@(3/6.0),@(5/6.0),@1];
    keyAnimation.duration = 6.3;
    // keyAnimation.repeatCount = HUGE_VAL;
    keyAnimation.additive = YES;
    [field.layer addAnimation:keyAnimation forKey:@"shake"];
}


-(void)createView3
{
    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, CSWidth, CSWidth)];
    bgView.backgroundColor = [UIColor colorWithRed:27/255. green:50/255. blue:70/255. alpha:1.0];
    [self.view addSubview:bgView];
    
    faceView = [[UIImageView alloc]initWithFrame:CGRectMake((CSWidth-100)/2.0f, (CSWidth-100)/2.0f, 100, 100)];
    [faceView setImage:[UIImage imageNamed:@"face"]];
    [bgView addSubview:faceView];
    
    UIImageView * state = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 30, 30)];
    [state setImage:[UIImage imageNamed:@"face"]];
    [bgView addSubview:state];
    
    CGRect boundingRect = CGRectMake(20, 20, CSWidth-40, CSWidth-40);
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = CGPathCreateWithEllipseInRect(boundingRect, NULL);
    animation.duration = 4;
    //animation.additive = YES;
    animation.repeatCount = HUGE_VAL;
    animation.calculationMode = kCAAnimationPaced;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    [state.layer addAnimation:animation forKey:@"orbit"];
    
    
}


-(void)createView4
{
    faceView = [[UIImageView alloc]initWithFrame:CGRectMake((CSWidth-100)/2.0f, (400-100)/2.0f, 100, 100)];
    [faceView setImage:[UIImage imageNamed:@"face"]];
    [self.view addSubview:faceView];
    
    
    CABasicAnimation *zPosition = [CABasicAnimation animation];
    zPosition.keyPath = @"position.z";
    zPosition.fromValue = @-10;
    zPosition.toValue = @100;
    zPosition.duration = 1.2;
    
    CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.values = @[ @0, @0.5, @0 ];
    rotation.duration = 1.2;
//    rotation.timingFunctions = @[
//                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
//                                 ];
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animation];
    position.keyPath = @"position";
    position.values = @[
                        [NSValue valueWithCGPoint:CGPointZero],
                        [NSValue valueWithCGPoint:CGPointMake(110, -10)],
                        [NSValue valueWithCGPoint:CGPointZero]
                        ];
    position.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    position.additive = YES;
    position.duration = 1.2;
    
    CAAnimationGroup *groupAnimate = [[CAAnimationGroup alloc] init];
    groupAnimate.fillMode = kCAFillModeForwards;//@"both";
    groupAnimate.duration = 1.5;
    groupAnimate.repeatCount = HUGE_VAL;
    groupAnimate.beginTime = CACurrentMediaTime()+1;
    groupAnimate.animations = @[rotation,position];
    
    [faceView.layer addAnimation:groupAnimate forKey:@"shuffle"];
    
   // faceView.layer.zPosition = 1;
}


-(void)paowuxian
{
    UIImageView * blueqiu = [[UIImageView alloc]initWithFrame:CGRectMake(CSWidth-100, 200, 20, 20)];
    blueqiu.layer.cornerRadius = 10;
    blueqiu.layer.masksToBounds = YES;
    [blueqiu setImage:[UIImage imageNamed:@"face"]];
    [self.view addSubview:blueqiu];
    
    
    CGPoint start = CGPointMake(CSWidth-80, 200);
    CGPoint end = CGPointMake(100, 500);
    CGFloat height = 440;
    //初始化抛物线path
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat cpx = start.x-end.x;
    //CGFloat cpy = -height;
    CGPathMoveToPoint(path, NULL, start.x, start.y);
    CGPathAddQuadCurveToPoint(path, NULL, cpx, -30, end.x, end.y);
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path;
    animation.duration = 1.5;
    animation.repeatCount = 1000;
//    CFRelease(path);
    [blueqiu.layer addAnimation:animation forKey:@"position"];
}


//画五角星
-(void)wujiaoxing
{
    
    UIImageView * blueqiu = [[UIImageView alloc]initWithFrame:CGRectMake(CSWidth-100, 200, 20, 20)];
    blueqiu.layer.cornerRadius = 10;
    blueqiu.layer.masksToBounds = YES;
    [blueqiu setImage:[UIImage imageNamed:@"face"]];
    [self.view addSubview:blueqiu];

    
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    // Set the starting point of the shape.
    [aPath moveToPoint:CGPointMake(100.0, 0.0)];
    
    // Draw the lines
    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath addLineToPoint:CGPointMake(40.0, 140)];
    [aPath addLineToPoint:CGPointMake(0.0, 40.0)];
    [aPath closePath];//第五条线通过调用closePath方法得到的
    
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = aPath.CGPath;
    animation.duration = 2.5;
    animation.repeatCount = 1000;
    //    CFRelease(path);
    
    [blueqiu.layer addAnimation:animation forKey:@"position"];
    
}

//画个矩形哟
-(void)otherC
{
    
    UIImageView * blueqiu = [[UIImageView alloc]initWithFrame:CGRectMake(CSWidth-100, 200, 20, 20)];
    blueqiu.layer.cornerRadius = 10;
    blueqiu.layer.masksToBounds = YES;
    [blueqiu setImage:[UIImage imageNamed:@"face"]];
    [self.view addSubview:blueqiu];
    
    
    UIBezierPath* aPath = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, CSWidth-40, CSWidth-40)];
    
    aPath.lineWidth = 5.0;

//    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
//    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = aPath.CGPath;
    animation.duration = 2.5;
    animation.repeatCount = 1000;
    //    CFRelease(path);
    
    [blueqiu.layer addAnimation:animation forKey:@"position"];
    
}


-(void)huxing
{
    
    UIImageView * blueqiu = [[UIImageView alloc]initWithFrame:CGRectMake(CSWidth-100, 200, 20, 20)];
    blueqiu.layer.cornerRadius = 10;
    blueqiu.layer.masksToBounds = YES;
    [blueqiu setImage:[UIImage imageNamed:@"face"]];
    [self.view addSubview:blueqiu];
    
    
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(175, 175)
                                                         radius:75
                                                     startAngle:0
                                                       endAngle:210
                                                      clockwise:YES];
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = aPath.CGPath;
    animation.duration = 8;
    animation.repeatCount = 1;
    //    CFRelease(path);
    
    [blueqiu.layer addAnimation:animation forKey:@"position"];

}


-(void)sancihuxian
{
    UIImageView * blueqiu = [[UIImageView alloc]initWithFrame:CGRectMake(CSWidth-100, 200, 20, 20)];
    blueqiu.layer.cornerRadius = 10;
    blueqiu.layer.masksToBounds = YES;
    [blueqiu setImage:[UIImage imageNamed:@"face"]];
    [self.view addSubview:blueqiu];
    
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath moveToPoint:CGPointMake(20, 50)];
    
    [aPath addCurveToPoint:CGPointMake(200, 50) controlPoint1:CGPointMake(110, 0) controlPoint2:CGPointMake(110, 100)];

    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = aPath.CGPath;
    animation.duration = 1.5;
    animation.repeatCount = 1;
    //    CFRelease(path);
    
    [blueqiu.layer addAnimation:animation forKey:@"position"];
    blueqiu.layer.position = CGPointMake(200, 50);
}


-(void)yuanjiaoImage
{
    UIImageView * yimage = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    //[yimage setImage:[UIImage imageNamed:@"bj_boy"]];
    
    UIImage * image = [UIImage imageNamed:@"bj_boy"];
    
    
    [self.view addSubview:yimage];
    
    
    UIGraphicsBeginImageContextWithOptions(yimage.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [[UIBezierPath bezierPathWithRoundedRect:yimage.bounds cornerRadius:50] addClip];
    
    [image drawInRect:yimage.bounds];
    
    yimage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
   // [CSUtils drawRadiousImage:yimage image:image cornerRadius:50];
    
    
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
