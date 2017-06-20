//
//  GLD_UserHelper.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/14.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "GLD_UserHelper.h"

@interface GLD_UserHelper ()
@property (nonatomic, strong)User *user;

@end

@implementation GLD_UserHelper

+ (instancetype)UserHelper:(User *)user{
    GLD_UserHelper *userH = [GLD_UserHelper new];
    userH.user = user;
    return userH;
}

- (UIImage *)IconImage{
    return [UIImage imageNamed:self.user.icon];
}

- (NSString *)nameText{
    return [NSString stringWithFormat:@"用户名：%@",self.user.name];
}

- (NSString *)workText{
    return [NSString stringWithFormat:@"作品：%zd", self.user.blogCount];
}
- (NSString *)summaryText{
    return [NSString stringWithFormat:@"个人简介：%@", self.user.summary];
}

- (NSString *)friendsText{
    return [NSString stringWithFormat:@"好友：%zd", self.user.friendCount];
}
@end
