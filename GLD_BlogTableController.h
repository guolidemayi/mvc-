//
//  GLD_BlogTableController.h
//  mvc
//
//  Created by yiyangkeji on 2017/6/13.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLD_NetworkApiMannager.h"

typedef UIViewController *(^vcPushHandlerBlock)(id patam);

@interface GLD_BlogTableController : NSObject<UITableViewDelegate,UITableViewDataSource>

+ (instancetype)instanceWithUserId:(NSInteger)userId;

- (UITableView *)tableView;
- (void)fetchDataWithCompletionHandler:(NetworkCompletionHandler)completionHandler;

- (void)setVcBlock:(vcPushHandlerBlock)vcBlock;
@end
