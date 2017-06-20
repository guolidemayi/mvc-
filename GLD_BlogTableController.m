//
//  GLD_BlogTableController.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/13.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "GLD_BlogTableController.h"

#import "GLD_BlogCellHelper.h"
#import "MJRefresh.h"
#import "GLD_BlogCell.h"
#import "UIView+Controller.h"

@interface GLD_BlogTableController ()

@property(nonatomic, assign)NSInteger userId;

@property(nonatomic, strong)UITableView *tableView;
//请求接口
@property (nonatomic, strong)GLD_NetworkApiMannager *apiManager;
//数据
@property(nonatomic,strong)NSMutableArray<GLD_BlogCellHelper *> *bolgs;

@property (nonatomic, copy)vcPushHandlerBlock vcBlock;

@end

@implementation GLD_BlogTableController
+ (instancetype)instanceWithUserId:(NSInteger)userId{
    return [[GLD_BlogTableController alloc] initBlogTableControllerWith:userId];
    
}

- (instancetype)initBlogTableControllerWith:(NSInteger)userId{
    
    self = [super init];
    if (self) {
        
        self.userId = userId;
        self.bolgs = [NSMutableArray arrayWithCapacity:0];
        self.apiManager = [GLD_NetworkApiMannager new];
        [self tableView];
    }
    
    return self;
}

#pragma mark - InterFace
- (void)fetchDataWithCompletionHandler:(NetworkCompletionHandler)completionHandler{
    __weak typeof (self) weakSelf = self;
    [weakSelf.apiManager refreshUserBlogsWithUserId:weakSelf.userId completionHandler:^(NSError *error, id result) {
        if (error) {
            
        }else{
            [weakSelf reloadTableViewWithBolgs:result];
        }
        !completionHandler ?: completionHandler(error, result);
    }];
    
}


#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bolgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GLD_BlogCellHelper *cellHelper = self.bolgs[indexPath.row];
    GLD_BlogCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GLD_BlogCell"];
    if (cell) {
        
        [cell setTitle:[cellHelper blogTitleText]];
        [cell setLikeState:[cellHelper isLiked]];
        [cell setSummary:[cellHelper blogSummaryText]];
        [cell setLikeCountText:[cellHelper blogLikeCountText]];
        [cell setShareCountText:[cellHelper blogShareCountText]];
        
        
    };
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.vcBlock) {
      UIViewController *vc = self.vcBlock(self.bolgs[indexPath.row]);
        if (vc) {
            [self.tableView.gld_navigationController pushViewController:vc animated:YES];
        }
    }
    
}

//数据处理
- (void)reloadTableViewWithBolgs:(NSArray *)bolgs{
    for (Blog *bolg in bolgs) {
        [self.bolgs addObject:[GLD_BlogCellHelper helperWithBlog:bolg]];
    }
    [self.tableView reloadData];
    
}
//懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        __weak typeof (self) weakSelf = self;
        [_tableView registerClass:[GLD_BlogCell class] forCellReuseIdentifier:@"GLD_BlogCell"];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           
            [weakSelf.apiManager refreshUserBlogsWithUserId:weakSelf.userId completionHandler:^(NSError *error, id result) {
                [weakSelf.tableView.header endRefreshing];
                if (error) {
                    
                }else{
                    [weakSelf.bolgs removeAllObjects];
                     [weakSelf reloadTableViewWithBolgs:result];
                }
            }];
        }];
        
        _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            
            [weakSelf.apiManager loadModeUserBlogsWithUserId:weakSelf.userId completionHandler:^(NSError *error, id result) {
                [weakSelf.tableView.footer endRefreshing];
                if (error) {
                    
                }else{
                    
                    [weakSelf reloadTableViewWithBolgs:result];
                    
                }
            }];
        }];
        
    }
    return _tableView;
}


@end
