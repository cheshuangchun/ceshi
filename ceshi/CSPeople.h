//
//  CSPeople.h
//  ceshi
//
//  Created by csc on 16/4/26.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSPeople : NSObject
@property (strong, nonatomic) NSString * categoriesId;
@property (strong, nonatomic) NSString * forumDesc;
@property (strong, nonatomic) NSString * forumId;
@property (strong, nonatomic) NSString * forumName;
@property (assign, nonatomic) NSInteger  forumSort;

-(id)initWithDic:(NSDictionary *)dic;
@end
