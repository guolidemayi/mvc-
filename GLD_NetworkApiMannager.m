//
//  GLD_NetworkApiMannager.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/13.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "GLD_NetworkApiMannager.h"
#import "User.h"
#import "Blog.h"
#import "Draf.h"

@interface GLD_NetworkApiMannager ()
@property (assign, nonatomic) NSUInteger blogPage;
@property (assign, nonatomic) NSUInteger drafPage;
@end

@implementation GLD_NetworkApiMannager



- (void)fetchUserInfoWithUserId:(NSUInteger)userId completionHandler:(NetworkCompletionHandler)completionHandler {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        !completionHandler ?: completionHandler(nil, [[User alloc] initWithUserId:userId]);
    });
}

- (void)refreshUserBlogsWithUserId:(NSUInteger)userId completionHandler:(NetworkCompletionHandler)completionHandler {
    
    self.blogPage = 0;
    [self fetchUserBlogsWithUserId:userId page:self.blogPage pageSize:10 completionHandler:completionHandler];
}

- (void)loadModeUserBlogsWithUserId:(NSUInteger)userId completionHandler:(NetworkCompletionHandler)completionHandler {
    
    self.blogPage += 1;
    [self fetchUserBlogsWithUserId:userId page:self.blogPage pageSize:10 completionHandler:completionHandler];
}
- (void)refreshUserDrafsWithUserId:(NSUInteger)userId completionHandler:(NetworkCompletionHandler)completionHandler {
    
    self.drafPage = 0;
    [self fetchUserDrafsWithUserId:userId page:self.drafPage pageSize:10 completionHandler:completionHandler];
}

- (void)loadModeUserDrafsWithUserId:(NSUInteger)userId completionHandler:(NetworkCompletionHandler)completionHandler {
    
    self.drafPage += 1;
    [self fetchUserDrafsWithUserId:userId page:self.drafPage pageSize:10 completionHandler:completionHandler];
}



- (void)fetchUserBlogsWithUserId:(NSUInteger)userId page:(NSUInteger)page pageSize:(NSUInteger)pageSize completionHandler:(NetworkCompletionHandler)completionHandler {
    
    NSUInteger delayTime = page == 0 ? 1.5 : 1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (page >= 2) {
            !completionHandler ?: completionHandler([NSError errorWithDomain:@"没有更多了" code:NetworkErrorNoMoreData userInfo:nil], nil);
        } else {
            
            NSMutableArray *blogs = [NSMutableArray array];
            for (int i = 0; i < pageSize; i ++) {
                [blogs addObject:[[Blog alloc] initWithBlogId:pageSize * page + i]];
            }
            !completionHandler ?: completionHandler(nil, blogs);
        }
    });
}

- (void)fetchUserDrafsWithUserId:(NSUInteger)userId page:(NSUInteger)page pageSize:(NSUInteger)pageSize completionHandler:(NetworkCompletionHandler)completionHandler {
    
    NSUInteger delayTime = page == 0 ? 1.5 : 1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (page >= 2) {
            !completionHandler ?: completionHandler([NSError errorWithDomain:@"没有更多了" code:NetworkErrorNoMoreData userInfo:nil], nil);
        } else {
            
            NSMutableArray *drafs = [NSMutableArray array];
            for (int i = 0; i < pageSize; i ++) {
                [drafs addObject:[[Draf alloc]instanceWithDarf:pageSize * page + i]];
            }
            !completionHandler ?: completionHandler(nil, drafs);
        }
    });
}
@end
