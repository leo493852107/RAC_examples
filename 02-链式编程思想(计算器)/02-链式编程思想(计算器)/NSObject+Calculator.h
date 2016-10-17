//
//  NSObject+Calculator.h
//  02-链式编程思想(计算器)
//
//  Created by leo on 16/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorMaker.h"

@interface NSObject (Calculator)

// 以后计算都用这个方法，一调用这个方法就返回结果
+ (int)makeCalculator:(void (^)(CalculatorMaker *maker))block;

@end
