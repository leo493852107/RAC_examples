//
//  NSObject+Calculator.m
//  02-链式编程思想(计算器)
//
//  Created by leo on 16/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "NSObject+Calculator.h"

#import "CalculatorMaker.h"

@implementation NSObject (Calculator)

+ (int)makeCalculator:(void (^)(CalculatorMaker *))block {
    // 创建计算制造者
    CalculatorMaker *maker = [[CalculatorMaker alloc] init];
    NSLog(@"before block");
    // 计算
    block(maker);
    
    NSLog(@"after block");
    
    return maker.result;
}

@end
