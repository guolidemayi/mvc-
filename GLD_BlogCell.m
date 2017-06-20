//
//  GLD_BlogCell.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/13.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "GLD_BlogCell.h"


@interface GLD_BlogCell ()
@property (weak, nonatomic)  UILabel *titleLabel;
@property (weak, nonatomic)  UILabel *summaryLabel;
@property (weak, nonatomic)  UIButton *likeButton;
@property (weak, nonatomic)  UIButton *shareButton;

@property (copy, nonatomic) void(^didLikeHandler)();
@end

@implementation GLD_BlogCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupUI];
        [self layout];
    }
    return self;
}


#pragma mark - Action

- (IBAction)onClickLikeButton:(UIButton *)sender {
    !self.didLikeHandler ?: self.didLikeHandler();
}

#pragma mark - Interface

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)setSummary:(NSString *)summary {
    self.summaryLabel.text = summary;
}

- (void)setLikeState:(BOOL)isLiked {
    [self.likeButton setTitleColor:isLiked ? [UIColor redColor] : [UIColor blackColor] forState:UIControlStateNormal];
}

- (void)setLikeCountText:(NSString *)likeCountText {
    [self.likeButton setTitle:likeCountText forState:UIControlStateNormal];
}

- (void)setShareCountText:(NSString *)shareCountText {
    [self.shareButton setTitle:shareCountText forState:UIControlStateNormal];
}

- (void)setupUI{
    UIButton *like = [[UIButton alloc]init];
    
    self.likeButton = like;
    
    [self.contentView addSubview:like];
    
    UIButton *share = [[UIButton alloc]init];
    
    self.shareButton = share;;
    [self.contentView addSubview:share];
    
    UILabel *title = [[UILabel alloc]init];
    self.titleLabel = title;
    [self.contentView addSubview:title];
    
    
    UILabel *symmary = [[UILabel alloc]init];
    self.summaryLabel = symmary;
    [self.contentView addSubview:symmary];
    
}

- (void)layout{
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.summaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
    
    
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(self.contentView);
        
    }];
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.shareButton.mas_right).offset(-10);
        make.centerY.equalTo(self.contentView);
    }];
}
@end
