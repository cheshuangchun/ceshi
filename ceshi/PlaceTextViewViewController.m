//
//  PlaceTextViewViewController.m
//  ceshi
//
//  Created by csc on 16/5/6.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "PlaceTextViewViewController.h"
#import "YoloTx.h"
@interface PlaceTextViewViewController ()

@end

@implementation PlaceTextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    YoloTx * textView = [[YoloTx alloc]initWithFrame:CGRectMake(10, 10, 300, 300)];
    textView.backgroundColor = [UIColor orangeColor];
    textView.placeholder = @"请输入王尼玛";
    textView.pColor = [UIColor lightGrayColor];
    textView.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:textView];
    
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
