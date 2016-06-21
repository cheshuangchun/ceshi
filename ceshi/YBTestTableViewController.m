//
//  YBTestTableViewController.m
//  PaySDKTest
//
//  Created by fengbing on 16/4/19.
//  Copyright © 2016年 fengbing. All rights reserved.
//

#import "YBTestTableViewController.h"
#import "FBTestTableViewCell.h"
#import <WalletPaySDK/WalletPaySDK.h>
#import "YBFBTools.h"

//ht5测试
#import "YBWebH5TextViewController.h"
#import "YBSeachOrderTableViewController.h"
@interface YBTestTableViewController ()<UITextFieldDelegate>
{
   // UIButton *nextBtn;
}
@property(strong,nonatomic) NSArray *titlesArr;
@property(strong,nonatomic) NSArray *placeHolderArr;
@property(strong,nonatomic) NSArray *keysArr;
@property(strong,nonatomic) NSMutableArray *theValueArr;
@property(strong,nonatomic)YBOrder *theOrder;
@property(strong,nonatomic)NSString *theOrderNo;//商户订单号

@property(strong,nonatomic)NSMutableArray *theOrderList;



@end

@implementation YBTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.theOrderList=[NSMutableArray array];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self loadTheData];
    [self createViews];
    
}

-(void)loadTheData
{
    self.theValueArr=[NSMutableArray arrayWithCapacity:4];
    
    NSString *theCreate=[YBFBTools orderTimeDateFormatterData];
    NSString *theExt=[YBFBTools orderExtTimeDateFormatterData];
    NSString *theOrderNo=[YBFBTools createOrderNo];
    
    
    [self.theValueArr addObjectsFromArray:@[@"800010000060070",theOrderNo,theCreate,theExt,@"100.01",@"90.01",@"币种",@"www.ulpay.com",@"www.ulpay.com",@"Demo合众支付",@"10.63.8.21"]];
    
    self.titlesArr = [NSArray arrayWithObjects:@"商户编号",@"商户订单编号",@"订单建立时间",@"订单过期时间",@"交易金额",@"实际交易金额",@"币种",@"通知商户后台URL",@"通知商户前端URL",@"用途",@"交易来源IP", nil];
    
    self.placeHolderArr = [NSArray arrayWithObjects:@"输入商户编号",@"输入商户订单编号",@"输入订单建立时间",@"输入订单过期时间",@"输入交易金额",@"输入实际交易金额",@"输入币种 默认CNY",@"输入通知商户后台URL",@"输入通知商户前端URL",@"输入用途",@"输入交易来源IP",@"输入商户签名",@"输入mac地址", nil];
    
    
    self.keysArr = [NSArray arrayWithObjects:@"mercID",@"mercOrdNo",@"orderCreateTime",@"orderExpTime",@"aplAMT",@"actAmt",@"saleCCY",@"retURL",@"notifyURL",@"userStr",@"renoteIP",@"merchanSign",@"remoteMac", nil];
    
    self.theOrder=[[YBOrder alloc]init];
    self.theOrder.mercID=@"800010000060070"; //商户编号
    self.theOrder.mercOrdNo=theOrderNo; //商户订单编号
    self.theOrder.orderCreateTime=theCreate;//订单建立时间
    self.theOrder.orderExpTime=theExt; //订单过期时间
    self.theOrder.aplAMT=@"100.01"; //交易金额
    self.theOrder.actAmt=@"90.01"; //实际交易金额
    self.theOrder.saleCCY=@"CNY"; //币种
    self.theOrder.retURL= @"www.ulpay.com";//@"192.168.1.66"; //通知商户后台URL
    self.theOrder.notifyURL= @"www.ulpay.com";//@"192.168.30.66"; //通知 商户前端URL
    self.theOrder.userStr=@"Demo合众支付"; //用途
    self.theOrder.renoteIP= @"10.63.8.21";//@"192.168.0.1"; //交易来源IP
    self.theOrder.remoteMac = @""; //mac地址
    self.theOrder.theDeviceID=@"";
    self.theOrderNo=self.theOrder.mercOrdNo;
    
    
    
}


-(void)createViews
{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 160)];
    self.tableView.tableFooterView = footerView;
    
    
//    nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    nextBtn.frame = CGRectMake(15, 35, CGRectGetWidth(footerView.frame)-30, 44);
//    nextBtn.backgroundColor=[UIColor redColor];
//    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    
//    
//    nextBtn.layer.cornerRadius = 3.f;
//    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
//    [nextBtn addTarget:self action:@selector(nextStepBtn:) forControlEvents:UIControlEventTouchUpInside];
//    
    for(int i=0;i<2;i++)
    {
        UIButton *theButton=[UIButton buttonWithType:UIButtonTypeCustom];
        theButton.frame=CGRectMake(15+i*((CGRectGetWidth(self.view.bounds)-30)/2.0), 35, (CGRectGetWidth(self.view.bounds)-50)/2.0, 44);
        theButton.layer.cornerRadius = 3.f;
        theButton.backgroundColor=[UIColor redColor];
        [theButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        if(i==0)
        [theButton setTitle:@"SDKDemo" forState:UIControlStateNormal];
        else
            [theButton setTitle:@"HTML5Demo" forState:UIControlStateNormal];

        [footerView addSubview:theButton];
        theButton.tag=200+i;
        [theButton addTarget:self action:@selector(nextStepBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIButton *theButton=[UIButton buttonWithType:UIButtonTypeCustom];
    theButton.frame=CGRectMake(15, 35+50, (CGRectGetWidth(self.view.bounds))/2.0-90, 44);
    theButton.layer.cornerRadius = 3.f;
    theButton.backgroundColor=[UIColor redColor];
    [theButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    theButton.titleLabel.font=[UIFont systemFontOfSize:14.];
    
        [theButton setTitle:@"查询订单" forState:UIControlStateNormal];
    
    [footerView addSubview:theButton];
    theButton.tag=202;
    [theButton addTarget:self action:@selector(nextStepBtn:) forControlEvents:UIControlEventTouchUpInside];
           // [footerView addSubview:nextBtn];
    
}
#pragma mark 下一步
-(void)nextStepBtn:(UIButton *)btn
{
    [self.tableView endEditing:YES];
    [self.view endEditing:YES];
    if(btn.tag==202)
    {
        [self readerOrderList];
        
    }else  if(self.theOrder)
    {
        
        [self savePayOrderNos:self.theOrder.mercOrdNo];
        
        __weak YBTestTableViewController *theTest=self;
        
        [YBFBTools requestMercSign:self.theOrder andSuccess:^(NSString *signStr) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                theTest.theOrder.merchanSign=[signStr stringByReplacingOccurrencesOfString:@" " withString:@""];
                theTest.theOrder.merchanSign=[theTest.theOrder.merchanSign stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                [theTest.theOrder.merchanSign stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
                
                
                NSLog(@"sing==%@",theTest.theOrder.merchanSign);
                NSRange _range = [theTest.theOrder.merchanSign rangeOfString:@" "];
                if (_range.location != NSNotFound) {
                    //有空格
                    NSLog(@"sing==%@",theTest.theOrder.merchanSign);

                }else {
                    //没有空格
                    NSLog(@"sing==%@",theTest.theOrder.merchanSign);

                }
                if(btn.tag==200)
                {
                    [theTest loadSDK];
                }else
                {
                    [theTest loadHTML5];
                    
                }
                
;
            });
            
            ;
           } andFail:^(NSString *errStr) {
            ;
        }];
        
//        [YBWalletPro createMercSigne:self.theOrder andSuccess:^(NSString *signStr) {
//            theTest.theOrder.merchanSign=signStr;
//            if(btn.tag==200)
//            {
//                [theTest loadSDK];
//            }else
//            {
//                [theTest loadHTML5];
//                
//            }
//            
//        } andFaile:^(NSString *errorStr) {
//            ;
//        }];
//
      
    }else
    {
        
    }
    
}

#pragma mark 原生SDK  
-(void)loadSDK
{
    
    [YBWalletPro enterViewController:self andOrder:self.theOrder andBackType:^(YBBackAppType backType) {
        NSString *theAlertMes=@"";
        if(backType==YBUserCancel)
        {
            theAlertMes=@"用户取消";
            
        }else if(backType==YBOrderPaySuccess)
        {
            theAlertMes=@"支付成功";
            
            
        }else if(backType==YBOrderPayFail)
        {
            theAlertMes=@"支付失败";
            
        }
        UIAlertView *theAlert=[[UIAlertView alloc]initWithTitle:@"支付结果" message:theAlertMes delegate:nil cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
        [theAlert show];
        
    }];
    
}
#pragma mark 存储 支付订单号
-(void)savePayOrderNos:(NSString *)orderNo
{
    if(![self.theOrderList containsObject:orderNo])
    {
        [self.theOrderList addObject:orderNo];
        [[NSUserDefaults standardUserDefaults] setObject:self.theOrderList forKey:@"order"];
        
    }
    
}
#pragma mark 读取
-(void)readerOrderList
{
    if([[[NSUserDefaults standardUserDefaults] objectForKey:@"order"] isKindOfClass:[NSArray class]])
    {
        [self.theOrderList removeAllObjects];
        [self.theOrderList addObjectsFromArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"order"]];
    }
    
    YBSeachOrderTableViewController  *theSeach=[[YBSeachOrderTableViewController alloc]init];
    theSeach.theMercNo=self.theOrder.mercID;
    theSeach.theList=[self.theOrderList mutableCopy];
    
    [self presentViewController:theSeach animated:YES completion:^{
        ;
    }];
    

}
#pragma mark H5
-(void)loadHTML5
{
    YBWebH5TextViewController *theWeb=[[YBWebH5TextViewController alloc]init];
    theWeb.theOrder=self.theOrder;
    [self presentViewController:theWeb animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.titlesArr count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *dequeueCell=@"cellID";
    FBTestTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:dequeueCell];
    if(!cell)
    {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"FBTestTableViewCell" owner:self options:nil] lastObject];
    }
    cell.theLeftLbl.text=self.titlesArr[indexPath.row];
    cell.theTxt.placeholder=self.placeHolderArr[indexPath.row];
    cell.theTxt.text=self.theValueArr[indexPath.row];
    
    cell.theTxt.delegate=self;
    cell.theTxt.tag=indexPath.row+200;
    
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];

    if(textField.tag==999)
    {
        self.theOrderNo=textField.text;
        [self savePayOrderNos:self.theOrderNo];

        [textField resignFirstResponder];
    }else
    {
    NSString *tempTxt=textField.text;
    tempTxt=[tempTxt stringByReplacingOccurrencesOfString:@" " withString:@""];
    if([tempTxt length]>0)
    {
        [self.theValueArr replaceObjectAtIndex:textField.tag-200 withObject:tempTxt];
        [self orderAssignmentTxtTag:textField.tag-200 andValues:tempTxt];
        
        
    }
    }
    
   
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

#pragma mark 订单赋值
-(void)orderAssignmentTxtTag:(NSInteger)tag andValues:(NSString *)values
{
    
    if(self.theOrder)
    {
        
        
        switch (tag) {
            case 0:
                self.theOrder.mercID=values;
                break;
                case 1:
                self.theOrder.mercOrdNo=values; //商户订单编号
                break;
                case 2:
                self.theOrder.orderCreateTime=values;//订单建立时间
                break;
                case 3:
                self.theOrder.orderExpTime=values; //订单过期时间
                break;
                case 4:
                self.theOrder.aplAMT=values; //交易金额
                break;
                case 5:
                self.theOrder.actAmt=values; //实际交易金额
                break;
                case 6:
                self.theOrder.saleCCY=values; //币种
                break;
                case 7:
                self.theOrder.retURL= values;//@"192.168.1.66"; //通知商户后台URL
                break;
                case 8:
                self.theOrder.notifyURL=values;//@"192.168.30.66"; //通知 商户前端URL
                break;
                case 9:
                self.theOrder.userStr=values; //用途
                break;
                case 10:
                self.theOrder.renoteIP= values;//@"192.168.0.1"; //交易来源IP
                break;
               
          
        }
        
        
        
    }
    
}

#pragma mark 网络请求
-(void)requestMerchanSign
{
    
    
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

@end
