//
//  PopViewController.m
//  ceshi
//
//  Created by csc on 16/5/26.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "PopViewController.h"

@interface PopViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView * mainTable ;
}
@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CSWidth, CSHeight) style:UITableViewStylePlain];
    mainTable.dataSource = self;
    mainTable.delegate = self;
    mainTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mainTable];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellInfo  = @"cellInfo";
    UITableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:cellInfo];
    if(!cell)
    {
        cell =   [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInfo];
    }
    cell.backgroundColor = [UIColor purpleColor];
    //cell.textLabel.text = [NSString stringWithFormat:@"cell---%tu",indexPath.row];
    return cell;
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(scrollView.contentOffset.y<= -60.)
    {
        
        [UIView animateWithDuration:0.15 animations:^{
           scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        }];
        
        [self performSelector:@selector(reBack) withObject:nil afterDelay:0.15];
        
    }
}

-(void)reBack
{
    [self dismissViewControllerAnimated:YES completion:^{
        
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
