//
//  ViewController.m
//  GCD_快速迭代
//
//  Created by Rocky on 2018/2/26.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self apply];
}

- (void)apply{
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"------%zu-----------%@",index,[NSThread currentThread]);
    });
    
}


@end
