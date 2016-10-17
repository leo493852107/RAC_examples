//
//  CalculatorMaker.h
//  02-链式编程思想(计算器)
//
//  Created by leo on 16/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//  计算器

#import <Foundation/Foundation.h>

@interface CalculatorMaker : NSObject

/** result */
@property (nonatomic, assign) int result;


// +
//- (instancetype)add:(int)num;

- (CalculatorMaker *(^)(int num))add;

// -

// *

// /

@end
