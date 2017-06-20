//
//  GLD_DrafCell.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/14.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "GLD_DrafCell.h"

@interface GLD_DrafCell ()
@property (weak, nonatomic)  UILabel *titleLabel;
@property (weak, nonatomic)  UILabel *summaryLabel;




@end

@implementation GLD_DrafCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupUI];
        [self layout];
    }
    return self;
}



#pragma mark - Interface

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)setSummary:(NSString *)summary {
    self.summaryLabel.text = summary;
}



- (void)setupUI{
    
    
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

}
@end
