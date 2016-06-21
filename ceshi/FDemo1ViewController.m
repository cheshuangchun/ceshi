//
//  FDemo1ViewController.m
//  ceshi
//
//  Created by csc on 16/5/27.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "FDemo1ViewController.h"

@interface FDemo1ViewController ()
{
    UIView * animateView;
}
@end

@implementation FDemo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self createView];
}

-(void)createView
{
    animateView = [[UIView alloc]initWithFrame:CGRectMake(120, 100, 100, 100)];
    animateView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:animateView];
    
    NSArray * arrTitle = @[@"缩放",@"弹性",@"平移"];
    for(NSInteger i = 0; i<3; i++)
    {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:[arrTitle objectAtIndex:i] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor purpleColor]];
        btn.frame = CGRectMake(10*(i+1)+60*i, 500, 60, 30);
        [self.view addSubview:btn];
        btn.tag = i+1000;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
}

-(void)btnClick:(UIButton *)btn
{
    NSInteger tag = btn.tag-1000;
    switch (tag) {
        case 0:
        {
            [self suofang];
        }
            break;
        case 1:
        {
            [self tanxing];
        }
            break;
        case 2:
        {
            [self pingyi];
        }
            break;
            
        default:
            break;
    }
}

-(void)suofang{
//    CAKeyframeAnimation * keyAnimate = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
//    keyAnimate.duration = .5;
//    keyAnimate.values = @[@(0.1),@(1.2),@(.9),@(1.),];
//    keyAnimate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    [animateView.layer addAnimation:keyAnimate forKey:nil];
    
    
    [animateView.layer setValue:@(0) forKeyPath:@"transform.scale"];
    [UIView animateWithDuration:.6 delay:0 usingSpringWithDamping:.3 initialSpringVelocity:.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [animateView.layer setValue:@(1.) forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        
    }];
    
    
    
}

-(void)tanxing{
    
    //Damping 弹性，0-1，越小弹性越大
    //Velocity 弹性复位速度
//    [animateView.layer setValue:@(0) forKeyPath:@"transform.translation.x"];
//    [UIView animateWithDuration:.6 delay:0 usingSpringWithDamping:.3 initialSpringVelocity:.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        [animateView.layer setValue:@(150) forKeyPath:@"transform.translation.x"];
//    } completion:^(BOOL finished) {
//        
//    }];
    
    [animateView.layer setValue:@(0) forKeyPath:@"transform.translation.y"];
    [UIView animateWithDuration:.6 delay:0 usingSpringWithDamping:.3 initialSpringVelocity:.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [animateView.layer setValue:@(150) forKeyPath:@"transform.translation.y"];
    } completion:^(BOOL finished) {
        
    }];
  
    
}
-(void)pingyi{
    
//    [animateView.layer setValue:@(0) forKeyPath:@"position.x"];
//    [UIView animateWithDuration:.5 animations:^{
//        [animateView.layer setValue:@(300) forKeyPath:@"position.x"];
//    }];
    
    
    CABasicAnimation * basicAnimate = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    basicAnimate.fromValue = @(-100);
    basicAnimate.toValue = @(260);
    basicAnimate.duration = .5;
    basicAnimate.fillMode = kCAFillModeForwards;
    basicAnimate.removedOnCompletion = NO;
    [animateView.layer addAnimation:basicAnimate forKey:nil];
    
    
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
