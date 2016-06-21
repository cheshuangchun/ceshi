//
//  CoretextCell.h
//  ceshi
//
//  Created by csc on 16/5/13.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSCoreTextView.h"
#import "CSTextHeightCal.h"
@interface CoretextCell : UITableViewCell
{
    CSCoreTextView * coreView;
    
}
-(void)setModel:(CSTextHeightCal *)model;
@end
