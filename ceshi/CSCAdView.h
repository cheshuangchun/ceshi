//
//  CSCAdView.h
//  ceshi
//
//  Created by csc on 16/6/14.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSCAdView : UIView

/**
 *  图片数组
 */
@property (strong, nonatomic) NSMutableArray * imgArray;

/**
 *  更新图片显示
 */
-(void)updateScrollView;

@end
