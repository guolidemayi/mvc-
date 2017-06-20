//
//  UIView+Controller.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/13.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "UIView+Controller.h"

@implementation UIView (Controller)


//遍历响应者链条，找到UIViewController
- (UIViewController *)gld_ViewController{
    UIResponder *next = [self nextResponder];
    do{
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
        
    } while(next != nil);
    
    
    return nil;
}
- (UINavigationController *)gld_navigationController{
    return self.gld_ViewController.navigationController;
}
@end
