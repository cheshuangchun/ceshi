//
//  ImgRectViewController.m
//  ceshi
//
//  Created by csc on 16/5/24.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "ImgRectViewController.h"

@interface ImgRectViewController ()
{
    UIImageView * testImage;
    
    UIImageView * imageRect;
    
    UIImageView * anotherRectImage;
}
@end

@implementation ImgRectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    testImage = [[UIImageView alloc]initWithFrame:CGRectMake(50, 60, 100, 100)];
    [testImage setImage:[UIImage imageNamed:@"bj_boy"]];
    [self.view addSubview:testImage];
    
    
    imageRect = [[UIImageView alloc]initWithFrame:CGRectMake(170, 60, 100, 100)];
    [imageRect setImage:[UIImage imageNamed:@"bj_boy"]];
    [self.view addSubview:imageRect];
    imageRect.contentMode = UIViewContentModeScaleAspectFill;
    imageRect.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    imageRect.clipsToBounds = YES;
    
    
    anotherRectImage = [[UIImageView alloc]initWithFrame:CGRectMake(170, 180, 100, 100)];
    [anotherRectImage setImage:[UIImage imageNamed:@"bj_boy"]];
    [self.view addSubview:anotherRectImage];
    anotherRectImage.contentMode = UIViewContentModeScaleAspectFill;
    anotherRectImage.layer.masksToBounds = YES;
    
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
