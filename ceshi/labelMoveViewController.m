//
//  labelMoveViewController.m
//  ceshi
//
//  Created by csc on 16/3/23.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "labelMoveViewController.h"
#define IOS_SystemVersion  [[[UIDevice currentDevice]systemVersion]floatValue]
#define WIDThH  [[UIScreen mainScreen] bounds].size.width
#define HEIGHT  [[UIScreen mainScreen] bounds].size.height

#define kBulldesFont [UIFont systemFontOfSize:15]
@interface labelMoveViewController ()
{
    UILabel * countlbl;
    NSTimer * timer;
    CGSize  sSize;
    NSInteger num;
    
    UILabel * label2;
    NSInteger num2;
    CGSize size2;
}
@end

@implementation labelMoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 60, WIDThH, 45);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];

    
    // Do any additional setup after loading the view.
    countlbl = [[UILabel alloc]init];
    countlbl.font = kBulldesFont;
    countlbl.text = @"亲爱的车大人你好啊,哇哈哈哈哈哈";
    sSize = [countlbl.text sizeWithAttributes:@{NSFontAttributeName:kBulldesFont}];
    countlbl.frame = CGRectMake(WIDThH, 0, sSize.width, 45);
    
    [view addSubview:countlbl];
 
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(labelmove:) userInfo:nil repeats:YES];
    
    
    //第二个马灯
    
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 300, CSWidth, 150)];
    view2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view2];
    
    
    label2 = [[UILabel alloc]init];
    label2.text = [NSString stringWithFormat:@"未来的出路在哪里呢，且行且珍惜"];
    label2.font = kBulldesFont;
    size2 = [label2.text sizeWithAttributes:@{NSFontAttributeName:kBulldesFont}];
    label2.frame = CGRectMake(CSWidth, 0, size2.width, 50);
    
    
    [view2 addSubview:label2];
    
    NSTimer * timer2 =  [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(labelDouble:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:timer2 forMode:NSRunLoopCommonModes];
    
    
    
}

-(void)labelDouble:(NSTimer *)timers
{
    if(num2< size2.width+CSWidth)
    {
        num2++;
        label2.frame = CGRectMake(CSWidth-num2, 0, size2.width, 50);
    }else
    {
        num2 = 0;
        label2.frame = CGRectMake(CSWidth, 0, size2.width, 50);
    }
}














-(void)labelmove:(NSTimer *)stimer
{
    if(num*1 < sSize.width+WIDThH)
    {
        num++;
        countlbl.frame = CGRectMake(WIDThH-num*1, 0, sSize.width, 45);
    }else
    {
        num = 0;
        countlbl.frame = CGRectMake(WIDThH, 0, sSize.width, 45);
    }
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
