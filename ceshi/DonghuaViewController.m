//
//  DonghuaViewController.m
//  ceshi
//
//  Created by csc on 16/4/26.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "DonghuaViewController.h"

@interface DonghuaViewController ()
{
    UIImageView * imgView;
}
@end

@implementation DonghuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    //[self createView];
    
    
    [self paowuxian];
    
}


-(void)paowuxian
{
    UIImageView *coin = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_coin_2"]];
    coin.frame = CGRectMake(50, 100, 30, 30);
    [self.view addSubview:coin];
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPoint endPoint = CGPointMake(CSWidth-100, CSHeight+10);
    
    CGPoint midPoint = CGPointMake(200, -50);
    
    CGPathMoveToPoint(path, NULL, 50, 100);
    CGPathAddQuadCurveToPoint(path, NULL, midPoint.x, midPoint.y, endPoint.x, endPoint.y);
    
    CAKeyframeAnimation * keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.path = path;
   
    keyAnimation.repeatCount = HUGE_VAL;
    
    
    CABasicAnimation * scalsAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scalsAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scalsAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)];
    scalsAnim.removedOnCompletion = YES;
    
    CAKeyframeAnimation * opacityAnimate = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimate.values = @[[NSNumber numberWithDouble:1.0],[NSNumber numberWithDouble:0.8],[NSNumber numberWithDouble:0.7],[NSNumber numberWithDouble:0.0]];
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.animations = @[keyAnimation,scalsAnim,opacityAnimate];
    group.duration = 2;
   // group.repeatCount = HUGE_VAL;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    coin.layer.position = endPoint;
    
    

    
    [coin.layer addAnimation:group forKey:@"paowuxian"];
    
}


/**
 *  弧线
 */
-(void)createView
{
    
    NSArray * arr = @[@"怕怕",@"啪啪啪",@"卡卡",@"油卡大"];
    ;
    NSInteger i = [arr indexOfObject:@"油卡大" inRange:NSMakeRange(1, 3)];
    
    //添加图片
    imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_con"]];
    imgView.frame = CGRectMake(100, 100, imgView.frame.size.width, imgView.frame.size.height);
    [self.view addSubview:imgView];

    
    //贝塞尔曲线路径
    UIBezierPath * kMovePath = [UIBezierPath bezierPath];
    [kMovePath moveToPoint:CGPointMake(100.0, 100.0)];
    //[kMovePath addCurveToPoint:CGPointMake(100, 500) controlPoint1:CGPointMake(150, 200) controlPoint2:CGPointMake(300,350)];
    
    [kMovePath addQuadCurveToPoint:CGPointMake(100, 500) controlPoint:CGPointMake(300, 300)];
    
    //关键帧动画
    CAKeyframeAnimation * keyAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnim.path = kMovePath.CGPath;
    keyAnim.removedOnCompletion = YES;
    //缩放动画
    CABasicAnimation * scalsAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scalsAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scalsAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)];
    scalsAnim.removedOnCompletion = YES;
    
    //透明动画
    CABasicAnimation * alphaAnim = [CABasicAnimation animationWithKeyPath:@"alpha"];
    alphaAnim.fromValue = [NSNumber numberWithFloat:1.0];
    alphaAnim.toValue = [NSNumber numberWithFloat:0.1];
    alphaAnim.removedOnCompletion = YES;
    
    //动画组
    CAAnimationGroup * animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:keyAnim,scalsAnim,alphaAnim, nil];
    animGroup.duration = 3;
    animGroup.repeatCount = 30;
    //animGroup.autoreverses = YES;
    
    [imgView.layer addAnimation:animGroup forKey:nil];
    

//        //贝塞尔曲线路径
//        UIBezierPath *movePath = [UIBezierPath bezierPath];
//        [movePath moveToPoint:CGPointMake(100.0, 100.0)];
//         [movePath addQuadCurveToPoint:CGPointMake(100, 500) controlPoint:CGPointMake(300, 300)];
//
//    
//    
//         //以下必须导入QuartzCore包//关键帧动画（位置）
//         CAKeyframeAnimation * posAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//         posAnim.path = movePath.CGPath;
//         posAnim.removedOnCompletion = YES;
//    
//         //缩放动画
//         CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
//         scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//         scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)];
//         scaleAnim.removedOnCompletion = YES;
//    
//         //透明动画
//         CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"alpha"];
//         opacityAnim.fromValue = [NSNumber numberWithFloat:1.0];
//         opacityAnim.toValue = [NSNumber numberWithFloat:0.1];
//         opacityAnim.removedOnCompletion = YES;
//    
//         //动画组
//         CAAnimationGroup *animGroup = [CAAnimationGroup animation];
//         animGroup.animations = [NSArray arrayWithObjects:posAnim,  nil];
//         animGroup.duration = 5;
//    //animGroup.autoreverses = YES;
//    
//         [imgView.layer addAnimation:animGroup forKey:nil];
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
