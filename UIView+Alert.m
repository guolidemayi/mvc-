//
//  UIView+Alert.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/14.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "UIView+Alert.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>


@implementation UIView (Alert)



static void *HUDKEY = &HUDKEY; //分配储存空间
- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HUDKEY);
}
- (void)setHUD:(MBProgressHUD *)HUD{
    //设置属性的对象，属性值存储位置，属性值，内存管理策略
    objc_setAssociatedObject(self, HUDKEY, HUD,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)showHUD{
    [self showHUDWithText:@""];
    
}
- (void)showHUDWithText:(NSString *)text{
    MBProgressHUD *hud = [self HUD];
    if (hud == nil) {
        hud = [[MBProgressHUD alloc]initWithView:[UIApplication sharedApplication].keyWindow];
        hud.dimBackground = NO;
        hud.removeFromSuperViewOnHide = YES;
        [self setHUD:hud];
    }
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    hud.labelText = text;
    [hud show:YES];
}

- (void)hideHUD{
    [[self HUD] hide:YES];
}
@end
