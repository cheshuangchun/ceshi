//
//  CeshiScrollViewController.m
//  ceshi
//
//  Created by csc on 16/5/11.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CeshiScrollViewController.h"

@interface CeshiScrollViewController ()<UIScrollViewDelegate>
{
    UIScrollView * scrollVieww;
    NSArray * imgArr;
}
@end

@implementation CeshiScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    imgArr = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    
    scrollVieww = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CSWidth, 300)];
    scrollVieww.delegate = self;
    scrollVieww.showsHorizontalScrollIndicator = NO;
    scrollVieww.showsVerticalScrollIndicator = NO;
    scrollVieww.pagingEnabled = YES;
    [self.view addSubview:scrollVieww];
    scrollVieww.contentSize = CGSizeMake(CSWidth*(imgArr.count+2), 300);
    [scrollVieww setContentOffset:CGPointMake(CSWidth, 0)];
    
    UIImageView * lastImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CSWidth, 300)];
    [lastImage setImage:[UIImage imageNamed:[imgArr lastObject]]];
    [scrollVieww addSubview:lastImage];
    
    for(NSInteger i = 0; i<imgArr.count; i++)
    {
        UIImageView * lastImage = [[UIImageView alloc]initWithFrame:CGRectMake(CSWidth*(i+1), 0, CSWidth, 300)];
        [lastImage setImage:[UIImage imageNamed:[imgArr objectAtIndex:i]]];
        [scrollVieww addSubview:lastImage];
    }
    
    UIImageView * firstImg = [[UIImageView alloc]initWithFrame:CGRectMake(CSWidth*(imgArr.count+1), 0, CSWidth, 300)];
    [firstImg setImage:[UIImage imageNamed:[imgArr firstObject]]];
    [scrollVieww addSubview:firstImg];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.x >= CSWidth*(imgArr.count+1))
    {
        scrollVieww.contentOffset = CGPointMake(CSWidth, 0);
    }else if (scrollVieww.contentOffset.x<0)
    {
        scrollVieww.contentOffset = CGPointMake(CSWidth*imgArr.count, 0);
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
