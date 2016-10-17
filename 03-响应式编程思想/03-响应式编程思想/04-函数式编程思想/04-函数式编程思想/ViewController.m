//
//  ViewController.m
//  04-函数式编程思想
//
//  Created by leo on 17/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController

// 什么是函数式思想：把一个操作写成一系列的方法。
// 需求：写一个加法计算器，并且加法计算器自带判断是否等于某个值
- (void)viewDidLoad {
    [super viewDidLoad];
    
    Calculator *cal = [[Calculator alloc] init];
    
    // 10+20+30+40
//    [[[[cal add:10] add:20] add:30] add:40];
    
//    int result = [[cal add:^(int result){
//        // 把计算的事情写到block中
//        
//        result += 10;
//        result += 20;
//        result += 30;
//        result += 40;
//        
//        return result;
//    }] result];

    BOOL isEqual = [[[cal add:^(int result){
        // 把计算的事情写到block中
        
        result += 10;
        result += 20;
        result += 30;
        result += 40;
        
        return result;
    }] equal:^BOOL(int result) {
    
        return result == 100;
    }] isEqual];

    
//    NSLog(@"%d", result);
    
    NSLog(@"%d", isEqual);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
