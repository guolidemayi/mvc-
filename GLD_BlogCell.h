//
//  GLD_BlogCell.h
//  mvc
//
//  Created by yiyangkeji on 2017/6/13.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLD_BlogCell : UITableViewCell
- (void)setTitle:(NSString *)title;
- (void)setSummary:(NSString *)summary;
- (void)setLikeState:(BOOL)isLiked;
- (void)setLikeCountText:(NSString *)likeCountText;
- (void)setShareCountText:(NSString *)shareCountText;

- (void)setDidLikeHandler:(void(^)())didLikeHandler;
@end
