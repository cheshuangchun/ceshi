//
//  UITableView+Category.h
//  ceshi
//
//  Created by csc on 16/5/6.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Category)
//设置默认高度
@property (nonatomic, assign) CGFloat defaultCellHeight;
//隐藏某个section
-(void)hideSection:(NSInteger)section;
//存储隐藏section的集合
-(NSMutableIndexSet *)csc_hideSections;
//计算cell高度
-(CGFloat)configSectionHeightInSection:(NSInteger)section;

@end
