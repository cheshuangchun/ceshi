//
//  DemoCoretextViewController.m
//  ceshi
//
//  Created by csc on 16/5/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "DemoCoretextViewController.h"
#import "CSTextHeightCal.h"
#import "CSCoreTextView.h"
#import "CoretextCell.h"
#import "CoreDamnCell.h"
@interface DemoCoretextViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    CSTextHeightCal * model;
    CSCoreTextView * coreView;
    UITableView * myTable;
    NSMutableArray * dataArray;
}
@end

@implementation DemoCoretextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    dataArray = [[NSMutableArray alloc]initWithCapacity:1];
    
    [self createModel];
    [self createView];
    
    
}

-(void)createModel
{
    CSTextHeightCal *model1 = [[CSTextHeightCal alloc]init];
    model1.showShuoshuo = @"地狱的房间已满，于是，[/抱拳:][/抱拳:]死亡爬上了人间如果一个人觉得他自己死的很不值,就会把诅咒留在他生前接触过的地方[/抱拳:]只要有人经过这些地方[/呲牙:]就会被咒语套中如果一个人觉得他自己死的很不值,就会把诅咒留在他生前接触过的地方[/呲牙:]只要有人经过这些地方[/呲牙:]就会被咒语套中如果一个人觉得他自己死的很不值就会把诅咒留在他生前接触过的地方[/呲牙:]只要有人经过这些地方[/呲牙:]就会被咒语套中如果一个人觉得他自己死的很不值,就会把诅咒留在他生前接触过的地方[/鄙视:]只要有人经过这些地方[/鄙视:]就会被咒语套中";
    model1.modelHeight = [model1 calculateShuoShuoHightWithHeight:15];
    
    CSTextHeightCal *model2 = [[CSTextHeightCal alloc]init];
    model2.showShuoshuo = @"地狱的房间已满，于是，[/抱拳:][/抱拳:]死亡爬上了人间如果一个人觉得他自己死的很不值,就会把诅咒留在他生前接触过的地方[/抱拳:]只要有人经过这些地方[/呲牙:]就会";
    model2.modelHeight = [model2 calculateShuoShuoHightWithHeight:15];
    
    CSTextHeightCal *model3 = [[CSTextHeightCal alloc]init];
    model3.showShuoshuo = @"地狱的房间已满，于是，[/抱拳:][/抱拳:]死亡爬上了人间如果一个人觉得他自己死的很不值,就会把诅咒留在他生前接触过的地方[/抱拳:]只要有人经过这些地方[/呲牙:]就会被咒语套中如果一个人觉得他自己死的很不值,就会把诅咒留在他生前接触过的地方[/呲牙:]只要有人经过这些地方[/呲牙:]就会被咒语套中如果一个人觉得他自己死的很不值";
    model3.modelHeight = [model3 calculateShuoShuoHightWithHeight:15];
    
    CSTextHeightCal *model4 = [[CSTextHeightCal alloc]init];
    model4.showShuoshuo = @"地狱的房间已满，于是，[/抱拳:][/抱拳:]死亡爬上了人间如果一个人觉得他自己死的很不值,就会把诅咒留在他生前接触过的地方[/鄙视:]只要有人经过这些地方[/呲牙]就会被咒语套中如果一个人觉得他自己死的很不值,就会把诅咒留在他生前接触过的地方[/鄙视:]只要有人经过这些地方[/呲牙:]就会被咒语套中如果一个人觉得他自己死的很不值就会把诅咒留在他生前接触过的地方[/呲牙:]只要有人经过这些地方[/呲牙:]就会被咒语套中如果一个人觉得他自己死";//的很不值,就会把诅咒留在他生前接触过的地方[鄙视]只要有人经过这些地方[鄙视]就会被咒语套中";
    model4.modelHeight = [model4 calculateShuoShuoHightWithHeight:15];
    
    CSTextHeightCal *model5 = [[CSTextHeightCal alloc]init];
    model5.showShuoshuo = @"地狱的房间已满，于是，[/抱拳:][/抱拳:][/鄙视:]只要有人经过这些地方[/呲牙:]就会被咒语套中如果一个人觉得他自己死的很不值就会把诅咒留在他生前接触过的地方[/呲牙:]只要有人经过这些地方[/呲牙:]";//,就会把诅咒留在他生前接触过的地方[呲牙]只要有人经过这些地方[呲牙]就会被咒语套中如果一个人觉得他自己死的很不值,就会把诅咒留在他生前接触过的地方[鄙视]只要有人经过这些地方[鄙视]就会被咒语套中";
    model5.modelHeight = [model5 calculateShuoShuoHightWithHeight:15];
    
    [dataArray addObject:model1];
    [dataArray addObject:model2];
    [dataArray addObject:model3];
    [dataArray addObject:model4];
    [dataArray addObject:model5];
    
}

-(void)createView
{
//    coreView = [[CSCoreTextView alloc]initWithFrame:CGRectMake(10, 100, CSWidth-20, 200)];
//    coreView.isDraw = YES;
//    [coreView setOldString:model.showShuoshuo andXinString:model.completionShuoshuo];
//    [self.view addSubview:coreView];
    myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, CSWidth, CSHeight-20) style:UITableViewStyleGrouped];
    myTable.delegate = self;
    myTable.dataSource = self;
    [self.view addSubview:myTable];
    
   // [myTable registerNib:[UINib nibWithNibName:@"CoreDamnCell" bundle:nil] forCellReuseIdentifier:@"CoreDamnCell"];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CSTextHeightCal * modelk = [dataArray objectAtIndex:indexPath.section];
    return modelk.modelHeight+70;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellInfo = @"cellinfo";//@"CoreDamnCell";
//    
    CoreDamnCell *cell=[tableView dequeueReusableCellWithIdentifier:cellInfo];
    if(!cell)
    {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"CoreDamnCell" owner:self options:nil] lastObject];
    }

    CSTextHeightCal * modeld = [dataArray objectAtIndex:indexPath.section];
    [cell setModel:modeld];

    return cell;
    
//    CoretextCell * cell = [tableView dequeueReusableCellWithIdentifier:cellInfo];
//    if(!cell)
//    {
//        cell = [[CoretextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInfo];
//    }
//    CSTextHeightCal * modeld = [dataArray objectAtIndex:indexPath.section];
//    [cell setModel:modeld];
//    return cell;
    
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
