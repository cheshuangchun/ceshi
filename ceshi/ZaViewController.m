//
//  ZaViewController.m
//  ceshi
//
//  Created by csc on 16/5/17.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "ZaViewController.h"
#import "CSZaxiangCell.h"
@interface ZaViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UITextFieldDelegate>
{
    UITableView * zaTable;
}
@end

@implementation ZaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, CSWidth, CSHeight-20) style:UITableViewStyleGrouped];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CSZaxiangCell" bundle:nil] forCellReuseIdentifier:@"CSZaxiangCell"];
    
    
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellinfo = @"CSZaxiangCell";
    CSZaxiangCell * cell = [tableView dequeueReusableCellWithIdentifier:cellinfo];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CSZaxiangCell" owner:self options:nil] lastObject];
    }
    cell.cTextField.delegate = self;
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollviewFloat----------------->>>>%f",scrollView.contentOffset.y);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

//#pragma mark 键盘将要出现的时候
//- (void)keyboardWillShow:(NSNotification *)notification {
//    CGRect endFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
//    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
//    zaTable.frame = CGRectMake(0, 0, zaTable.frame.size.width, CSHeight - endFrame.size.height);
//    // 这个动画是为了兼容第三方输入法，如果是系统的输入法直接改变他的ContentOffset即可，默认有动画，但是如果是第三方输入法动画就没有了，所以在这里用键盘的动画来进行弥补
//    [UIView animateWithDuration:duration.doubleValue animations:^{
//        [UIView setAnimationBeginsFromCurrentState:YES];
//        [UIView setAnimationCurve:[curve intValue]];
//        
//        if (zaTable.contentSize.height > zaTable.frame.size.height) {
//            CGPoint offset = CGPointMake(0, zaTable.contentSize.height - zaTable.frame.size.height);
//            // 这里的animated属性必须设置为NO（即不用系统的动画），否则会出现问题
//            [zaTable setContentOffset:offset animated:NO];
//        }
//    }];
//}
//
//#pragma mark 键盘将要隐藏
//- (void)keyboardWillHide:(NSNotification *)notification {
//    zaTable.frame = CGRectMake(0, 0, zaTable.frame.size.width, CSHeight);
//}


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
