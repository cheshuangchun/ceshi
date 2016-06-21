//
//  BerserViewController.m
//  ceshi
//
//  Created by csc on 16/4/19.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "BerserViewController.h"

@interface BerserViewController ()

@end

@implementation BerserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
   
   
    
//    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:50 startAngle:3 endAngle:18 clockwise:NO];
//    path.lineWidth = 1.5;
//    [path stroke];

    [self shiguanMask];
    
    
}


-(void)shiguanMask
{
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-50)/2.0,100, 50, 300)];
    view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view2];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view2.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(25, 25)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view2.bounds;
    maskLayer.path = maskPath.CGPath;
    view2.layer.mask = maskLayer;
    
    
    UIView * view3 = [[UIView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-50)/2.0,200, 50, 200)];
    view3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view3];
    
    maskPath = [UIBezierPath bezierPathWithRoundedRect:view3.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(25, 25)];
    maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view3.bounds;
    maskLayer.path = maskPath.CGPath;
    view3.layer.mask = maskLayer;
}


#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

- (void)addMask{
    UIButton * _maskButton = [[UIButton alloc] init];
    [_maskButton setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_maskButton setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [self.view addSubview:_maskButton];
    
    //create path
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    // MARK: circlePath
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH / 2, 200) radius:100 startAngle:0 endAngle:2*M_PI clockwise:NO]];
    
    // MARK: roundRectanglePath
   // [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 400, SCREEN_WIDTH - 22 * 20, 100) cornerRadius:15] bezierPathByReversingPath]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.path = path.CGPath;
    
    [_maskButton.layer setMask:shapeLayer];
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
