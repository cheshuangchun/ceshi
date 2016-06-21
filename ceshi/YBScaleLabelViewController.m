//
//  YBScaleLabelViewController.m
//  ceshi
//
//  Created by csc on 16/5/20.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "YBScaleLabelViewController.h"

@interface YBScaleLabelViewController ()
{
    UILabel * backLabel;
    UILabel * colorLabel;
}
@end

@implementation YBScaleLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view.
    [self createView];
}

-(void)createView
{
    backLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 150, 30)];
    colorLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 150, 30)];
    
    backLabel.text = @"CheShuangchun";
    colorLabel.text = @"CheShuangchun";
    
    backLabel.alpha = 0.;
    colorLabel.alpha = 0.;
    
    backLabel.textAlignment = NSTextAlignmentCenter;
    colorLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:backLabel];
    [self.view addSubview:colorLabel];
    
    backLabel.textColor = [UIColor blackColor];
    colorLabel.textColor = [UIColor cyanColor];
    
    backLabel.transform = CGAffineTransformMakeScale(0.3, 0.3);
    colorLabel.transform = CGAffineTransformMakeScale(0.3, 0.3);
    
    [self performSelector:@selector(startAnimationsD) withObject:nil afterDelay:2];
}


-(void)startAnimationsD
{
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        backLabel.alpha = 1;
        backLabel.transform = CGAffineTransformMakeScale(1, 1);
        
        colorLabel.alpha = 1;
        colorLabel.transform = CGAffineTransformMakeScale(1, 1);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            colorLabel.alpha = 0;
            colorLabel.transform = CGAffineTransformMakeScale(2, 2);
            
        } completion:^(BOOL finished) {
            
        }];
    }];
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
