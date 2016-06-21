//
//  UITableView+Category.m
//  ceshi
//
//  Created by csc on 16/5/6.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "UITableView+Category.h"
#import <objc/runtime.h>

static const char *hideSectionKey = "hideSectionKey";
static const char *defaultCellHeightKey = "defaultCellHeightKey";;

@implementation UITableView (Category)

-(void)hideSection:(NSInteger)section
{
    if([self.csc_hideSections containsIndex:section])
    {
        [self.csc_hideSections removeIndex:section];
    }else
    {
        [self.csc_hideSections addIndex:section];
    }
    [self reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}


-(NSMutableIndexSet *)csc_hideSections
{
    NSMutableIndexSet * set = objc_getAssociatedObject(self, &hideSectionKey);
    if(set == nil)
    {
        set = [NSMutableIndexSet indexSet];
        objc_setAssociatedObject(self, &hideSectionKey, set, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return set;
}


-(void)setDefaultCellHeight:(CGFloat)defaultCellHeight
{
    objc_setAssociatedObject(self, &defaultCellHeightKey, @(defaultCellHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat)defaultCellHeight
{
    return [objc_getAssociatedObject(self, &defaultCellHeightKey) floatValue];
}

-(CGFloat)configSectionHeightInSection:(NSInteger)section
{
    if([self.csc_hideSections containsIndex:section])
    {
        return 0;
    }else
    {
        return self.defaultCellHeight;
    }
}


@end
