//
//  JSKVONotifying_Person.m
//  03-响应式编程思想
//
//  Created by leo on 17/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSKVONotifying_Person.h"

#import <objc/runtime.h>

@implementation JSKVONotifying_Person

- (void)setAge:(int)age {
    [super setAge:age];
    
    // 通知观察者，属性改变
    id observer = objc_getAssociatedObject(self, @"observer");
    
    [observer observeValueForKeyPath:@"age" ofObject:self change:nil context:nil];
    
}

@end
