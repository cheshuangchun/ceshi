//
//  SortedViewController.m
//  ceshi
//
//  Created by csc on 16/4/26.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "SortedViewController.h"
#import "CSPeople.h"
@interface SortedViewController ()

@end

@implementation SortedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //NSSortDescriptor *carNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"car.name" ascending:YES];
    
    NSDictionary * dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"kaikai",@"fileName",@"1",@"fileSort",@"第二个",@"fileDesc",@"http://123.57.148.204:8080/com.ifp.ipartner/images/jforum/2016/4/26/12/5121559179254d63a62e9968f13b8571.jpg",@"filePath", nil];
    NSDictionary * dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"kaikai",@"fileName",@"0",@"fileSort",@"第二个",@"fileDesc",@"http://123.57.148.204:8080/com.ifp.ipartner/images/jforum/2016/4/26/12/5121559179254d63a62e9968f13b8571.jpg",@"filePath", nil];
    NSDictionary * dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"kaikai",@"fileName",@"2",@"fileSort",@"第二个",@"fileDesc",@"http://123.57.148.204:8080/com.ifp.ipartner/images/jforum/2016/4/26/12/5121559179254d63a62e9968f13b8571.jpg",@"filePath", nil];
    NSDictionary * dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"kaikai",@"fileName",@"4",@"fileSort",@"第二个",@"fileDesc",@"http://123.57.148.204:8080/com.ifp.ipartner/images/jforum/2016/4/26/12/5121559179254d63a62e9968f13b8571.jpg",@"filePath", nil];
    NSDictionary * dic5 = [NSDictionary dictionaryWithObjectsAndKeys:@"kaikai",@"fileName",@"3",@"fileSort",@"第二个",@"fileDesc",@"http://123.57.148.204:8080/com.ifp.ipartner/images/jforum/2016/4/26/12/5121559179254d63a62e9968f13b8571.jpg",@"filePath", nil];
    //NSArray * array = @[dic1,dic2,dic3,dic4,dic5];
    
    
    
//    NSArray *array = @[@{@"fileDesc":@"123",
//                        @"fileName":@"1",
//                        @"filePath":@"http://123.57.148.204:8080/com.ifp.ipartner/images/jforum/2016/4/26/12/78375b77089f452e95c2eed5bcfd36a9.jpg",
//                        @"fileSort":@"1"},@{@"fileDesc":@"123",
//                                            @"fileName":@"1",
//                                            @"filePath":@"http://123.57.148.204:8080/com.ifp.ipartner/images/jforum/2016/4/26/12/78375b77089f452e95c2eed5bcfd36a9.jpg",
//                                            @"fileSort":@"0"}];
//    
//    
//    
//    
//    
//    NSSortDescriptor *carNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"fileSort" ascending:YES];
//    NSArray *descriptorArray = [NSArray arrayWithObjects:carNameDesc, nil];
//    
//    NSArray *sortedArray = [array sortedArrayUsingDescriptors: descriptorArray];
    
    
    
    NSArray *arr1 = @[@{@"fileDesc":@"123",
                        @"fileName":@"1",
                        @"filePath":@"http://123.57.148.204:8080/com.ifp.ipartner/images/jforum/2016/4/26/12/78375b77089f452e95c2eed5bcfd36a9.jpg",
                        @"fileSort":@"1"},@{@"fileDesc":@"123",
                                            @"fileName":@"1",
                                            @"filePath":@"http://123.57.148.204:8080/com.ifp.ipartner/images/jforum/2016/4/26/12/78375b77089f452e95c2eed5bcfd36a9.jpg",
                                            @"fileSort":@"0"}];
    
    
    NSArray * arr2 = @[@{
        @"forumId": @"10",
        @"forumDesc": @"钓赛进行时钓赛进行时钓赛进行时钓赛进行时",
        @"categoriesId": @"3",
        @"forumName": @"钓赛进行时",
        @"forumSort": @"8"},
                          @{
                              @"forumId": @"11",
                              @"forumDesc": @"钓点对决钓点对决钓点对决钓点对决钓点对决钓点对决",
                              @"categoriesId": @"3",
                              @"forumName": @"钓点对决",
                              @"forumSort": @"9"
                          },
                          @{
                              @"forumId": @"12",
                              @"forumDesc": @"展会最前线展会最前线展会最前线展会最前线",
                              @"categoriesId": @"3",
                             @"forumName": @"展会最前线",
                              @"forumSort": @"10"
                          },
                          @{
                              @"forumId": @"13",
                              @"forumDesc": @"钓鱼趣闻钓鱼趣闻钓鱼趣闻钓鱼趣闻钓鱼趣闻钓鱼趣闻",
                              @"categoriesId": @"3",
                              @"forumName": @"钓鱼趣闻",
                              @"forumSort": @"11"
                          },
                          @{
                              @"forumId": @"14",
                              @"forumDesc": @"黑坑江湖黑坑江湖黑坑江湖黑坑江湖黑坑江湖黑坑江湖",
                              @"categoriesId": @"3",
                              @"forumName": @"黑坑江湖",
                             @"forumSort": @"12"
                          },
                          @{
                              @"forumId": @"15",
                              @"forumDesc": @"渔获秀渔获秀渔获秀渔获秀渔获秀渔获秀渔获秀",
                              @"categoriesId": @"3",
                              @"forumName": @"渔获秀",
                              @"forumSort": @"13"
                          },
                          @{
                              @"forumId": @"16",
                              @"forumDesc": @"我爱路亚我爱路亚我爱路亚我爱路亚我爱路亚我爱路亚我爱路亚",
                              @"categoriesId": @"3",
                              @"forumName": @"我爱路亚",
                              @"forumSort": @"14"
                          },
                          @{
                              @"forumId": @"17",
                              @"forumDesc": @"野钓江湖野钓江湖野钓江湖野钓江湖野钓江湖野钓江湖",
                              @"categoriesId": @"3",
                              @"forumName": @"野钓江湖",
                              @"forumSort": @"15"
                          },
                          @{
                              @"forumId": @"3",
                              @"forumDesc": @"冬季钓鱼冬季钓鱼冬季钓鱼冬季钓鱼冬季钓鱼",
                              @"categoriesId": @"3",
                              @"forumName": @"冬季钓鱼",
                              @"forumSort": @"1"
                          },
                          @{
                              @"forumId": @"4",
                              @"forumDesc": @"精选精选精选精选",
                              @"categoriesId": @"3",
                              @"forumName": @"精选",
                              @"forumSort": @"2"
                          },
                          @{
                              @"forumId": @"5",
                              @"forumDesc": @"钓具大明星钓具大明星钓具大明星钓具大明星钓具大明星钓具大明星",
                              @"categoriesId": @"3",
                              @"forumName": @"钓具大明星",
                              @"forumSort": @"3"
                          },
                          @{
                              @"forumId": @"6",
                              @"forumDesc": @"游钓攻略游钓攻略游钓攻略游钓攻略游钓攻略游钓攻略游钓攻略游钓攻略游钓攻略",
                              @"categoriesId": @"3",
                              @"forumName": @"游钓攻略",
                              @"forumSort": @"4"
                          },
                          @{
                              @"forumId": @"7",
                              @"forumDesc": @"精彩活动精彩活动精彩活动精彩活动精彩活动精彩活动精彩活动精彩活动精彩活动精彩活动精彩活动精彩活动精彩活动",
                              @"categoriesId": @"3",
                              @"forumName": @"精彩活动",
                              @"forumSort": @"5"
                          },
                          @{
                              @"forumId": @"8",
                              @"forumDesc": @"钓技达人钓技达人钓技达人钓技达人钓技达人钓技达人",
                              @"categoriesId": @"3",
                             @"forumName": @"钓技达人",
                             @"forumSort": @"6"
                          },
                          @{
                             @"forumId": @"9",
                              @"forumDesc": @"海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家海钓玩家",
                              @"categoriesId": @"3",
                              @"forumName": @"海钓玩家",
                              @"forumSort": @"7"
                          }];
    
    
    NSMutableArray * arr3 = [[NSMutableArray alloc] init];
    for(NSInteger i = 0; i<arr2.count;i++)
    {
        @autoreleasepool {
            NSDictionary * dic = arr2[i];
            CSPeople * people = [[CSPeople alloc]initWithDic:dic];
            [arr3 addObject:people];
        }
    }

//    NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:@"forumSort" ascending:YES];
//    NSArray *descriptorArray = [NSArray arrayWithObjects:sorter, nil];
//    
//   NSArray *sortedArray = [arr3 sortedArrayUsingDescriptors:descriptorArray];
    
//@selector(compare:)
    
    
    NSSortDescriptor * sortC = [NSSortDescriptor sortDescriptorWithKey:@"forumSort" ascending:YES];
    [arr3 sortUsingDescriptors:[NSArray arrayWithObject:sortC]];
    
//  NSSortDescriptor * sort = [NSSortDescriptor sortDescriptorWithKey:@"forumSort" ascending:YES];
//  [arr3 sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    
//  NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"forumSort" ascending:YES selector:@selector(compare:)];
//  [arr3 sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    
    for(NSInteger i = 0; i<arr3.count; i++)
    {
        CSPeople * people = [arr3 objectAtIndex:i];
        NSLog(@"---------->>>%tu",people.forumSort);
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
