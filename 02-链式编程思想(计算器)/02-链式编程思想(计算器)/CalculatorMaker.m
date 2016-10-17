//
//  CalculatorMaker.m
//  02-链式编程思想(计算器)
//
//  Created by leo on 16/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "CalculatorMaker.h"

//static int _result;

@implementation CalculatorMaker

//- (instancetype)add:(int)num {
//    _result += num;
//    return self;
//}

- (CalculatorMaker * (^)(int num))add {
    return ^(int num) {
        NSLog(@"计算，返回CalculatorMaker");
        _result += num;
        return self;
    };
}

@end
