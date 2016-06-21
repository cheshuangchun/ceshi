//
//  ScrollImageViewController.m
//  ceshi
//
//  Created by csc on 16/5/10.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "ScrollImageViewController.h"
#import "UIImageView+ImageCategory.h"
static NSInteger imgHeight = 100;
@interface ScrollImageViewController ()<UIScrollViewDelegate>
{
    UIScrollView * runScroll;
    NSArray * imgArr;
}
@end

@implementation ScrollImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    imgArr = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    
    runScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CSWidth, imgHeight)];
    runScroll.pagingEnabled = YES;
    runScroll.delegate = self;
    runScroll.showsHorizontalScrollIndicator = NO;
    runScroll.showsVerticalScrollIndicator = NO;
    [self.view addSubview:runScroll];
    runScroll.contentSize = CGSizeMake(CSWidth*(imgArr.count+2), imgHeight);
    runScroll.contentOffset = CGPointMake(CSWidth, 0);
    
    UIImageView * lastImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CSWidth, imgHeight)];
    [lastImage setImage:[UIImage imageNamed:[imgArr lastObject]]];
    lastImage.clipsToBounds = YES;
    [runScroll addSubview:lastImage];
    
    for(NSInteger i =0;i<imgArr.count; i++)
    {
        UIImageView * sImage = [[UIImageView alloc]initWithFrame:CGRectMake(CSWidth*(i+1), 0, CSWidth, imgHeight)];
        sImage.clipsToBounds = YES;
        [sImage setImage:[UIImage imageNamed:[imgArr objectAtIndex:i]]];
        [runScroll addSubview:sImage];
    }
    
    UIImageView * firstImg = [[UIImageView alloc]initWithFrame:CGRectMake(CSWidth*(imgArr.count+1), 0, CSWidth, imgHeight)];
    firstImg.clipsToBounds = YES;
    [firstImg setImage:[UIImage imageNamed:[imgArr firstObject]]];
    [runScroll addSubview:firstImg];
    
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    if (scrollView.contentOffset.x >= (imgArr.count+1)*scrollView.frame.size.width) {
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width, 0)];
        
        
    }else if (scrollView.contentOffset.x <= 0)
    {
        
        [scrollView setContentOffset:CGPointMake(imgArr.count*scrollView.frame.size.width, 0)];
        
    }
//    
//    for(UIImageView * subView in scrollView.subviews)
//    {
//        if([subView isKindOfClass:[UIImageView class]])
//        {
//            [subView imageOffsetValue:0.7];
//        }
//    }
    
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
