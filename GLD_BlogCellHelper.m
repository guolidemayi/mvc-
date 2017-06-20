//
//  GLD_BlogCellHelper.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/13.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "GLD_BlogCellHelper.h"


@interface GLD_BlogCellHelper ()
@property (strong, nonatomic) Blog *blog;

@end

@implementation GLD_BlogCellHelper

+ (instancetype)helperWithBlog:(Blog *)blog {//懒
    GLD_BlogCellHelper *helper = [GLD_BlogCellHelper new];
    helper.blog = blog;
    return helper;
}

- (BOOL)isLiked {
    return self.blog.isLiked;
}

- (NSString *)blogTitleText {
    return self.blog.blogTitle.length > 0 ? self.blog.blogTitle : @"未命名";
}

- (NSString *)blogSummaryText {
    return self.blog.blogSummary.length > 0 ? [NSString stringWithFormat:@"摘要: %@", self.blog.blogSummary] : @"这个人很懒, 什么也没有写...";
}

- (NSString *)blogLikeCountText {
    return [NSString stringWithFormat:@"赞 %ld", self.blog.likeCount];
}

- (NSString *)blogShareCountText {
    return [NSString stringWithFormat:@"分享 %ld", self.blog.shareCount];
}

- (NSString *)description{
    
    return [NSString stringWithFormat:@"%d", self.isLiked];
}

@end
