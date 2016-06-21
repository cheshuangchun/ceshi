//
//  LeidaViewController.m
//  ceshi
//
//  Created by csc on 16/4/27.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "LeidaViewController.h"
#import "Leida.h"
#import "kukuView.h"
@interface LeidaViewController ()
{
    Leida * leida;
    kukuView * kuView;
}
@end

@implementation LeidaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    leida = [[Leida alloc]initWithFrame:CGRectMake(0, 100,CSWidth , CSWidth)];
    [self.view addSubview:leida];
    
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
