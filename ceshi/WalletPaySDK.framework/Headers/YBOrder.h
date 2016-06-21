//
//  YBOrder.h
//  PaySDKTest
//
//  Created by FBI on 16/3/31.
//  Copyright © 2016年 fengbing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  NS_ENUM(NSInteger,YBBackAppType)
{
    YBUserCancel=2,//用户取消支付
    YBOrderPaySuccess,//支付成功
    YBOrderPayFail,// 支付失败
    
    
};
/**
 *   创建订单信息
 */
@interface YBOrder : NSObject
/**
 *  商户编号
 */
@property(strong,nonatomic)NSString *mercID;
/**
 *  商户订单编号
 */
@property(strong,nonatomic)NSString *mercOrdNo;
/**
 *  订单建立时间
 */
@property(strong,nonatomic)NSString *orderCreateTime;
/**
 *   订单过期时间
 */
@property(strong,nonatomic)NSString *orderExpTime;
/**
 *  消费金额
 */
@property(strong,nonatomic)NSString *aplAMT;

/**
 *  实际消费金额
 */
@property(strong,nonatomic)NSString *actAmt;
/**
 *  币种 默认人民币
 */
@property(strong,nonatomic)NSString *saleCCY;

/**
 *  通知商户后台URL
 */
@property(strong,nonatomic)NSString *retURL;
/**
 * 通知 商户前端URL
 */
@property(strong,nonatomic)NSString *notifyURL;
/**
 *   用途
 */
@property(strong,nonatomic)NSString *userStr;
/**
 *  交易来源IP
 */
@property(strong,nonatomic)NSString *renoteIP;


/**
 *  商户签名
 */
@property(strong,nonatomic)NSString *merchanSign;

//remoteMac
/**
 *  mac地址
 */
@property(strong,nonatomic)NSString *remoteMac;

@property(strong,nonatomic)NSString *theDeviceID;


@end
