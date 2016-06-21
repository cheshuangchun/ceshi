//
//  CTLineRefDemoViewController.m
//  ceshi
//
//  Created by csc on 16/5/11.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CTLineRefDemoViewController.h"
#import "CTLineRefView.h"
@interface CTLineRefDemoViewController ()

@end

@implementation CTLineRefDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self demoTest];
    
    
}

-(void)demoTest
{
    CTLineRefView * lineView = [[CTLineRefView alloc]initWithFrame:CGRectMake(0, 20, CSWidth, CSHeight)];
    [self.view addSubview:lineView];
    
    
    
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
