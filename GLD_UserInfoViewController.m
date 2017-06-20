//
//  GLD_UserInfoViewController.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/13.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "GLD_UserInfoViewController.h"
#import "GLD_UserHelper.h"
#import "GLD_NetworkApiMannager.h"

@interface GLD_UserInfoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *work;
@property (weak, nonatomic) IBOutlet UILabel *friends;
@property (weak, nonatomic) IBOutlet UILabel *summary;

@property(assign, nonatomic)NSInteger userId;
@end

@implementation GLD_UserInfoViewController

+ (instancetype)instanceUserInfo:(NSUInteger)userId{
    GLD_UserInfoViewController *userInfoVc = [[GLD_UserInfoViewController alloc]initWith:userId];
    return userInfoVc;
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)viewHeight{
    return 240;
}

- (void)fetchData{
    
    __weak typeof (self) weakSelf = self;
    [[GLD_NetworkApiMannager new] fetchUserInfoWithUserId:self.userId completionHandler:^(NSError *error, id result) {
        if (error == nil) {
            GLD_UserHelper *userHelp = [GLD_UserHelper UserHelper:result];
            weakSelf.iconImageV.image = userHelp.IconImage;
            weakSelf.name.text = userHelp.nameText;
            weakSelf.friends.text = userHelp.friendsText;
            weakSelf.summary.text = userHelp.summaryText;
            weakSelf.work.text = userHelp.workText;
        }
        
    }];
}

@end
