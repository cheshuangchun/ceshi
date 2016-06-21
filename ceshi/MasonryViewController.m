//
//  MasonryViewController.m
//  ceshi
//
//  Created by csc on 16/5/17.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "MasonryViewController.h"
@interface MasonryViewController ()
{
    
    UIView * view2;
    UIScrollView  * mScrollView;
}
@property (assign, nonatomic) BOOL isExpand;;
@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self exp1];
    
    
    //[self wuliwuli];
    
    
  //  [self makeScroll];
    
}
-(void)makeScroll
{
    mScrollView = [[UIScrollView alloc]init];
    mScrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:mScrollView];
    
    
    UIView * view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor cyanColor];
    [mScrollView addSubview:view1];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(CSHeight-100);
    }];
    
    
    UIView * view3 = [[UIView alloc]init];
    view3.backgroundColor = [UIColor purpleColor];
    [mScrollView addSubview:view3];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(view1.mas_bottom).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(CSHeight-100);
    }];
    
    
    [mScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
        make.bottom.mas_equalTo(view3.mas_bottom).offset(20);
    }];
    
    
    
    
}

-(void)exp1
{
    UIView * view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view1];
    
    view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view2];
    
    
    //[@[view1, view2] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:120 leadSpacing:50 tailSpacing:50];

    [@[view1, view2] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:50 leadSpacing:50 tailSpacing:50];
    
    
    //[@[view2,view1] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:100 leadSpacing:50 tailSpacing:50];
    [@[view2,view1] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];

    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tagGestrue)];
    [view2 addGestureRecognizer:tap];

    
    
//    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn1 setTitle:@"btn1" forState:UIControlStateNormal];
//    btn1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:btn1];
//    
//    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn2 setTitle:@"btn2" forState:UIControlStateNormal];
//     btn2.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:btn2];
//    
//    
//    [@[btn1, btn2] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
//                            withFixedItemLength:70
//                                    leadSpacing:15
//                                    tailSpacing:15];
//    
//    [@[btn1, btn2] mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(100);
//    }];
    
//    [@[btn2,btn1] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:100 leadSpacing:15 tailSpacing:15];
//    [@[btn2,btn1] mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(100);
//    }];
    
    
    
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn1 setTitle:@"按钮1" forState:UIControlStateNormal];
//    btn1.layer.borderColor = UIColor.greenColor.CGColor;
//    btn1.layer.borderWidth = 3;
//    [self.view addSubview:btn1];
//    
//    
//    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn2 setTitle:@"按钮2" forState:UIControlStateNormal];
//    btn2.layer.borderColor = UIColor.greenColor.CGColor;
//    btn2.layer.borderWidth = 3;
//    [self.view addSubview:btn2];
//    
//
//    
//    
//    [@[btn1, btn2] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
//                                       withFixedItemLength:70
//                                               leadSpacing:15
//                                               tailSpacing:15];
//    
//    [@[btn1, btn2] mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(100);
//    }];
    
    
    
    
}


-(void)wuliwuli
{
    UIView * k1 = [[UIView alloc]init];
    k1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:k1];
    
    UIView * k2 = [[UIView alloc]init];
    k2.backgroundColor = [UIColor redColor];
    [self.view addSubview:k2];
    
    UIView * k3 = [[UIView alloc]init];
    k3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:k3];
    
    [k1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(k2.mas_left).offset(-10);
        make.height.mas_equalTo(180);
        make.width.mas_equalTo(@[k2,k3]);
    }];
    
    
    [k2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(k1.mas_right).offset(10);
        make.right.mas_equalTo(k3.mas_left).offset(-10);
        make.height.mas_equalTo(180);
    }];
    
    [k3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(k2.mas_right).offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(180);
    }];
    
}


-(void)tagGestrue
{
    self.isExpand = !self.isExpand;
    
    [self.view setNeedsUpdateConstraints];
    
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(void)updateViewConstraints
{
    [super updateViewConstraints];
    
    __weak typeof(self) weakSelf = self;
    [view2 mas_updateConstraints:^(MASConstraintMaker *make) {
        if(weakSelf.isExpand)
            make.height.mas_equalTo(500);
        else
            make.height.mas_equalTo(100);
        
        
        
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
