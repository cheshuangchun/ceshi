//
//  YBWebH5TextViewController.m
//  PaySDKTest
//
//  Created by FBI on 16/5/9.
//  Copyright © 2016年 fengbing. All rights reserved.
//

#import "YBWebH5TextViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "YBFBTools.h"
@interface YBWebH5TextViewController ()<UIWebViewDelegate,UIAlertViewDelegate>

@property(strong,nonatomic)UIWebView *theWeb;
@property(strong,nonatomic)NSString *theTitle;


@end

@implementation YBWebH5TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    [self createWebView];
    
    // Do any additional setup after loading the view.
}
#pragma mark 创建web
-(void)createWebView
{
    if(self.theWeb)
    {
     
        [self.theWeb removeFromSuperview];
    }
    self.view.backgroundColor=[UIColor blackColor];
    
    self.theWeb =[[UIWebView alloc]initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-20)];
    self.theWeb.delegate=self;
    self.theWeb.scalesPageToFit=YES;
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    [self.view addSubview:self.theWeb];
//10.62.8.92:8080/ulpay-cashier-front-action
//10.63.8.92:8080/ulpay-cashier-front-action/web/pay/
    //http://10.63.1.20:8880/cashier-front-web/web/pay/toh5index
    NSURL *url = [NSURL URLWithString: @"http://10.63.3.40:11100/ulpay-cashier-front/web/pay/toh5index"];
   // NSString *body = [self createOrderInfo:self.theOrder];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
    [request setHTTPMethod: @"POST"];
    NSString  *theStr=[NSString stringWithFormat:@"mercId=%@&mercOrdNo=%@&ordDt=%@&ordExpDt=%@&actAmt=%@&aplAmt=%@&ccy=%@&retUrl=%@&notifyUrl=%@&use=%@&remoteIp=%@&merchantSign=%@&remoteMac%@&deviceId=%@",self.theOrder.mercID,self.theOrder.mercOrdNo,self.theOrder.orderCreateTime,self.theOrder.orderExpTime,self.theOrder.actAmt,self.theOrder.aplAMT,self.theOrder.saleCCY,self.theOrder.retURL,self.theOrder.notifyURL,self.theOrder.userStr,self.theOrder.renoteIP,[self URLEncodedString:self.theOrder.merchanSign],self.theOrder.remoteMac,self.theOrder.theDeviceID];
    [request setHTTPBody: [theStr dataUsingEncoding:NSUTF8StringEncoding]];
    [self.theWeb loadRequest: request];
    
    

 }
#pragma mark 订单信息拼装
-(NSData *)createOrderInfo:(YBOrder *)order
{
    
 if(order)
{
    NSMutableDictionary *theTempParams=[NSMutableDictionary dictionaryWithCapacity:6];
    
    if(order.mercID)
    {
        [theTempParams setValue:order.mercID forKey:@"mercId"];
    }
    
    if(order.mercOrdNo)
    {
        [theTempParams setValue:order.mercOrdNo forKey:@"mercOrdNo"];
        
    }
    
    if(order.orderCreateTime)
    {
        [theTempParams setValue:order.orderCreateTime forKey:@"ordDt"];
    }
    if(order.orderExpTime)
    {
        [theTempParams setValue:order.orderExpTime forKey:@"ordExpDt"];
    }
    
    if(order.actAmt)
    {
        [theTempParams setValue:order.actAmt forKey:@"actAmt"];
        
    }
    
    if(order.aplAMT)
    {
        [theTempParams setValue:order.aplAMT forKey:@"aplAmt"];
        
        
    }
    
    
    if(order.saleCCY)
    {
        [theTempParams setObject:order.saleCCY forKey:@"ccy"];
        
    }
    if(order.retURL)
    {
        [theTempParams setValue:order.retURL forKey:@"retUrl"];
    }
    if(order.renoteIP)
    {
        [theTempParams setValue:order.renoteIP forKey:@"remoteIp"];
    }
    if(order.notifyURL)
    {
        [theTempParams setValue:order.notifyURL forKey:@"notifyUrl"];
    }
    
    if(order.userStr)
    {
        [theTempParams setValue:order.userStr forKey:@"use"];
    }
    if(order.remoteMac)
    {
        [theTempParams setValue:order.remoteMac forKey:@"remoteMac"];
    }
    if(order.theDeviceID)
    {
        [theTempParams setValue:order.theDeviceID forKey:@"deviceId"];
        
    }
    [theTempParams setValue:[self URLEncodedString:order.merchanSign] forKey:@"merchanSign"];
     NSData *theJosnData=[NSJSONSerialization dataWithJSONObject:theTempParams options:NSJSONWritingPrettyPrinted error:nil];
    return theJosnData;
    
}
    
   
return nil;

}
//    NSString *theStr=@"";
//
//    theStr=[NSString stringWithFormat:@"mercId=%@&mercOrdNo=%@&ordDt=%@&ordExpDt=%@&actAmt=%@&aplAmt=%@&ccy=%@&retUrl=%@&notifyUrl=%@&use=%@&remoteIp=%@&merchantSign=%@&remoteMac%@&deviceId=%@",self.theOrder.mercID,self.theOrder.mercOrdNo,self.theOrder.orderCreateTime,self.theOrder.orderExpTime,self.theOrder.actAmt,self.theOrder.aplAMT,self.theOrder.saleCCY,self.theOrder.retURL,self.theOrder.notifyURL,self.theOrder.userStr,self.theOrder.renoteIP,self.theOrder.merchanSign,self.theOrder.remoteMac,self.theOrder.theDeviceID];
//    
//    
//    return [self URLEncodedString:theStr];
    

- (NSString *)URLEncodedString:(NSString *)url
{
    
    /*
     SString *newString =
     
     CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
     
     (CFStringRef)self,
     
     NULL,
     
     CFSTR(":/?#[]@!$ &'()*+,;="<>%{}|^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
     
     if (newString) {
     
     return newString;
     
     }
     

     */
    
    NSString *newString=CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)url, NULL, CFSTR("!$&'()*+,-./:;=?@_~%#[]"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
    
    //NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)url,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    return newString;
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [YBFBTools showAction ];
    NSLog(@"webViewDidStartLoad");
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [YBFBTools HideActivity];
    NSLog(@"webViewDidFinishLoad");
    
  NSString *jsToGetHTMLSource = @"document.getElementsByTagName('html')[0].innerHTML";

    
    NSString *HTMLSource = [self.theWeb stringByEvaluatingJavaScriptFromString:jsToGetHTMLSource];
    
    NSLog(@"neirong%@",HTMLSource);
    
    NSString *getHTMLTitle = @"document.getElementsByTagName('h2')[0].innerHTML";
    
    NSString *titleHTMLSource = [self.theWeb stringByEvaluatingJavaScriptFromString:getHTMLTitle];
    self.theTitle=titleHTMLSource;
    
    
    NSLog(@"titleHTMLSourc=%@",titleHTMLSource);
    
//    NSString *jsFunctStr=@"goToSource()";
//    [context evaluateScript:jsFunctStr];
    
  /*  NSString *getHTMLSource = @"document.getElementsByTagName('html')[0].innerHTML";

//    NSString *jsbackGetHTMLSource = @"document.getElementById('a_back_index')[0]";
//    
    NSString *backSource = [self.theWeb stringByEvaluatingJavaScriptFromString:getHTMLSource];
//
   */
    NSString *getHTMLSourceA=@"document.getElementById('a_back_index').href='http://fdfd.com'";

    NSString *backA = [self.theWeb stringByEvaluatingJavaScriptFromString:getHTMLSourceA];

    NSLog(@"backA==%@",backA);

    ;
    if(!([backA length]>0))
    {
        NSString *getHTMLSourceClose=@"document.getElementById('a_close_pay').href='http://fdfd.com'";
        
        backA= [self.theWeb stringByEvaluatingJavaScriptFromString:getHTMLSourceClose];
        NSLog(@"backA==%@",backA);

    }
    if(!([backA length]>0))
    {
        getHTMLSourceA=@"document.getElementById('finishePayBtn').onclick='javascript:window.location.href=‘http://fdfd.com’";
        backA= [self.theWeb stringByEvaluatingJavaScriptFromString:getHTMLSourceA];
    }
    NSLog(@"backA==%@",backA);


    __weak YBWebH5TextViewController *ht5=self;
    
    JSContext *context = [[JSContext alloc] init];
    
    context = [self.theWeb valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context.exceptionHandler = ^(JSContext *con, JSValue *exception) {
        NSLog(@"%@", exception);
        con.exception = exception;
    };
    //    context[@"log"] = ^() {
    //        NSArray *args = [JSContext currentArguments];
    //        for (id obj in args) {
    //            NSLog(@"%@",obj);
    //        }
    //    };
    
    
    context[@"goToSource"] = ^() {
        
        NSLog(@"+++++++Begin Log+++++++");
        //       JSValue *result = [function callWithArguments:nil];
        //       NSLog(@"c(10) = %@", result);
        //object Window
        JSValue *args = [JSContext currentThis];
        NSLog(@"args=%@", args);
        if([ht5.theTitle isEqual:@"付款结果"])
        {
            [ht5 dismissViewControllerAnimated:YES completion:nil];
            
        }
        
        //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"方式二" message:@"这是OC原生的弹出窗" delegate:nil cancelButtonTitle:@"收到" otherButtonTitles:nil];
        //        //[alertView show];
        //
        //        for (JSValue *jsVal in args) {
        //            NSLog(@"%@", jsVal.toString);
        //        }
        //
        
        JSValue *argContent = [JSValue valueWithNewObjectInContext:[JSContext currentContext]];
        NSLog(@"argContent=%@", argContent);
        
        NSLog(@"-------End Log-------");
    };
    
    if(!([self.theTitle length]>0))
    {
        
    [self createBackButton:HTMLSource];
    }

}
#pragma mark 返回按钮
-(void)createBackButton:(NSString *)htmlStr
{
    UIButton *theBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    theBtn.frame=CGRectMake(20, 120, CGRectGetWidth(self.view.frame), 300) ;
    [theBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [theBtn setTitle:[NSString stringWithFormat:@"失败点击关闭，html页面内容=%@",htmlStr] forState:UIControlStateNormal];
    theBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    theBtn.titleLabel.numberOfLines=0;
    theBtn.titleLabel.minimumScaleFactor=.5;
    [self.theWeb addSubview:theBtn];
    [theBtn addTarget:self action:@selector(backVC) forControlEvents:UIControlEventTouchUpInside];
    
    
}
#pragma mark 返回
-(void)backVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [YBFBTools HideActivity];

    NSLog(@"didFailLoadWithError＝＝%@",error);
    
    NSString *jsToGetHTMLSource = @"document.getElementsByTagName('title')[0].innerHTML";
    
    NSString *HTMLSource = [self.theWeb stringByEvaluatingJavaScriptFromString:jsToGetHTMLSource];
    
    NSLog(@"%@",HTMLSource);


}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    
   
    NSString *urlstr = request.URL.absoluteString;
    NSLog(@"fsfs==%@",urlstr);
    //付款结果<
    if(navigationType ==UIWebViewNavigationTypeLinkClicked)
    {
        if([urlstr hasSuffix:@"fdfd.com/"]||[urlstr hasSuffix:@"fdfd.com"])
        {
            
            UIAlertView *theAler=[[UIAlertView alloc]initWithTitle:@"提示" message:@"确定要取消付款?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@" 确定", nil];
            [theAler show];
            
            return NO;
            
            
        }
    }else if([self.theTitle isEqual:@"支付完成"])
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    
     NSLog(@"shouldStartLoadWithRequest==%@==%@==Moth=%@==%@",request.allHTTPHeaderFields,[[NSString alloc]initWithData:request.HTTPBody encoding:NSUTF8StringEncoding] ,request.HTTPMethod,request.URL);
    
    return
    
    YES;
    

//    NSLog(@"shouldStartLoadWithRequest==%@==%@==Moth=%@==%@",request.allHTTPHeaderFields,[[NSString alloc]initWithData:request.HTTPBody encoding:NSUTF8StringEncoding] ,request.HTTPMethod,request.URL);

    return YES;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        [self dismissViewControllerAnimated:YES completion:nil];

        
    }else
    {
        
    }
}

-(void)backNativeOnclink:(NSString *)param
{
    NSLog(@"fsdf==%@",param);
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
