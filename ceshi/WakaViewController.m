//
//  WakaViewController.m
//  ceshi
//
//  Created by csc on 16/5/4.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "WakaViewController.h"

@interface WakaViewController ()
{
    UIButton * homeBtn;
    NSMutableArray * buttonArr;
}
@end

@implementation WakaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    buttonArr = [[NSMutableArray alloc]initWithCapacity:1];
    // Do any additional setup after loading the view.
    [self animationStyle];
    
    
}

-(void)animationStyle
{
    [self createBtn:@[@"1",@"2",@"3",@"4",@"5"]];
    //[self createBtn:@[@"1"/*,@"2"*/]];
    
    homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [homeBtn setImage:[UIImage imageNamed:@"chooser-button-tab"] forState:UIControlStateNormal];
    homeBtn.frame = CGRectMake(300, 400, 38, 38);
    [homeBtn addTarget:self action:@selector(startAnimation1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:homeBtn];
    NSLog(@"初始----%@",[homeBtn.layer valueForKeyPath:@"position"]);
}

-(void)startAnimation1
{
    homeBtn.selected = !homeBtn.selected;
    if (homeBtn.selected) {
        [self showBtn];
    }else{
        [self hiddenBtn];
    }
    
}

-(void)showBtn
{
    
    CABasicAnimation * homeAnimate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    homeAnimate.fillMode = kCAFillModeForwards;
    homeAnimate.removedOnCompletion = NO;
    homeAnimate.fromValue = @(0.0);
    homeAnimate.toValue = @(-M_PI_4);
    
    [homeBtn.layer addAnimation:homeAnimate forKey:@"homeKey"];
    
    
    for(NSInteger i=0 ; i<buttonArr.count;i++)
    {
        UIButton * btn = buttonArr[i];
        
        btn.transform = CGAffineTransformMakeScale(0.01, 0.01);
        
        
        CGPoint startPoint = CGPointMake(319, 400);
        CGPoint endPoint = CGPointMake(319, 400-60*(buttonArr.count-i));
        
        CABasicAnimation * startAnimate = [CABasicAnimation animationWithKeyPath:@"position"];
        startAnimate.fillMode = kCAFillModeForwards;
        startAnimate.removedOnCompletion = NO;
       // startAnimate.beginTime = CACurrentMediaTime()+i*0.1;
        startAnimate.fromValue = [NSValue valueWithCGPoint:startPoint];
        startAnimate.toValue = [NSValue valueWithCGPoint:endPoint];
        //startAnimate.duration = .3;
        
        btn.layer.position = endPoint;
        
        CABasicAnimation * scaleAnimate = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimate.fillMode = kCAFillModeForwards;
        scaleAnimate.removedOnCompletion= NO;
        //scaleAnimate.beginTime = CACurrentMediaTime()+i*0.1;
        scaleAnimate.fromValue = @(0);
        scaleAnimate.toValue = @(1);
        //scaleAnimate.duration = .3;
        
        CAAnimationGroup * groupAnimate = [CAAnimationGroup animation];
        groupAnimate.duration = .3;
        groupAnimate.animations = @[startAnimate,scaleAnimate];
        groupAnimate.beginTime = CACurrentMediaTime()+i*0.05;
        groupAnimate.fillMode = kCAFillModeForwards;
        groupAnimate.removedOnCompletion = NO;
        
        [btn.layer addAnimation:groupAnimate forKey:@"yoxi"];

        
        //btn.transform = CGAffineTransformMakeScale(0.01, 0.01);
    }
}

-(void)hiddenBtn
{
    
    CABasicAnimation * homeAnimate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    homeAnimate.fillMode = kCAFillModeForwards;
    homeAnimate.removedOnCompletion = NO;
    homeAnimate.fromValue = @(-M_PI_4);
    homeAnimate.toValue = @(0.0);
    
    [homeBtn.layer addAnimation:homeAnimate forKey:@"homeKey"];
    
    
    for(NSInteger i= buttonArr.count-1 ; i>=0;i--)
    {
        UIButton * btn = buttonArr[i];
        
        btn.transform = CGAffineTransformMakeScale(1.f, 1.f);
        
        CGPoint startPoint = CGPointFromString([NSString stringWithFormat:@"%@",[btn.layer valueForKeyPath:@"position"]]);
        CGPoint endPoint =CGPointMake(319, 419);
        CABasicAnimation * startAnimate = [CABasicAnimation animationWithKeyPath:@"position"];
        startAnimate.fillMode = kCAFillModeForwards;
        startAnimate.removedOnCompletion = NO;
        //startAnimate.beginTime = CACurrentMediaTime()+(buttonArr.count-i)*0.1;
        startAnimate.fromValue = [NSValue valueWithCGPoint:startPoint];
        startAnimate.toValue = [NSValue valueWithCGPoint:endPoint];
        //startAnimate.duration = .3;
        
        
        CABasicAnimation * scaleAnimate = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimate.fillMode = kCAFillModeForwards;
        scaleAnimate.removedOnCompletion= NO;
        //scaleAnimate.beginTime = CACurrentMediaTime()+(buttonArr.count-i)*0.1;;
        scaleAnimate.fromValue = @(1);
        scaleAnimate.toValue = @(0);
        //scaleAnimate.duration = .3;
        
        CAAnimationGroup * groupAnimate = [CAAnimationGroup animation];
        groupAnimate.duration = .3;
        groupAnimate.animations = @[startAnimate,scaleAnimate];
        groupAnimate.beginTime = CACurrentMediaTime()+(buttonArr.count-i)*0.05;;;
        groupAnimate.fillMode = kCAFillModeForwards;
        groupAnimate.removedOnCompletion = NO;
        
        [btn.layer addAnimation:groupAnimate forKey:@"yoxi"];
        
        
//        [btn.layer addAnimation:startAnimate forKey:@"goods"];
//        [btn.layer addAnimation:scaleAnimate forKey:@"scaleAnimate"];
        
    }
}


-(void)createBtn:(NSArray *)btnImageName{
    
    for (int i = 0 ; i < btnImageName.count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(300, 400, 38, 38);
        btn.backgroundColor=[UIColor lightGrayColor];
        btn.layer.cornerRadius=19;
        [btn setTitle:btnImageName[i] forState:UIControlStateNormal];
        btn.tag=i+1;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        [buttonArr addObject:btn];
    }
    
}

-(void)clickBtn:(UIButton *)btn{
    NSLog(@"你妹");
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
