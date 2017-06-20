//
//  GLD_UserViewController.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/13.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "GLD_SelfViewController.h"
#import "GLD_UserViewController_Protect.h"
#import "UIView+Alert.h"

@interface GLD_UserViewController ()

@end

@implementation GLD_UserViewController

+ (instancetype)instanceWithUserId:(NSInteger)userId{
    if (userId == 123) {
        return [[GLD_UserViewController alloc]initWith:userId];
    }
    
    return [[GLD_SelfViewController alloc]initWith:userId];
}

- (instancetype)initWith:(NSInteger)userId{
    self = [super init];
    if (self) {
        self.userId = userId;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configuration];
    [self setupUI];
    [self fetchData];
}

- (void)configuration{
    self.title = [NSString stringWithFormat:@"用户%ld", self.userId];
    self.view.backgroundColor = [UIColor whiteColor];
    self.blogVC = [GLD_BlogTableController instanceWithUserId:self.userId];
    [self.blogVC setVcBlock:^(id patam) {
        NSLog(@"%@",[patam description]);
        UIViewController *vc = [[UIViewController alloc]init];
        vc.title = @"tttttt";
        return vc;
    }];
    
    self.userInfoVC = [GLD_UserInfoViewController instanceUserInfo:self.userId];
    
    [self addChildViewController:self.userInfoVC];
}

- (void)setupUI{
    [self.view addSubview:self.userInfoVC.view];
    
    [self.userInfoVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@([self.userInfoVC viewHeight]));
    }];
    
    [self.view addSubview:self.blogVC.tableView];
    [self.blogVC.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.userInfoVC.view.mas_bottom);
    }];
}

- (void)fetchData{
    
    [self.userInfoVC fetchData];
    [self.view showHUD];
    [self.blogVC fetchDataWithCompletionHandler:^(NSError *error, id result) {
        [self.view hideHUD];
    }];
}

@end
