//
//  CSTextView.h
//  ceshi
//
//  Created by csc on 16/4/21.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSTextView : UIView
@property (nonatomic, strong) NSAttributedString  * attrEmotionString;

@property (nonatomic, strong) NSArray * emotionNames;

@property (nonatomic, assign) BOOL isDraw;

@property (nonatomic, assign) BOOL isFold;

- (void)setOldString:(NSString *)oldString andNewString:(NSString *)newString;

@end
