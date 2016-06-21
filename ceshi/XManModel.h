//
//  XManModel.h
//  ceshi
//
//  Created by csc on 16/6/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XManModel : NSObject
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSArray * fruits;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
