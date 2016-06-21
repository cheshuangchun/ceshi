//
//  YBFBTools.m
//  PaySDKTest
//
//  Created by FBI on 16/4/25.
//  Copyright © 2016年 fengbing. All rights reserved.
//

#import "YBFBTools.h"

@implementation YBFBTools
+(NSString *)orderTimeDateFormatterData
{
    NSDateFormatter *theDataFormatter=[[NSDateFormatter alloc]init];
    theDataFormatter.dateFormat=@"yyyyMMdd";
    
    
    NSString *theTime=[theDataFormatter stringFromDate:[NSDate date]];
    return theTime;
    
}

/**
 *  订单过期时间
 *
 *  @return <#return value description#>
 */
+(NSString *)orderExtTimeDateFormatterData
{
    NSDateFormatter *theDataFormatter=[[NSDateFormatter alloc]init];
    theDataFormatter.dateFormat=@"yyyyMMddHHmmss";
    
   NSDate *theDate = [NSDate dateWithTimeIntervalSinceNow:10*60];//返回当前时间10秒后的时间

    NSString *theTime=[theDataFormatter stringFromDate:theDate];
    return theTime;
    
}
/**
 *  创建订单号
 *
 *  @return <#return value description#>
 */
+(NSString *)createOrderNo
{
    return [NSString stringWithFormat:@"YB%@",[YBFBTools orderExtTimeDateFormatterData]];
}
/**
 *  模拟网路请求  签名
 */
+(void)requestMercSign:(YBOrder *)order andSuccess:(void(^)(NSString *signStr))success andFail:(void(^)(NSString *errStr))fail
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
        //
        NSString *requestURL=@"http://10.63.1.20:8999/gatewayTerminal/mercsign/sign";
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL ]];
        [request setHTTPMethod:@"POST"];
        
        [request setAllowsCellularAccess:YES];
        [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];

        
        NSError *error=nil;
        NSData *jsonData=[NSJSONSerialization dataWithJSONObject:theTempParams options:NSJSONWritingPrettyPrinted error:&error];
        
        
        [request setHTTPBody:jsonData];
        
        NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        
        NSURLSession *theSession=[NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
        
        
        NSLog(@"param==%@",[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding]);
        
        
        NSURLSessionDataTask  *dataTask=[theSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            ;
            NSLog(@"data=%@res=%@=error=%@",data,response,error);
            
            NSLog(@"data==%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
            if(!error)
            {
            NSDictionary *theJosn=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            
           
                success(theJosn[@"merchantSign"]);
                
            }else
            {
               // fail(theJosn[@"respMsg"]);
                
            }
            
            
        }];
        [dataTask resume];
             
        
        
        
    }
    
}
/**
 *  订单列表
 *
 
 */
+(void)requestMercOrderInfo:(NSString *)mercNo andOrderNo:(NSString *)orderNo andSuccess:(void(^)(NSDictionary *resultArr))success andFail:(void(^)(NSString *errStr))fail
{
    if(mercNo&&orderNo)
    {
        NSDictionary *theTempParams=@{@"mercId":mercNo,@"mercOrdNo":orderNo};

    NSString *requestURL=@"http://10.63.3.40:11100/ulpay-cashier-front/order/getodrinfo";
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL ]];
    [request setHTTPMethod:@"POST"];
    
    [request setAllowsCellularAccess:YES];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    
    
    NSError *error=nil;
    NSData *jsonData=[NSJSONSerialization dataWithJSONObject:theTempParams options:NSJSONWritingPrettyPrinted error:&error];
    
    
    [request setHTTPBody:jsonData];
    
    NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    
    NSURLSession *theSession=[NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    
    
    NSLog(@"param==%@",[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding]);
    
    
    NSURLSessionDataTask  *dataTask=[theSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        ;
        NSLog(@"data=%@res=%@=error=%@",data,response,error);
        
        NSLog(@"data==%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        if(!error)
        {
        NSDictionary *theJosn=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        
            success(theJosn);
            
        }else
        {
            // fail(theJosn[@"respMsg"]);
            fail(@"接口不通或者网络正确");
            
        }
        
        
    }];
    [dataTask resume];
    }
}

+(void)showAction
{
    dispatch_async(dispatch_get_main_queue(), ^{

    CGRect rect=[[UIScreen mainScreen] bounds];
    
    UIActivityIndicatorView *view=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(rect.size.width/2-30, rect.size.height/2-30, 60, 60)];
    view.activityIndicatorViewStyle=UIActivityIndicatorViewStyleGray;
    [view startAnimating];
    view.tag=10086;
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    });
                   
}
+(void)HideActivity
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIActivityIndicatorView *view=[[UIApplication sharedApplication].keyWindow viewWithTag:10086];
        [view stopAnimating];
        [view removeFromSuperview];
        
    });
   
    
}

@end
