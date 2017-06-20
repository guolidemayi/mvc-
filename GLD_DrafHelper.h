//
//  GLD_DrafHelper.h
//  mvc
//
//  Created by yiyangkeji on 2017/6/14.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Draf.h"

@interface GLD_DrafHelper : NSObject
+ (instancetype)drafHelper:(Draf *)draf;

- (NSString *)titleText;
- (NSString *)summaryText;
@end
