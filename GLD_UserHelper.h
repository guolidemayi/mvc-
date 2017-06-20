//
//  GLD_UserHelper.h
//  mvc
//
//  Created by yiyangkeji on 2017/6/14.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface GLD_UserHelper : NSObject

+ (instancetype)UserHelper:(User *)user;

- (UIImage *)IconImage;
- (NSString *)nameText;
- (NSString *)workText;
- (NSString *)summaryText;
- (NSString *)friendsText;
@end
