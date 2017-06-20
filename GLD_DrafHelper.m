//
//  GLD_DrafHelper.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/14.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "GLD_DrafHelper.h"

@interface GLD_DrafHelper ()

@property(nonatomic, strong)Draf *draf;
@end

@implementation GLD_DrafHelper

+ (instancetype)drafHelper:(Draf *)draf{
    GLD_DrafHelper *drafHelp = [[GLD_DrafHelper alloc]initWith:draf];
    return drafHelp;
}
- (instancetype)initWith:(Draf *)draf{
    self = [super init];
    if (self) {
        self.draf = draf;
    }
    return self;
}

- (NSString *)titleText{
    return self.draf.darfTitle.length > 0 ? self.draf.darfTitle : @"未命名";
}
- (NSString *)summaryText{
    return self.draf.darfSummary.length > 0 ? self.draf.darfSummary:@"无内容";
}
@end
