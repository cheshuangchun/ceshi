//
//  ShopCell.h
//  ceshi
//
//  Created by csc on 16/4/14.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef   void(^shopBtnBlock)(NSInteger tag);
@interface ShopCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton * reduceBtn;
@property (weak, nonatomic) IBOutlet UIButton * addBtn;
@property (weak, nonatomic) IBOutlet UITextField * NoTf;
@property (strong, nonatomic) shopBtnBlock shopBlock;
@end
