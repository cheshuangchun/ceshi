//
//  CircleAnimateViewController.m
//  ceshi
//
//  Created by csc on 16/5/18.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CircleAnimateViewController.h"
#import "CircleView.h"
@interface CircleAnimateViewController ()
@property (strong, nonatomic)CircleView * circleView;
@end

@implementation CircleAnimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.circleView = [CircleView circleViewWithFrame:CGRectMake(100, 100, 200, 200) lineWidth:2 lineColor:[UIColor orangeColor] clockWise:YES startAngle:90];
    [self.circleView buildView];
    
    [self.circleView strokeEnd:0.9 animated:NO duration:1.];
    [self.view addSubview:self.circleView];
    
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
