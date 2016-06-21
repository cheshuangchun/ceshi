//
//  BezierViewController.m
//  ceshi
//
//  Created by csc on 16/4/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "BezierViewController.h"
#import "BezierView.h"
@interface BezierViewController ()

@end

@implementation BezierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    BezierView * vv = [[BezierView alloc]initWithFrame:CGRectMake(0, 20, 375, 570)];
    [self.view addSubview:vv];
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
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
