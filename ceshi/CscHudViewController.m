//
//  CscHudViewController.m
//  ceshi
//
//  Created by csc on 16/6/13.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CscHudViewController.h"
#import "CSCHUD.h"
@interface CscHudViewController ()
{
    CSCHUD * hud;
    UIButton * btn;
}
@end

@implementation CscHudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
//    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn setTitle:@"BUTTON" forState:UIControlStateNormal];
//    [self.view addSubview:btn];
//    btn.frame = CGRectMake(50, 50, 100, 100);
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    [self createBtn];
}


-(void)createBtn
{
    //创建UIButton，不需要设置frame
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [btn setTitle:@"mgen" forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:btn];
    
    
    //禁止自动转换AutoresizingMask
    
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    
    //居中
    
    [self.view addConstraint:[NSLayoutConstraint
                              
                              constraintWithItem:btn
                              
                              attribute:NSLayoutAttributeLeading
                              
                              relatedBy:NSLayoutRelationEqual
                              
                              toItem:self.view
                              
                              attribute:NSLayoutAttributeLeading
                              
                              multiplier:1
                              
                              constant:10]];
    
    
    [self.view addConstraint:[NSLayoutConstraint
                              
                              constraintWithItem:btn
                              
                              attribute:NSLayoutAttributeTrailing
                              
                              relatedBy:NSLayoutRelationEqual
                              
                              toItem:self.view
                              
                              attribute:NSLayoutAttributeTrailing
                              
                              multiplier:1
                              
                              constant:-10]];
    
    
    
    //距离底部20单位
    
    //注意NSLayoutConstraint创建的constant是加在toItem参数的，所以需要-20。
    
    [self.view addConstraint:[NSLayoutConstraint
                              
                              constraintWithItem:btn
                              
                              attribute:NSLayoutAttributeTop
                              
                              relatedBy:NSLayoutRelationEqual
                              
                              toItem:self.view
                              
                              attribute:NSLayoutAttributeTop
                              
                              multiplier:1
                              
                              constant:-20]];
    
    
    
    //定义高度是父View的三分之一
    
    [self.view addConstraint:[NSLayoutConstraint
                              
                              constraintWithItem:btn
                              
                              attribute:NSLayoutAttributeHeight
                              
                              relatedBy:NSLayoutRelationEqual
                              
                              toItem:self.view
                              
                              attribute:NSLayoutAttributeHeight
                              
                              multiplier:0.3
                              
                              constant:0]];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}


-(void)btnClick{
    hud = [[CSCHUD alloc]initWithView:self.view];
    hud.content = @"您拨打的电话正在通话中，请稍候在拨";
    hud.textOnly = YES;
    [self.view addSubview:hud];
    
    [hud show:YES];
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
