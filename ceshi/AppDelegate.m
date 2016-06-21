//
//  AppDelegate.m
//  ceshi
//
//  Created by csc on 16/3/21.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "AppDelegate.h"
#import "PersonModel.h"
#import "Demo2ViewController.h"
#import "NCViewController.h"
#import "labelMoveViewController.h"
#import "URLSessionViewController.h"
#import "DispatchVC.h"
#import "RunloopViewController.h"
#import "BezierViewController.h"
#import "TakePhotoViewController.h"
#import "KokTableViewController.h"
#import "ShopViewController.h"
#import "SemaphoreViewController.h"
#import "PlistViewController.h"
#import "RichTextViewController.h"
#import "BerserViewController.h"
#import "SortedViewController.h"
#import "DonghuaViewController.h"
#import "LeidaViewController.h"
#import "SomeAnimationViewController.h"
#import "WakaViewController.h"
#import "PlaceTextViewViewController.h"
#import "AdoTableViewController.h"
#import "KvoTestVC.h"
#import "ScrollImageViewController.h"
#import "CeshiScrollViewController.h"
#import "CTLineRefDemoViewController.h"
#import "DemoCoretextViewController.h"
#import "ZaViewController.h"
#import "SwizzleViewController.h"
#import "MasonryViewController.h"
#import "CSAnimationViewController.h"
#import "CircleAnimateViewController.h"
#import "SuiyiViewController.h"
#import "YBScaleLabelViewController.h"
//#import "YBTestTableViewController.h"
#import "ImgRectViewController.h"

#import "PresentViewController.h"
#import "FuxiAnimationViewController.h"
#import "luanViewController.h"
#import "GifShowViewController.h"
#import "WodetianTableViewController.h"
#import "MSG_SendViewController.h"

#import "CscHudViewController.h"
#import "DeepShallowViewController.h"
#import "SBSBViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //汉语名字排序
    //[self demo1];
    
    //[self demo2];
    
    //简单动画
    //[self demo3];
    
    //跑马灯
    //[self demo4];
    //系统自带网络请求，简单加载证书实现
    //[self demo5];
    
    //dispatch_sempha
    //[self demo7];
    
    //[self demo8];
    
    //[self demo9];
    
    //[self demo10];
   
    //购物车加减
   //[self demo12];
   
     //[self demo13];
    
    //图片上加横线
   // [self demo14];
    
    
    //[self demo15];
    
    NSMutableDictionary * ddddd = [[NSMutableDictionary alloc]initWithCapacity:1];
    [ddddd setObject:@"1" forKey:@"ta"];
    NSLog(@"---->>>%@",ddddd);
    
    
    
    //layer.mask
    //[self demo16];
    
    
   // [self demo17];
    
    //数组排序
   // [self demo20];
    
    //动画
    //[self demo21];
    //雷达动画
    //[self demo22];
    
    //[self demo23];
    
    //[self demo24];
    
    //带placeholder的TextView;
    //[self demo25];
    
    //tableview收缩抽屉
   // [self demo26];
    //测试kvo
    //[self demo27];
    
    //CTLineRef
    //[self demo28];
    
    //[self demo29];
    
    //杂项
    //[self demo31];
    
    //swizzleMethod
    //[self demo32];
    
    //masonry使用
    //[self demo33];
    
    //动画
    [self demo34];
    //
    //[self demo35];
    //label缩放动画
   // [self demo36];
    
   //[self demoSDK];
    
    //图片防止变形
    //[self demoImageRect];
    
    //转场动画
//    [self  transformTranslation];
    
    //复习动画
   // [self fuxi];
    
    //测试
    //[self ceshiceshi];
    
    //Gifshow
   // [self gifShow];
    
    
    //我的
    //[self demo37];
    
    //runtime
   // [self demo38];
    
    //CSCHUD
    //[self cscHud];
    
    //深拷贝 浅拷贝
    //[self deepShallow];
    
    //轮播图
    //[self lunbotu];
    
    
    NSMutableArray * qipaArr = [[NSMutableArray alloc]initWithCapacity:1];
    NSMutableArray * qipa2 = [[NSMutableArray alloc]initWithCapacity:1];
    [qipa2 addObject:@"ki"];
    [qipa2 addObject:@"ta"];
    
    qipaArr = qipa2;
    NSLog(@"----------------->>>>%@",qipaArr);
    
    
    NSString * idCard = @"1306********6";
    NSMutableString * finalCard = [[NSMutableString alloc]initWithString:idCard];
    
    idCard =  [finalCard stringByReplacingCharactersInRange:NSMakeRange(1, idCard.length-2) withString:@"****************"];

    NSDictionary * params = @{@"price":[NSNumber numberWithFloat:3.0],@"pico":@"2.5"};
    NSString * stt = [NSString stringWithFormat:@"%.1f",[params[@"price"] floatValue]];
    NSString * koo = params[@"pico"];
    NSLog(@"--=============>>>%@",params);
    NSLog(@"stt--->%@   koo--->>%@",stt,koo);

    return YES;
}

-(void)lunbotu
{
    SBSBViewController * vc = [[SBSBViewController alloc]init];
     self.window.rootViewController = vc;
}

-(void)deepShallow
{
    DeepShallowViewController * vc = [[DeepShallowViewController alloc]init];
    self.window.rootViewController = vc;
}


-(void)cscHud
{
    CscHudViewController * vc = [[CscHudViewController alloc]init];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
}

-(void)demo38
{
    MSG_SendViewController * vc = [[MSG_SendViewController alloc]init];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
}


-(void)demo37
{
    WodetianTableViewController * vc = [[WodetianTableViewController alloc]init];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
}

-(void)gifShow
{
    GifShowViewController * vc = [[GifShowViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)ceshiceshi
{
    luanViewController * vc = [[luanViewController alloc]init];
    self.window.rootViewController = vc;
}

//复习
-(void)fuxi
{
    FuxiAnimationViewController * vc = [[FuxiAnimationViewController alloc]init];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
}

-(void)transformTranslation
{
    PresentViewController * vc = [[PresentViewController alloc]init];
    self.window.rootViewController = vc;
}


-(void)demoImageRect
{
    ImgRectViewController * vc = [[ImgRectViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demoSDK
{
//    YBTestTableViewController * vc = [[YBTestTableViewController alloc]init];
//    self.window.rootViewController = vc;
}

-(void)demo36
{
    YBScaleLabelViewController * vc = [[YBScaleLabelViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo35
{
    CircleAnimateViewController * vc = [[CircleAnimateViewController alloc]init];
    self.window.rootViewController = vc;
    
//    SuiyiViewController * vc = [[SuiyiViewController alloc]init];
//    self.window.rootViewController = vc;
    
}

-(void)demo34
{
    CSAnimationViewController * vc = [[CSAnimationViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo33
{
    MasonryViewController * vcr = [[MasonryViewController alloc]init];
    self.window.rootViewController = vcr;
}

-(void)demo32
{
    SwizzleViewController * swVC = [[SwizzleViewController alloc]init];
    self.window.rootViewController = swVC;
}

-(void)demo31
{
    ZaViewController * zvc = [[ZaViewController alloc]init];
    self.window.rootViewController = zvc;
    
}


-(void)demo29
{
    DemoCoretextViewController * vc = [[DemoCoretextViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo28
{
    CTLineRefDemoViewController * vc = [[CTLineRefDemoViewController alloc]init];
    self.window.rootViewController = vc;
}


-(void)demo27
{
    KvoTestVC * vc = [[KvoTestVC alloc]init];
    self.window.rootViewController = vc;
}


-(void)demo26
{
    AdoTableViewController * vc = [[AdoTableViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo25
{
    PlaceTextViewViewController * vc = [[PlaceTextViewViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo24
{
    WakaViewController * vc = [[WakaViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo23
{
    SomeAnimationViewController * vc = [[SomeAnimationViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo22
{
    LeidaViewController * vc = [[LeidaViewController alloc]init];
    self.window.rootViewController = vc;
}


-(void)demo21
{
    DonghuaViewController * donghuaVC = [[DonghuaViewController alloc]init];
    self.window.rootViewController = donghuaVC;
}


-(void)demo20
{
    SortedViewController * dvc = [[SortedViewController alloc]init];
    self.window.rootViewController = dvc;
}


-(void)demo17
{
    NSArray *names = nil;
    NSString * _oldString = @"驱魔人 “你可知道邪恶深藏于你心深处，但我会始终在你的[抱拳]左右，握着我的手，我会让你看到神迹，抱紧信仰，除此你一无[哈哈]所有！”";
    
    NSString * pattern =  @"\\[(\\S{1,4})\\]";
    names = [self itemsForPattern:pattern captureGroupIndex:1 andStr:_oldString];
    
    
    
    NSString * pattern2 = @"^(?!\\d+$)(?![a-zA-Z]+$)(?![\\W_]+$)[^ ]{8,12}$";
    
    NSString * pattern3 = @"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\\D).{8,20}$";
    
    NSString * pattern4 = @"((?=.*\\d)(?=.*\\D)|(?=.*[a-zA-Z])(?=.*[^a-zA-Z]))^.{8,16}$";
    
    NSString * pattern5 = @"^(?!\\d+$)(?![a-z]+$)(?![A-Z]+$)(?![\\W_]+$)[^ ]{8,20}$";
    
    //密码包含大小写字母，数字，特殊字符，至少包含3种组合
    NSString * pattern6 = @"((?=.*\\d)(?=.*\\W)(?=.*[a-z])|(?=.*\\d)(?=.*\\W)(?=.*[A-Z])|(?=.*[a-z])(?=.*\\W)(?=.*[A-Z])|(?=.*[a-z])(?=.*\\d)(?=.*[A-Z]))^.{8,16}$";
    
    //[-`=\\\[\\];',./~!@#$%^&*()_+|{}:\"<>?]
    NSString * pattern7 = @"((?=.*\\d)(?=.*[-`=\\\[\\];',./~!@#$%^&*()_+|{}:\"<>?])(?=.*[a-z])|(?=.*\\d)(?=.*[-`=\\\[\\];',./~!@#$%^&*()_+|{}:\"<>?])(?=.*[A-Z])|(?=.*[a-z])(?=.*[-`=\\\[\\];',./~!@#$%^&*()_+|{}:\"<>?])(?=.*[A-Z])|(?=.*[a-z])(?=.*\\d)(?=.*[A-Z]))^.{8,16}$";
    
    NSString * shuzi = @"aaa1111111.,";//@"AAAAAAAAAAAZ8/";
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern7];
    BOOL isValid = [predicate evaluateWithObject:shuzi];
    
    NSLog(@"===========>>>>%@",names);
}


- (NSMutableArray *)itemsForPattern:(NSString *)pattern captureGroupIndex:(NSUInteger)index andStr:(NSString *)kStr
{
    if ( !pattern )
        return nil;
    
    NSError *error = nil;
    NSRegularExpression *regx = [[NSRegularExpression alloc] initWithPattern:pattern
                                                                     options:NSRegularExpressionCaseInsensitive error:&error];
    if (error)
    {
        
    }
    else
    {
        NSMutableArray *results = [[NSMutableArray alloc] init];
        NSRange searchRange = NSMakeRange(0, [kStr length]);
        [regx enumerateMatchesInString:kStr options:0 range:searchRange usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
            
            NSRange groupRange =  [result rangeAtIndex:index];
            NSString *match = [kStr substringWithRange:groupRange];
            [results addObject:match];
        }];
        
        return results;
    }
    
    return nil;
}




-(void)demo16
{
    BerserViewController * vc = [[BerserViewController alloc]init];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
}

-(void)demo15
{
    RichTextViewController * vc = [[RichTextViewController alloc]init];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
}


-(void)demo14
{
    PlistViewController * vc = [[PlistViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo13
{
    SemaphoreViewController * vc = [[SemaphoreViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo12
{
    ShopViewController * vc = [[ShopViewController alloc]init];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
}

-(void)demo10
{
    KokTableViewController * vc = [[KokTableViewController alloc]init];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
}


-(void)demo9
{
    TakePhotoViewController * vc = [[TakePhotoViewController alloc]init];
    self.window.rootViewController = vc;
    
}
-(void)demo8
{
    RunloopViewController * vc = [[RunloopViewController alloc]init];
    self.window.rootViewController = vc;

}

-(void)demo7
{
    DispatchVC * vc = [[DispatchVC alloc]init];
    self.window.rootViewController = vc;
}


-(void)demo5
{
    URLSessionViewController * vc = [[URLSessionViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo4
{
    labelMoveViewController * vc = [[labelMoveViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo3
{
    NCViewController * vc = [[NCViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo2
{
    Demo2ViewController * vc = [[Demo2ViewController alloc]init];
    self.window.rootViewController = vc;
}

-(void)demo1
{
    NSMutableArray * arr = [[NSMutableArray alloc]initWithCapacity:1];
    
    PersonModel * p1 = [[PersonModel alloc]init];
    p1.name = @"大叔";
    p1.age = 10;
    
    PersonModel * p2 = [[PersonModel alloc]init];
    p2.name = @"崔智友";
    p2.age = 27;
    
    PersonModel * p3 = [[PersonModel alloc]init];
    p3.name = @"智孝";
    p3.age = 25;
    
    PersonModel * p6 = [[PersonModel alloc]init];
    p6.name = @"多尔衮";
    p6.age = 10;
    
    PersonModel * p4 = [[PersonModel alloc]init];
    p4.name = @"允儿";
    p4.age = 20;
    
    PersonModel * p5 = [[PersonModel alloc]init];
    p5.name = @"宝儿";
    p5.age = 10;

    [arr addObject:p1];
    [arr addObject:p2];
    [arr addObject:p3];
    [arr addObject:p4];
    [arr addObject:p5];
    [arr addObject:p6];
    
    NSArray * cSortArr = [arr sortedArrayUsingComparator:^NSComparisonResult(PersonModel *p1, PersonModel *p2) {
        return [p1.name localizedStandardCompare:p2.name];
    }];
    
    
    NSArray * sortArr = [arr sortedArrayUsingComparator:^NSComparisonResult(PersonModel * p1, PersonModel *p2) {
        return [p1.name localizedStandardCompare:p2.name];
    }];
//    NSSortDescriptor * sortDescri = [NSSortDescriptor sortDescriptorWithKey:@"_name" ascending:YES];
//    NSArray * sortArr = [arr sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescri]];
    
   //NSArray * sortArr = [arr sortedArrayUsingFunction:nickNameSort context:NULL];
    
    for(PersonModel * p in sortArr)
    {
        NSLog(@"=====>>>>%@",p.name);
    }
    
}


NSInteger nickNameSort(id user1, id user2, void *context)
{
    PersonModel *u1,*u2;
    //类型转换
    u1 = (PersonModel*)user1;
    u2 = (PersonModel*)user2;
    return  [u1.name localizedCompare:u2.name
             ];
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"-------");
    return YES;
}

@end
