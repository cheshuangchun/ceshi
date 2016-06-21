//
//  YBFBTools.h
//  PaySDKTest
//
//  Created by FBI on 16/4/25.
//  Copyright © 2016年 fengbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WalletPaySDK/WalletPaySDK.h>

@interface YBFBTools : NSObject


/**
 *  订单生成时间
 *
 *  @return <#return value description#>
 */
+(NSString *)orderTimeDateFormatterData;

/**
 *  订单过期时间
 *
 *  @return <#return value description#>
 */
+(NSString *)orderExtTimeDateFormatterData;
/**
 *  创建订单号
 *
 *  @return <#return value description#>
 */
+(NSString *)createOrderNo;


/**
 *  模拟网路请求  签名
 */
+(void)requestMercSign:(YBOrder *)order andSuccess:(void(^)(NSString *signStr))success andFail:(void(^)(NSString *errStr))fail;
/**
 *  订单列表
 *

 */
+(void)requestMercOrderInfo:(NSString *)mercNo andOrderNo:(NSString *)orderNo andSuccess:(void(^)(NSDictionary *resultArr))success andFail:(void(^)(NSString *errStr))fail;

+(void)showAction;
+(void)HideActivity;


@end
