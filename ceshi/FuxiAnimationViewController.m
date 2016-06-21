//
//  FuxiAnimationViewController.m
//  ceshi
//
//  Created by csc on 16/5/27.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "FuxiAnimationViewController.h"
#import "FDemo1ViewController.h"
#import "FDemo2ViewController.h"
#import "FDemo3ViewController.h"
@interface FuxiAnimationViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * mainTable;
    NSArray * titleArr;
}
@end

@implementation FuxiAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    titleArr = @[@"Demo1",@"Demo2",@"Demo3",@"Demo4"];
    
    mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CSWidth, CSHeight) style:UITableViewStylePlain];
    mainTable.delegate = self;
    mainTable.dataSource = self;
    [self.view addSubview:mainTable];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellinfo  = @"cellinfo";
    UITableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:cellinfo];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellinfo];
    }
    cell.textLabel.text = [titleArr objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        FDemo1ViewController * vc = [[FDemo1ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1)
    {
        FDemo2ViewController * vc = [[FDemo2ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2)
    {
        FDemo3ViewController * vc = [[FDemo3ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
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
