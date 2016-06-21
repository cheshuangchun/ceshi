//
//  WodetianTableViewController.m
//  ceshi
//
//  Created by csc on 16/6/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "WodetianTableViewController.h"

@interface WodetianTableViewController ()<UIScrollViewDelegate>
{
    CGFloat _lastPosition;
    UIView * barView;
}
@end

@implementation WodetianTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    barView = [[UIView alloc]initWithFrame:CGRectMake(0, CSHeight-50, CSWidth, 50)];
    barView.backgroundColor = [UIColor purpleColor];
    [[UIApplication sharedApplication].delegate.window addSubview:barView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" ];
    
    // Configure the cell...
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell %tu",indexPath.row];
    return cell;
}


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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    
    int currentPostion = scrollView.contentOffset.y;
    
    if (currentPostion - _lastPosition > 20  && currentPostion > 0) {        //这个地方加上 currentPostion > 0 即可）
        
        _lastPosition = currentPostion;
        
        NSLog(@"ScrollUp now");
        
        [self hideTabBar:YES];
        
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
    }
    
    else if ((_lastPosition - currentPostion > 20) && (currentPostion  <= scrollView.contentSize.height-scrollView.bounds.size.height-20) ) //这个地方加上后边那个即可，也不知道为什么，再减20才行
        
    {
        
        _lastPosition = currentPostion;
        
        NSLog(@"ScrollDown now");
        
        [self hideTabBar:NO];
        
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        
    }
    
    
    
}

-(void)hideTabBar:(BOOL)tag
{
    if(tag)
    {
        [UIView animateWithDuration:0.1 animations:^{
            barView.hidden = YES;
        }];
    }else
    {
        [UIView animateWithDuration:0.1 animations:^{
            barView.hidden = NO;
        }];
    }
}


//字典的分组排序

/*************csc******************/
-(NSMutableDictionary*)dealYourDataWithArray:(NSArray*)dataArray

{
    //你要得字典
    NSMutableDictionary * dataDict = [NSMutableDictionary dictionaryWithCapacity:0];
    //字典关键字
    //省会
    NSString * provincailKey = @"RoomNumberID";
    //遍历数组
    for (int i = 0; i < dataArray.count; i++)
    {
        //处理字典
        NSDictionary * itemDict = [dataArray objectAtIndex:i];
        NSString * provincail = [itemDict objectForKey:provincailKey];
        //看数据字典里面有没有这个省会
        NSMutableArray * cityArray = [dataDict objectForKey:provincail];
        if (nil == cityArray)//如果没有重新创建
        {
            cityArray = [NSMutableArray arrayWithCapacity:0];
            [cityArray addObject:itemDict];
            [dataDict setObject:cityArray forKey:provincail];
        }
        else
        {
            [cityArray addObject:itemDict];
        }
    }
    return dataDict;
}


@end
