//
//  DeepShallowViewController.m
//  ceshi
//
//  Created by csc on 16/6/14.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "DeepShallowViewController.h"

@interface DeepShallowViewController ()

@end

@implementation DeepShallowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#warning eg1
    NSMutableArray *element = [NSMutableArray arrayWithObject:@"小孩"];
    NSMutableArray *array = [NSMutableArray arrayWithObject:@"小孩"];
    
    NSLog(@"arr0---------->>>%@",array);
    
    id mutableCopyArray = [array mutableCopy];
    [mutableCopyArray addObject:@"搭讪"];
    
    NSLog(@"arr1----------->>>%@",array);
    
#warning eg2
    
    NSMutableString *string = [NSMutableString stringWithString:@"汉斯哈哈哈"];
    
    // 产生新对象
    NSString *copyString = [string copy];
    // 产生新对象
    id mutableCopyString = [string mutableCopy];
    
    
    NSLog(@"str1-------->>>%@",string);
    
    [mutableCopyString appendString:@"你是猪吗"];
    NSLog(@"str2-------->>>%@",string);

    
    
    
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
