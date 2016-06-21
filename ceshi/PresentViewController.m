//
//  PresentViewController.m
//  ceshi
//
//  Created by csc on 16/5/26.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "PresentViewController.h"
#import "PopViewController.h"
#import "CSPresentingAnimator.h"
#import "CSDimmissAnimator.h"
@interface PresentViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UIViewControllerTransitioningDelegate>
{
    UITableView * mainTable;
}
@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CSWidth, CSHeight) style:UITableViewStylePlain];
    mainTable.dataSource = self;
    mainTable.delegate = self;
    [self.view addSubview:mainTable];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellInfo  = @"cellInfo";
    UITableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:cellInfo];
    if(!cell)
    {
        cell =   [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInfo];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell---%tu",indexPath.row];
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PopViewController * popVc = [[PopViewController alloc]init];
    [self presentViewController:popVc animated:YES completion:^{
        
    }];
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(scrollView.contentOffset.y>= 60.)
    {
        PopViewController * popVc = [[PopViewController alloc]init];
        popVc.transitioningDelegate = self;
        popVc.modalPresentationStyle = UIModalPresentationCustom;
        [self presentViewController:popVc animated:YES completion:^{
            
        }];
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        [self performSelector:@selector(reback) withObject:nil afterDelay:0.5];
    }
}

-(void)reback
{
    mainTable.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}


#pragma mark 定制转场动画

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    
    return [CSPresentingAnimator new];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    // 退出控制器动画
    return [CSDimmissAnimator new];
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
