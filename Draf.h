//
//  Draf.h
//  mvc
//
//  Created by yiyangkeji on 2017/6/14.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Draf : NSObject
@property (copy, nonatomic) NSString *darfTitle;
@property (copy, nonatomic) NSString *darfSummary;
- (instancetype)instanceWithDarf:(NSInteger)darf;
@end
