//
//  NSObject+KVO.h
//  03-响应式编程思想
//
//  Created by leo on 17/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)JS_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
