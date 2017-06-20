//
//  ViewController.m
//  mvc
//
//  Created by yiyangkeji on 2017/6/12.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "ViewController.h"
#import "GLD_UserViewController.h"

@interface ViewController ()

@property (nonatomic, strong)dispatch_queue_t chuanxingQueue;

@property (nonatomic, strong)dispatch_queue_t bingfaQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label;
    [self.view addSubview:label];
    
    
    self.chuanxingQueue = dispatch_queue_create("jafljldj", DISPATCH_QUEUE_SERIAL);
    self.bingfaQueue = dispatch_queue_create("bingfa", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(self.bingfaQueue, ^{
        // NSLog(@"1");
        sleep(3);
        NSLog(@"1 = %@",[NSThread currentThread]);
        dispatch_sync(self.chuanxingQueue, ^{
            
            
            NSLog(@"6 = %@",[NSThread currentThread]);
            
        });
    });
    dispatch_sync(self.chuanxingQueue, ^{
        
        sleep(1);
        NSLog(@"2 = %@",[NSThread currentThread]);
        
    });
    dispatch_async(self.bingfaQueue, ^{
        NSLog(@"3= %@",[NSThread currentThread]);
    });
    dispatch_sync(self.bingfaQueue, ^{
        sleep(5);
        NSLog(@"4= %@",[NSThread currentThread]);
    });
    
    dispatch_async(self.bingfaQueue, ^{
        
        NSLog(@"5= %@",[NSThread currentThread]);
        dispatch_sync(self.chuanxingQueue, ^{
            
            
            NSLog(@"7 = %@",[NSThread currentThread]);
            
        });
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)mvc:(UIButton *)sender {
    [self.navigationController pushViewController:[GLD_UserViewController instanceWithUserId:sender.tag] animated:YES];
}

- (IBAction)mvp:(UIButton *)sender {
}
- (IBAction)mvvm:(UIButton *)sender {
}

@end
