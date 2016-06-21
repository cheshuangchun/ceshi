
//
//  luanViewController.m
//  ceshi
//
//  Created by csc on 16/5/30.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "luanViewController.h"
#import "LuanModel.h"
#import "LuanModel+LuanCategory.h"
//#import "LuanModel_Extension.h"
@interface luanViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation luanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView * table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate =self;
    table.dataSource = self;
    //table.rowHeight = 100;
    //[self.view addSubview:table];

    LuanModel * model = [[LuanModel alloc]init];
    model.name = @"你是猪吗";
//    model.pwd = @"8888888";
  
    //[model dark];
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellinfo = @"nini";
    UITableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:cellinfo];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellinfo];
    }
    NSLog(@"当前cellrow   ======>>>%tu",indexPath.row);
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *paramStr = [NSString stringWithFormat:@"ulpayApp://username=%@&age=%@&address=%@", @"test123", @"100", @"上海市"];
//    NSURL *url = [NSURL URLWithString:[paramStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    [[UIApplication sharedApplication] openURL:url];
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
