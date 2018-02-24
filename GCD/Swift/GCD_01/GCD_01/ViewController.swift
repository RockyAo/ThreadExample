//
//  ViewController.swift
//  GCD_01
//
//  Created by Rocky on 2018/2/24.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        syncSerial()
//        syncConcurrent()
//        asyncSerial()
//        asyncConcurrent()
//        获取全局队列
//        let queue = DispatchQueue.global()
    }
    
    ///同步串行
    func syncSerial()  {
        let queue = DispatchQueue(label: "com.download.serial", qos: .default)
        
        queue.sync {
            
            print("download xxxxx 11111 \(Thread.current)")
        }
        
        queue.sync {
            
            print("download xxxxx 22222 \(Thread.current)")
        }
        
        queue.sync {
            
            print("download xxxxx 33333 \(Thread.current)")
        }
    }
    
    ///同步并行
    func syncConcurrent() {
        let queue = DispatchQueue(label: "com.download.concurrent", qos: .default, attributes: .concurrent)
        
        queue.sync {
            
            print("download xxxxx 11111 \(Thread.current)")
        }
        
        queue.sync {
            
            print("download xxxxx 22222 \(Thread.current)")
        }
        
        queue.sync {
            
            print("download xxxxx 33333 \(Thread.current)")
        }
    }
    
    /// 异步串行
    func asyncSerial()  {
        
        let queue = DispatchQueue(label: "com.download.serial", qos: .default)
        
        queue.sync {
            
            print("download xxxxx 11111 \(Thread.current)")
        }
        
        queue.sync {
            
            print("download xxxxx 22222 \(Thread.current)")
        }
        
        queue.sync {
            
            print("download xxxxx 33333 \(Thread.current)")
        }
    }
    
    /// 异步并行
    func asyncConcurrent() -> Void {
        let queue = DispatchQueue(label: "com.download.concurrent", qos: .default, attributes: .concurrent)
        
        queue.async {
            
            print("download xxxxx 11111 \(Thread.current)")
        }
        
        queue.async {
            
            print("download xxxxx 22222 \(Thread.current)")
        }
        
        queue.async {
            
            print("download xxxxx 33333 \(Thread.current)")
        }
    }
}

