//
//  UIButton+ButtonSwizzle.m
//  ceshi
//
//  Created by csc on 16/5/17.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "UIButton+ButtonSwizzle.h"
#import <objc/runtime.h>

static const char * c_acceptInter = "c_acceptInter";
static const char * c_ignore      = "c_ignore";
@implementation UIButton (ButtonSwizzle)
+(void)load
{
//    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
//    Method b = class_getInstanceMethod(self, @selector(__csc_sendAction:to:forEvent:));
//    //改变两个方法的实现
//    method_exchangeImplementations(a, b);
}


-(NSTimeInterval)cs_acceptInterval
{
    return [objc_getAssociatedObject(self, c_acceptInter) doubleValue];
}

-(void)setCs_acceptInterval:(NSTimeInterval)cs_acceptInterval
{
    objc_setAssociatedObject(self, c_acceptInter, @(cs_acceptInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)ignoreEvent
{
    return [objc_getAssociatedObject(self, c_ignore) boolValue];
}

-(void)setIgnoreEvent:(BOOL)ignoreEvent
{
    objc_setAssociatedObject(self, c_ignore, @(ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



-(void)__csc_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event;
{
    if(self.ignoreEvent) return;
    if(self.cs_acceptInterval >0)
    {
        self.ignoreEvent = YES;
        [self performSelector:@selector(setIgnoreEvent:) withObject:@(NO) afterDelay:self.cs_acceptInterval];
    }
    //调用系统实现
    [self __csc_sendAction:action to:target forEvent:event];
}


@end
