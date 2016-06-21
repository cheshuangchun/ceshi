//
//  CSPeople.m
//  ceshi
//
//  Created by csc on 16/4/26.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSPeople.h"

@implementation CSPeople
-(id)initWithDic:(NSDictionary *)dic;
{
    self = [super init];
    if(self)
    {
        self.categoriesId = dic[@"categoriesId"];
        self.forumDesc = dic[@"forumDesc"];
        self.forumId = dic[@"forumId"];
        self.forumName = dic[@"forumName"];
        self.forumSort = [dic[@"forumSort"] integerValue];
    }
    return self;
    
}
@end
