//
//  SBSBViewController.m
//  ceshi
//
//  Created by csc on 16/6/14.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "SBSBViewController.h"
#import "CSCAdView.h"
@interface SBSBViewController ()
{
    CSCAdView * adView;
}
@end

@implementation SBSBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    adView = [[CSCAdView alloc]initWithFrame:CGRectMake(0, 20, CSWidth, 200)];
    
    NSArray * picArr = @[@"TabBar1",@"TabBar2",@"TabBar3",@"TabBar4"];
    
    [adView.imgArray addObjectsFromArray:picArr];
    [adView updateScrollView];
    [self.view addSubview:adView];
    
    
    
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
