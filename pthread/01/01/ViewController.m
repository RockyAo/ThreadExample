//
//  ViewController.m
//  01
//
//  Created by Rocky on 2018/2/23.
//  Copyright © 2018年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnClick:(id)sender {
    
    //创建线程结构体
    pthread_t thread;
    
    /*
     pthread_t  _Nullable *restrict _Nonnull :线程结构体地址
     const pthread_attr_t *restrict _Nullable :线程的属性
     void * _Nullable (* _Nonnull)(void * _Nullable): 指向函数的指针
     void *restrict _Nullable： 函数需要接受的参数
     */
    pthread_create(&thread, NULL, task, NULL);
    
}

void *task(void *param){
    
    NSLog(@"%@---------",[NSThread currentThread]);
    
    return  NULL;
}

@end
