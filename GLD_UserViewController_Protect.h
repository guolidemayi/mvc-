//
//  GLD_UserViewController_Protect.h
//  mvc
//
//  Created by yiyangkeji on 2017/6/13.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "GLD_UserViewController.h"

#import "GLD_BlogTableController.h"
#import "GLD_UserInfoViewController.h"

@interface GLD_UserViewController ()

@property (assign, nonatomic) NSUInteger userId;

@property (strong, nonatomic) GLD_BlogTableController *blogVC;
@property (strong, nonatomic) GLD_UserInfoViewController *userInfoVC;

- (void)setupUI;
- (void)fetchData;
- (void)configuration;
@end
