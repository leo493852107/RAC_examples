//
//  Calculator.m
//  04-函数式编程思想
//
//  Created by leo on 17/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

//- (instancetype)add:(int)num {
//    _result += num;
//    
//    return self;
//}

- (instancetype)add:(int (^)(int result))block {
    _result = block(_result);
    
    return self;
}

- (instancetype)equal:(BOOL (^)(int))block {
    _isEqual = block(_result);
    
    return self;
}

@end
