//
//  RunloopViewController.m
//  ceshi
//
//  Created by csc on 16/4/7.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "RunloopViewController.h"
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
@interface RunloopViewController ()<UIScrollViewDelegate>
{
    UIScrollView * scrollView;
}
@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    
    
    
    // Do any additional setup after loading the view.
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(0, SCREEN_HEIGHT*3);
    [self.view addSubview:scrollView];
    
    
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                                      target:self
                                                                    selector:@selector(printMessage:)
                                                                    userInfo:nil
                                                                     repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

-(void)printMessage:(NSTimer *) ktimer
{
    NSLog(@"我在打印着-------->%@",[NSDate date]);
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
