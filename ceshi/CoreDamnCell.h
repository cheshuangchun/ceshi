//
//  CoreDamnCell.h
//  ceshi
//
//  Created by csc on 16/5/16.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSCoreTextView.h"
#import "CSTextHeightCal.h"
@interface CoreDamnCell : UITableViewCell
{
    CSCoreTextView * cTextView;
}
@property (weak, nonatomic) IBOutlet UIImageView * headView;
-(void)setModel:(CSTextHeightCal *)model;
@end
