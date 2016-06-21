//
//  YBWalletPro.h
//  WalletPaySDK
//
//  Created by fengbing on 16/2/17.
//  Copyright © 2016年 fengbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YBOrder.h"

@interface YBWalletPro : NSObject

/**
 *  启动SDK入口
 *
 *  @param viewController    页面进入
 *  @param order 订单信息
 */
+(void)enterViewController:(UIViewController *)viewController andOrder:(YBOrder *)order andBackType:(void(^)(YBBackAppType backType))backApp;

/**
 *  商户签名  测试用
 *
 */
+(void)createMercSigne:(YBOrder *)order andSuccess:(void(^)(NSString *signStr))success andFaile:(void(^)(NSString *errorStr))fail;

@end
