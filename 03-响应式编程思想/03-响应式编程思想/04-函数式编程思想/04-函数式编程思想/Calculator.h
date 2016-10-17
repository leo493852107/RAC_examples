//
//  Calculator.h
//  04-函数式编程思想
//
//  Created by leo on 17/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//  计算

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

/** result */
@property (nonatomic, assign) int result;

/** isEqual */
@property (nonatomic, assign) BOOL isEqual;


- (instancetype)add:(int(^)(int result))block;

- (instancetype)equal:(BOOL(^)(int result))block;

@end
