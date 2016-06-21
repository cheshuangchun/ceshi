//
//  SemaphoreViewController.m
//  ceshi
//
//  Created by csc on 16/4/15.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "SemaphoreViewController.h"

@interface SemaphoreViewController ()

@end

@implementation SemaphoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    NSLog(@"开始");
    
    [self semaphoreDemo2];
    
    UIScrollView * Scroll = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    Scroll.contentSize = CGSizeMake(0, 2000);
    [self.view addSubview:Scroll];
    
}

-(void)semaphoreDemo1
{
    int data = 3;
    __block int mainData = 0;
    __block dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    dispatch_queue_t queue = dispatch_queue_create("blockStudy", NULL);
    dispatch_async(queue, ^{
        int sum = 0;
        for(int i= 0;i<5000;i++)
        {
            sum += data;
            NSLog(@"sum------->>>>%tu",sum);
        }
        
        dispatch_semaphore_signal(sem);
    });
    
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    for(int j = 0; j<5;j++)
    {
        mainData++;
        NSLog(@"mainData-->>%tu",mainData);
    }
}



-(void)semaphoreDemo2
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(50);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 100; i++)
    {
        dispatch_group_async(group, queue, ^{
            NSLog(@"%i",i);
            sleep(2);
            dispatch_semaphore_signal(semaphore);
        });
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    }
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
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
