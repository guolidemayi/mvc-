//
//  GLD_NetworkApiMannager.h
//  mvc
//
//  Created by yiyangkeji on 2017/6/13.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^NetworkCompletionHandler)(NSError *error, id result);
typedef enum : NSUInteger {
    NetworkErrorNoData,
    NetworkErrorNoMoreData
} NetworkError;

@interface GLD_NetworkApiMannager : NSObject

- (void)fetchUserInfoWithUserId:(NSUInteger)userId completionHandler:(NetworkCompletionHandler)completionHandler;

- (void)refreshUserBlogsWithUserId:(NSUInteger)userId completionHandler:(NetworkCompletionHandler)completionHandler;
- (void)loadModeUserBlogsWithUserId:(NSUInteger)userId completionHandler:(NetworkCompletionHandler)completionHandler;


- (void)loadModeUserDrafsWithUserId:(NSUInteger)userId completionHandler:(NetworkCompletionHandler)completionHandler;
- (void)refreshUserDrafsWithUserId:(NSUInteger)userId completionHandler:(NetworkCompletionHandler)completionHandler;
@end
