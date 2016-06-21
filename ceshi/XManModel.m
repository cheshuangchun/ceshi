//
//  XManModel.m
//  ceshi
//
//  Created by csc on 16/6/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "XManModel.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation XManModel
-(instancetype)initWithDictionary:(NSDictionary *)dic;
{
    self = [super init];
    if(self)
    {
        for (NSString * key in dic.allKeys) {
            id value = [dic objectForKey:key];
            SEL setter = [self propertySetterWithKey:key];
            if(setter)
            {
                ((void (*)(id,SEL,id))objc_msgSend)(self,setter,value);
            }
            
        }
    }
    
    return self;
}



-(SEL)propertySetterWithKey:(NSString *)key
{
    NSString * propertySetter = key.capitalizedString;
    propertySetter = [NSString stringWithFormat:@"set%@:",propertySetter];
    
    SEL setter = NSSelectorFromString(propertySetter);
    
    if([self respondsToSelector:setter])
        return setter;
    return nil;
    
    
}

@end
