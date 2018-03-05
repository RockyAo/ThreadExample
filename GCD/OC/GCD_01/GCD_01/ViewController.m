//
//  ViewController.m
//  GCD_01
//
//  Created by Rocky on 2018/2/24.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self asyncSerial];
    [self syncSerial];
//    获取全局并发队列
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}

//同步串行
-(void)syncSerial{
    
    dispatch_queue_t queue = dispatch_queue_create("com.download.serial", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        NSLog(@"download xxxxxxx1111 %@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download xxxxxxx2222 %@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download xxxxxxx3333 %@",[NSThread currentThread]);
    });
}


//同步并发（任务串行）
- (void)syncConcurrent{
    
    dispatch_queue_t queue = dispatch_queue_create("com.xxxxx", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        NSLog(@"download xxxxxxx %@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download xxxxxxx2222 %@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download xxxxxxx3333 %@",[NSThread currentThread]);
    });
}

// 异步串行
- (void)asyncSerial{
    
    dispatch_queue_t queue = dispatch_queue_create("com.download.serial", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        NSLog(@"download xxxxxxx1111 %@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download xxxxxxx2222 %@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download xxxxxxx3333 %@",[NSThread currentThread]);
    });
}

///一步函数+ 并发队列
- (void)asyncConcurrent{
    
    //DISPATCH_QUEUE_CONCURRENT 并发
    //DISPATCH_QUEUE_SERIAL 串行
    dispatch_queue_t queue = dispatch_queue_create("com.xxxxx", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"download xxxxxxx %@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download xxxxxxx2222 %@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download xxxxxxx3333 %@",[NSThread currentThread]);
    });
}

- (void)asyncMain{
    
}

@end
