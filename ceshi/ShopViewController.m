//
//  ShopViewController.m
//  ceshi
//
//  Created by csc on 16/4/14.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "ShopViewController.h"
#import "KView.h"
#import "ShopCell.h"
#define SWITDH  [UIScreen mainScreen].bounds.size.width
#define SHeight [UIScreen mainScreen].bounds.size.height
@interface ShopViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    KView * kView;
    NSInteger totals;
    NSMutableArray * zeroArr;
}
@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTable];
    
    kView = [[KView alloc]initWithFrame:CGRectMake(0, SHeight-64, SWITDH, 64)];
    [self.navigationController.view addSubview:kView];
    
    zeroArr = [[NSMutableArray alloc]initWithCapacity:1];
    for(NSInteger i =0;i<35;i++)
    {
        [zeroArr addObject:[NSString stringWithFormat:@"%tu",0]];
    }
    
}

-(void)createTable
{
    kTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SWITDH, SHeight-64) style:UITableViewStylePlain];
    kTable.delegate = self;
    kTable.dataSource = self;
    [self.view addSubview:kTable];
    [kTable registerNib:[UINib nibWithNibName:@"ShopCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return zeroArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    __weak typeof(cell) weakCell = cell;
    cell.NoTf.text = [zeroArr objectAtIndex:indexPath.row];
     weakCell.NoTf.delegate = self;
    cell.shopBlock = ^(NSInteger tag)
    {
        NSInteger num = [[zeroArr objectAtIndex:indexPath.row] integerValue];
        
        if(tag == 0)
        {
            if(num>0)
                num --;
            //减
            weakCell.NoTf.text = [NSString stringWithFormat:@"%tu",num];
        }else
        {
            num++;
            //加
            weakCell.NoTf.text = [NSString stringWithFormat:@"%tu",num];
            
           
        }
       
         //kView.addlbl.text = [NSString stringWithFormat:@"%tu",num*100];
        
        [zeroArr replaceObjectAtIndex:indexPath.row withObject:[NSString stringWithFormat:@"%tu",num]];
        
    };
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopCell * cell = [kTable cellForRowAtIndexPath:indexPath];
    [cell.NoTf becomeFirstResponder];
    
}

#pragma mark UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
