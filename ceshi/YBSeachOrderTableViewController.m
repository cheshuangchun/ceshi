//
//  YBSeachOrderTableViewController.m
//  PaySDKTest
//
//  Created by FBI on 16/5/16.
//  Copyright © 2016年 fengbing. All rights reserved.
//

#import "YBSeachOrderTableViewController.h"
#import "YbOrderListTableViewCell.h"
#import "YBFBTools.h"
static NSString *theState=@"order";
static NSString *ordNo=@"ordNo";


@interface YBSeachOrderTableViewController ()<UITextFieldDelegate>
@property(strong,nonatomic)NSMutableArray *theDataList;
@property(strong,nonatomic)NSString *orderNo;

@end

@implementation YBSeachOrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.orderNo=[self.theList firstObject];
    
  
    UIView *theHeader=[[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 120)];
    UIButton *theButton=[UIButton buttonWithType:UIButtonTypeCustom];
    theButton.frame=CGRectMake(15, 22, (CGRectGetWidth(self.view.bounds))/2.0-90, 44);
    theButton.layer.cornerRadius = 3.f;
    theButton.backgroundColor=[UIColor redColor];
    [theButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [theButton setTitle:@"查询订单" forState:UIControlStateNormal];
    
    [theHeader addSubview:theButton];
    theButton.tag=202;
    [theButton addTarget:self action:@selector(nextStepBtn:) forControlEvents:UIControlEventTouchUpInside];
    UITextField  *theOrderNo=[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2.-50, theButton.frame.origin.y, CGRectGetWidth(self.view.frame)/2., 44)];
    theOrderNo.placeholder=@"请输入商户订单号";
    theOrderNo.font=[UIFont systemFontOfSize:14.];
    theOrderNo.text=self.orderNo;
    theOrderNo.borderStyle=UITextBorderStyleRoundedRect;
    theOrderNo.clearButtonMode=UITextFieldViewModeWhileEditing;
    theOrderNo.tag=999;
    
    theOrderNo.delegate=self;
    [theHeader addSubview:theOrderNo];
    
    UIButton *theClose=[UIButton buttonWithType:UIButtonTypeCustom];
    theClose.frame=CGRectMake(CGRectGetWidth(self.view.frame)-60, 22, 60, 44);
    [theClose setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [theClose setTitle:@"关闭" forState:UIControlStateNormal];
    [theHeader addSubview:theClose];
    [theClose addTarget:self action:@selector(nextStepBtn:) forControlEvents:UIControlEventTouchUpInside];
    theClose.tag=200;
    

    
    
    self.tableView.tableHeaderView=theHeader;
    self.theDataList=[NSMutableArray arrayWithCapacity:4];
    for(NSString *orderID in self.theList)
    {
        [self.theDataList addObject:@{ordNo:orderID,theState:@"点击查询"}];
        
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
#pragma mark 下一步
-(void)nextStepBtn:(UIButton *)btn
{
    if(btn.tag==200)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else
    {
    [self.tableView endEditing:YES];
    [self.view endEditing:YES];
        
        [self orderIndex:1000000 andOrder:self.orderNo];
        
    }
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    self.orderNo=textField.text;
    
}
       // [self readerOrderList];

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.theDataList count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cellID";
    YbOrderListTableViewCell  *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell)
    {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"YbOrderListTableViewCell" owner:self options:nil] lastObject];
    }
    NSDictionary *theDict=self.theDataList[indexPath.row];
    
    cell.theOrder.text=[NSString stringWithFormat:@"%@\n%@",theDict[ordNo],theDict[theState]];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *theDict=self.theDataList[indexPath.row];
    [self orderIndex:indexPath.row andOrder:theDict[ordNo]];
    
   }
#pragma mark 订单数据查询
-(void)orderIndex:(NSInteger)index andOrder:(NSString *)order
{
    __weak YBSeachOrderTableViewController *seach=self;
    
    //订单状态(S-成功，U-处理中，F-失败，N-待支付)

    [YBFBTools requestMercOrderInfo:self.theMercNo andOrderNo:order andSuccess:^(NSDictionary *resultArr) {
        ;if([resultArr[@"respCode"] isEqual:@"PWM00000"])
        {
            NSString *theSta=resultArr[@"orderStatus"];
            NSString *theHanZi=@"未支付";
              if([theSta hasPrefix:@"S"])
              {
                  theHanZi=@"成功";
              }else if([theSta hasPrefix:@"U"])
              {
                  theHanZi=@"处理中";

              }else if([theSta hasPrefix:@"F"])
              {
                  theHanZi=@"失败";
                  
              }else if([theSta hasPrefix:@"N"])
              {
                  theHanZi=@"待支付";
                  
              }
            NSString *theStr=[NSString stringWithFormat:@"%@,%@(%@),%@,%@",resultArr[@"use"],theHanZi,theSta,resultArr[@"ordDt"],resultArr[@"payInOrdNo"]];
            NSDictionary *theTempDict=@{ordNo:resultArr[@"mercOrdNo"],theState:theStr};
            
            if(index>9999)
            {
                [seach.theDataList addObject:theTempDict];

                
            }else
            {
            [seach.theDataList replaceObjectAtIndex:index withObject:theTempDict];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [seach.tableView reloadData];
                
            });
            
            
        }else
        {
            [seach showAlertInfo:resultArr[@"respMsg"]];
            
            
        }
    } andFail:^(NSString *errStr) {
        ;
    }];

    
}
#pragma mark 显示信息
-(void)showAlertInfo:(NSString *)mes
{
    dispatch_async(dispatch_get_main_queue(), ^{
       
        UIAlertView *theAlert=[[UIAlertView alloc]initWithTitle:@"提示" message:mes delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [theAlert show];
        
    });
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
