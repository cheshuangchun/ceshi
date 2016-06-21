//
//  MSG_SendViewController.m
//  ceshi
//
//  Created by csc on 16/6/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "MSG_SendViewController.h"
#import "XManModel.h"
@interface MSG_SendViewController ()

@end

@implementation MSG_SendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray * fruites = @[@"苹果",@"香蕉",@"西瓜",@"樱桃",@"甜瓜"];
    NSDictionary * kDic = [NSDictionary dictionaryWithObjectsAndKeys:fruites,@"fruits",@"车大人",@"name", nil];
    
    XManModel *model = [[XManModel alloc] initWithDictionary:kDic];
    
    NSLog(@"--->>>%@ : ---->>%@",model.name,model.fruits);
    
    NSAssert(self, @"View must not be nil.");
    
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
