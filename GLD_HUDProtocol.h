//
//  GLD_HUDProtocol.h
//  mvc
//
//  Created by yiyangkeji on 2017/6/14.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GLD_HUDProtocol <NSObject>
- (void)showHUD;
- (void)hideHUD;
- (void)showHUDWithText:(NSString *)text;
@end
