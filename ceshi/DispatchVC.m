//
//  DispatchVC.m
//  ceshi
//
//  Created by csc on 16/4/6.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "DispatchVC.h"

@implementation DispatchVC

-(void)viewDidLoad
{
    int data = 3;
    __block int mainData = 0;
    __block dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    
    dispatch_queue_t queue = dispatch_queue_create("dispatchStydy", NULL);
    dispatch_async(queue, ^{
        int sum = 0;
        for(NSInteger i =0;i<10;i++)
        {
            sum += data;
            NSLog(@"------->>>Sum:%tu",sum);
            sleep(2);
        }
        dispatch_semaphore_signal(sem);
    });
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    for(NSInteger j=0;j<5;j++)
    {
        mainData ++;
        NSLog(@"========>>MainData:%tu",mainData);
    }
    
    
    
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    for (int i = 0; i < 100; i++)
//    {
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        dispatch_group_async(group, queue, ^{
//            NSLog(@"-------------->%i",i);
//            sleep(1);
//            dispatch_semaphore_signal(semaphore);
//        });
//    }
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
   
    
}

@end
