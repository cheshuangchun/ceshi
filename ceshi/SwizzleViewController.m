//
//  SwizzleViewController.m
//  ceshi
//
//  Created by csc on 16/5/17.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "SwizzleViewController.h"
#import "UIImage+SwCategory.h"
#import "UIButton+ButtonSwizzle.h"
@interface SwizzleViewController ()
@property (strong, nonatomic)  UIImageView *faceImageView;
@property (strong, nonatomic)  UIImageView *vipImageView;
@end

@implementation SwizzleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.faceImageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 30, 30)];
    [self.faceImageView setImage:[UIImage imageNamed:@"face"]];
    [self.view addSubview:self.faceImageView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setBackgroundColor:[UIColor yellowColor]];
    btn.cs_acceptInterval = 3;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 200, 100, 100);
    [self.view addSubview:btn];
}

-(void)btnClick:(UIButton *)btn
{
    NSLog(@"格老子的");
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
