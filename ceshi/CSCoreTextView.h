//
//  CSCoreTextView.h
//  ceshi
//
//  Created by csc on 16/5/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSCoreTextView : UIView

@property (nonatomic, strong) NSAttributedString * attrEmotionString;
@property (assign, nonatomic) BOOL isDraw;

-(void)setOldString:(NSString *)oldString andXinString:(NSString *)xinString;

-(float)getTextHeight;
@end
