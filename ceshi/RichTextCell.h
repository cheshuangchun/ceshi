//
//  RichTextCell.h
//  ceshi
//
//  Created by csc on 16/4/18.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSCCoreText.h"
#import "RichModel.h"
@interface RichTextCell : UITableViewCell
{
    CSCCoreText * coreTx;
}

-(void)setMessage:(RichModel *)model;

@end
