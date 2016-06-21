//
//  GifShowViewController.m
//  ceshi
//
//  Created by csc on 16/6/1.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "GifShowViewController.h"
#import "FLAnimatedImage.h"
@interface GifShowViewController ()
@property (strong, nonatomic) FLAnimatedImageView * imageViewq;
@end

@implementation GifShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.imageViewq = [[FLAnimatedImageView alloc] init];
    self.imageViewq.contentMode = UIViewContentModeScaleAspectFill;
    self.imageViewq.clipsToBounds = YES;
    [self.view addSubview:self.imageViewq];
    self.imageViewq.frame = CGRectMake(0.0, 120.0, self.view.bounds.size.width, 447.0);
    
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"wosai" withExtension:@"gif"];
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    FLAnimatedImage *animatedImage1 = [FLAnimatedImage animatedImageWithGIFData:data1];
    self.imageViewq.animatedImage = animatedImage1;
    
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
