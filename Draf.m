//
//  Draf.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/14.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "Draf.h"

@implementation Draf

- (instancetype)instanceWithDarf:(NSInteger)darf{
    self.darfSummary = [NSString stringWithFormat:@"darfSummary%ld", darf];
    
    self.darfTitle = [NSString stringWithFormat:@"darfTitle%ld", darf];
    return self;
}
@end
