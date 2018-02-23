//
//  ViewController.m
//  01_OC
//
//  Created by Rocky on 2018/2/23.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self createNewThread1];
//    [self createNewThread2];
//    [self createNewThread3];
}


- (void)createNewThread1{
    //创建线程
    NSThread * thread = [[NSThread alloc] initWithBlock:^{
        //执行任务
        NSLog(@"执行任务 %@",[NSThread currentThread]);
    }];
    
    //启动线程
    [thread start];
}

- (void)createNewThread2{
    
    //会自动启动线程
    [NSThread detachNewThreadWithBlock:^{
        NSLog(@"detach thread %@",[NSThread currentThread]);
    }];
}

- (void)createNewThread3{
    
    [self performSelectorInBackground:@selector(run:) withObject:@"start background thread"];
}

- (void)run:(NSString *)param{
    NSLog(@"run %@",[NSThread currentThread]);
}
@end
