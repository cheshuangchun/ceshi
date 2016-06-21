//
//  KvoTestVC.m
//  ceshi
//
//  Created by csc on 16/5/9.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "KvoTestVC.h"
#import "kvoArrayTestModel.h"
static NSInteger count = 0;

@interface KvoTestVC()
{
    
}
@property (strong, nonatomic) kvoArrayTestModel * testModel;
@end


@implementation KvoTestVC
-(void)viewDidLoad
{
    self.testModel = [[kvoArrayTestModel alloc]init];
    self.testModel.testArr = [[NSMutableArray alloc]init];
    [self.testModel.testArr addObject:@"1"];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(50, 100, 200, 100);
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"测试kvo" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    self.imgArray = [[NSMutableArray alloc]initWithCapacity:1];
    
    [self addObserver:self forKeyPath:@"titleStr" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:@"nihao"];
    [self addObserver:self forKeyPath:@"isOK" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:@"areyoufine"];
    [self.testModel addObserver:self forKeyPath:@"testArr" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:@"testArr"];
    
    
//    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(timeRotate:) userInfo:nil repeats:YES];
    
}

-(void)timeRotate:(NSTimer *)timer
{
    count++;
    self.titleStr = [NSString stringWithFormat:@"kvoCeshi%tu",count];
}


-(void)btnClick:(UIButton *)btn
{
//    self.titleStr = @"yoxi";
//    self.isOK = !self.isOK;
    
//    [self.imgArray addObject:@"1"];
    
    [self.testModel.testArr addObject:@"2"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if([keyPath isEqualToString:@"titleStr"])
    {
        NSLog(@"------->>>%@",self.titleStr);
    }else if ([keyPath isEqualToString:@"isOK"])
    {
        NSLog(@"我去我去我去啊");
    }
}


-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"titleStr" context:@"nihao"];
}



@end
