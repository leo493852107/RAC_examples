//
//  ViewController.m
//  02-链式编程思想(计算器)
//
//  Created by leo on 16/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorMaker.h"
#import "NSObject+Calculator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // add(1).add(2)
    // 10+20+30+40
    // 链式编程思想，maker.add(10).add(20).add(30)
//    CalculatorMaker *maker = [[CalculatorMaker alloc] init];
    
    // 提供一个没有参数的add方法，返回值block
//    int result = [[[[[maker add:10] add:20] add:30] add:40] result];
    
//    int result = [maker.add(10).add(20).add(30).add(40) result];
    
//    NSLog(@"%d", result);
    
    NSLog(@"begin");
    
    // block：使代码高聚合
    int result = [NSObject makeCalculator:^(CalculatorMaker *maker) {
        // 把所有的计算代码都封装到这里
        maker.add(10);
        maker.add(20);
        maker.add(30).add(40);
        
    }];
    
    NSLog(@"%d",result);
    
}



@end
