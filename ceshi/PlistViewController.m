//
//  PlistViewController.m
//  ceshi
//
//  Created by csc on 16/4/18.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "PlistViewController.h"
#import "UIButton+VerticalLayout.h"
#import "UIView+CornerMaskLayer.h"
#import "UIView+AddHorizontalLine.h"
@interface PlistViewController ()
{
    UIImageView * kauImageView;
}
@end

@implementation PlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSString * filePath = [self setFilePath];
//    NSString * loginPath = [self setFilePathForLoginState];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * normalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [normalBtn setImage:[UIImage imageNamed:@"icon_con"] forState:UIControlStateNormal];
    [normalBtn setTitle:@"桃花侠" forState:UIControlStateNormal];
    [normalBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [normalBtn setBackgroundColor:[UIColor yellowColor]];
    
    normalBtn.frame = CGRectMake(50, 100, 250, 200);
    [normalBtn setVerticalLayoutWithSpace:5];
    //[self.view addSubview:normalBtn];
    
    kauImageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 60, 60)];
    [kauImageView setImage:[UIImage imageNamed:@"fang"]];
    
    [self.view addSubview:kauImageView];
    
    //[kauImageView addCornerMaskLayerWithRadius:10];
    [kauImageView addHorizontalLineWithColor:[UIColor cyanColor]];
    
    
    NSDictionary * dic1 = @{@"token":@"",@"key2":@"二毛"};
    [self saveSet:dic1];
    
    NSLog(@"---->>>%@",[self gettokenIdAccount]);;
    
    
     NSDictionary * dic2 = @{@"key":@"打毛",@"key2":@"二毛"};
    [self saveLoginSet:dic2];
    [self gettokenLoginIdAccount];
}

- (NSString *)setFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSLog(@"%@",filePath);
    return filePath;
}

- (NSString *)setFilePathForLoginState {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentDirectory stringByAppendingString:@"DataForLoginState.plist"];
    return filePath;
}


-(void)saveSet:(NSDictionary *)dictionary
{
    NSString*file=[self setFilePath];
    NSLog(@"%@",file);
    [dictionary writeToFile:file atomically:YES];
}


-(void)saveLoginSet:(NSDictionary *)dictionary
{
    NSString*file=[self setFilePathForLoginState];
    NSLog(@"%@",file);
    [dictionary writeToFile:file atomically:YES];
}

-(NSString *)gettokenIdAccount
{
    NSDictionary *item1 = [NSDictionary dictionaryWithContentsOfFile:[self setFilePath]];
    return [item1 objectForKey:@"token"];//接口验证码
}

-(NSString *)gettokenLoginIdAccount
{
    NSDictionary *item1 = [NSDictionary dictionaryWithContentsOfFile:[self setFilePathForLoginState]];
    return [item1 objectForKey:@"key"];//接口验证码
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
